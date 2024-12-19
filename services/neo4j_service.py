from neo4j import GraphDatabase

class Neo4jService:
    def __init__(self, uri, user, password):
        self.driver = GraphDatabase.driver(uri, auth=(user, password))

    def close(self):
        self.driver.close()

    def get_health_context_by_person(self, person_name):
        query = """
        MATCH (p:Person {name: $person_name})
        OPTIONAL MATCH (p)-[:HAS_SYMPTOM]->(s:Symptom)-[:CAUSES]->(d:Disease)
        OPTIONAL MATCH (p)-[:CONFIRMED]->(cd:Disease)
        OPTIONAL MATCH (p)-[:IS_FAMILY]->(f:Person)
        RETURN 
            s.name AS symptom, 
            d.name AS possible_disease, 
            cd.name AS confirmed_disease, 
            f.name AS family_member
        ORDER BY s.name, d.name
        """
        with self.driver.session() as session:
            results = session.run(query, person_name=person_name)
            health_data = [
                {
                    "symptom": record["symptom"],
                    "possible_disease": record["possible_disease"],
                    "confirmed_disease": record["confirmed_disease"],
                    "family_member": record["family_member"]
                }
                for record in results
            ]
        return health_data
