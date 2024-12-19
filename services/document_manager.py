import os
import json
from haystack.document_stores.in_memory import InMemoryDocumentStore
from haystack import Document
from haystack.components.embedders import SentenceTransformersDocumentEmbedder

class DocumentManager:
    _instance = None

    def __new__(cls):
        if cls._instance is None:
            cls._instance = super().__new__(cls)
            cls._instance.document_store = InMemoryDocumentStore()
            cls._instance.load_documents()
        return cls._instance

    def load_documents(self):
        if os.path.exists("persisted_documents.json"):
            with open("persisted_documents.json", "r") as f:
                documents_data = json.load(f)
                documents = [Document.from_dict(doc) for doc in documents_data]
            self.document_store.write_documents(documents)
        else:
            with open("base_documents.json", "r") as f:
                base_data = json.load(f)
            docs = [Document(content=doc["content"]) for doc in base_data]
            docs = self.ensure_embeddings(docs)
            self.document_store.write_documents(docs)
            with open("persisted_documents.json", "w") as f:
                json.dump([doc.to_dict() for doc in docs], f)

    def ensure_embeddings(self, docs):
        if any(doc.embedding is None for doc in docs):
            doc_embedder = SentenceTransformersDocumentEmbedder(model="sentence-transformers/all-MiniLM-L6-v2")
            doc_embedder.warm_up()
            docs_with_embeddings = doc_embedder.run(docs)["documents"]
            return docs_with_embeddings
        return docs

    def get_document_store(self):
        return self.document_store
