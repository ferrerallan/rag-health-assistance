from services.config import Config
from services.ner_service import extract_person_name
from services.neo4j_service import Neo4jService
from services.document_manager import DocumentManager
from pipelines.rag_pipeline import create_pipeline

def main():
    neo4j_service = Neo4jService(Config.NEO4J_URI, Config.NEO4J_USER, Config.NEO4J_PASSWORD)
    document_manager = DocumentManager()
    document_store = document_manager.get_document_store()
    rag_pipeline = create_pipeline(document_store)

    while True:
        question = input("Question: ")
        if question.lower() == "exit":
            break

        person_name = extract_person_name(question)
        if not person_name:
            print("I couldn't identify a person in your question. Please try again.")
            continue

        # Query Neo4j for symptoms, diseases, and family context
        health_data = neo4j_service.get_health_context_by_person(person_name)
        if not health_data:
            print(f"No health data found for {person_name}.")
            continue

        # Generate Neo4j context for RAG
        neo4j_context = "\n".join([
            f"Symptom: {r.get('symptom', 'N/A')}, Possible Disease: {r.get('possible_disease', 'N/A')}, Confirmed Disease: {r.get('confirmed_disease', 'N/A')}, Family Member: {r.get('family_member', 'N/A')}"
            for r in health_data
        ]) or f"No relevant health data found for {person_name}."

        # Pass the question and Neo4j context to the RAG pipeline
        response = rag_pipeline.run({
            "text_embedder": {"text": question},
            "prompt_builder": {"question": question, "additional_context": neo4j_context}
        })

        print(response["llm"]["replies"][0].text)

    neo4j_service.close()

if __name__ == "__main__":
    main()
