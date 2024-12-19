
# RAG Health Assistance

## Description

RAG Health Assistance is a Knowledge Graph-driven Retrieval-Augmented Generation (RAG) application that integrates Neo4j, natural language processing (NLP), and OpenAI's GPT models to answer user questions regarding health-related contexts. It leverages personal health information stored in a Neo4j database and combines it with an InMemoryDocumentStore for retrieval of additional context, enabling robust and context-aware responses.

Key features:
- Identifies the person in the user's query using Named Entity Recognition (NER).
- Retrieves relevant health data such as symptoms, possible diseases, and family history from Neo4j.
- Enhances answers by incorporating insights from preloaded documents using a retrieval pipeline.
- Employs OpenAI's GPT model to generate well-informed responses to health-related questions.

This application demonstrates the potential of combining graph databases, NLP, and AI models to offer personalized, context-aware assistance in healthcare scenarios.

## Requirements

- Python 3.8 or higher
- Neo4j 4.4 or higher
- Dependencies listed in `requirements.txt`

### Environment Variables
The following environment variables must be set:
- `NEO4J_URI`: Neo4j Database URI
- `NEO4J_USER`: Neo4j Username
- `NEO4J_PASSWORD`: Neo4j Password
- `OPENAI_API_KEY`: OpenAI API Key

## Mode of Use

1. **Clone the repository:**
   ```bash
   git clone https://github.com/ferrerallan/rag-health-assistance.git
   ```

2. **Navigate to the project directory:**
   ```bash
   cd rag-health-assistance
   ```

3. **Install dependencies:**
   ```bash
   pip install -r requirements.txt
   ```

4. **Set up the Neo4j database:**
   - Start your Neo4j server and log in to the Neo4j Browser.
   - Load the `db.cypher` script into the Neo4j database to populate the graph.

5. **Run the application:**
   ```bash
   python app.py
   ```

6. **Interact with the application:**
   - Input health-related questions (e.g., "What is the health status of Alice?").
   - Type "exit" to terminate the program.

### Example Workflow
1. Question: `What are Alice's symptoms?`
2. Output: Details about Alice's health context, possible diseases, and family-related insights, if any.

## Implementation Details
The project employs:
- **Neo4j Graph Database**: Stores relationships between individuals, symptoms, diseases, and family history.
- **Named Entity Recognition (NER)**: Extracts names of individuals from user queries.
- **Haystack's InMemoryDocumentStore**: Facilitates retrieval of contextual health-related documents.
- **OpenAI's GPT**: Generates detailed, context-aware responses.

By combining these technologies, RAG Health Assistance offers intelligent, contextually enriched answers for user queries, making it a valuable tool for health data insights.
