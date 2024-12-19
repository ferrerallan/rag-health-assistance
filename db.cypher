// Create people (Person)
CREATE (:Person {name: 'Alice', age: 35}),
       (:Person {name: 'Bob', age: 40}),
       (:Person {name: 'Charlie', age: 28}),
       (:Person {name: 'Diana', age: 30}),
       (:Person {name: 'Eve', age: 50}),
       (:Person {name: 'Frank', age: 55}),
       (:Person {name: 'Grace', age: 25}),
       (:Person {name: 'Hank', age: 60}),
       (:Person {name: 'Ivy', age: 32}),
       (:Person {name: 'Jack', age: 45}),
       (:Person {name: 'Karen', age: 29}),
       (:Person {name: 'Leo', age: 48}),
       (:Person {name: 'Mona', age: 22}),
       (:Person {name: 'Nina', age: 38}),
       (:Person {name: 'Oscar', age: 52}),
       (:Person {name: 'Paul', age: 34}),
       (:Person {name: 'Quinn', age: 27}),
       (:Person {name: 'Rita', age: 49}),
       (:Person {name: 'Sam', age: 36}),
       (:Person {name: 'Tina', age: 24});

// Create symptoms (Symptom)
CREATE (:Symptom {name: 'Fever'}),
       (:Symptom {name: 'Cough'}),
       (:Symptom {name: 'Fatigue'}),
       (:Symptom {name: 'Headache'}),
       (:Symptom {name: 'Sore Throat'}),
       (:Symptom {name: 'Shortness of Breath'}),
       (:Symptom {name: 'Muscle Pain'}),
       (:Symptom {name: 'Runny Nose'}),
       (:Symptom {name: 'Nausea'}),
       (:Symptom {name: 'Loss of Smell'});

// Create diseases (Disease)
CREATE (:Disease {name: 'Influenza'}),
       (:Disease {name: 'Migraine'}),
       (:Disease {name: 'Asthma'}),
       (:Disease {name: 'Chronic Fatigue Syndrome'}),
       (:Disease {name: 'Common Cold'}),
       (:Disease {name: 'Bronchitis'}),
       (:Disease {name: 'Pneumonia'});

// Link symptoms to diseases (CAUSES)
MATCH (s:Symptom {name: 'Fever'}), (d:Disease {name: 'Influenza'})
CREATE (s)-[:CAUSES]->(d);

MATCH (s:Symptom {name: 'Cough'}), (d:Disease {name: 'Influenza'})
CREATE (s)-[:CAUSES]->(d);

MATCH (s:Symptom {name: 'Fatigue'}), (d:Disease {name: 'Influenza'})
CREATE (s)-[:CAUSES]->(d);

MATCH (s:Symptom {name: 'Headache'}), (d:Disease {name: 'Migraine'})
CREATE (s)-[:CAUSES]->(d);

MATCH (s:Symptom {name: 'Shortness of Breath'}), (d:Disease {name: 'Asthma'})
CREATE (s)-[:CAUSES]->(d);

MATCH (s:Symptom {name: 'Fatigue'}), (d:Disease {name: 'Chronic Fatigue Syndrome'})
CREATE (s)-[:CAUSES]->(d);

MATCH (s:Symptom {name: 'Runny Nose'}), (d:Disease {name: 'Common Cold'})
CREATE (s)-[:CAUSES]->(d);

MATCH (s:Symptom {name: 'Cough'}), (d:Disease {name: 'Bronchitis'})
CREATE (s)-[:CAUSES]->(d);

MATCH (s:Symptom {name: 'Fever'}), (d:Disease {name: 'Pneumonia'})
CREATE (s)-[:CAUSES]->(d);

MATCH (s:Symptom {name: 'Shortness of Breath'}), (d:Disease {name: 'Pneumonia'})
CREATE (s)-[:CAUSES]->(d);

// Link people to symptoms they have (HAS_SYMPTOM)
MATCH (p:Person {name: 'Alice'}), (s:Symptom {name: 'Fever'})
CREATE (p)-[:HAS_SYMPTOM]->(s);

MATCH (p:Person {name: 'Alice'}), (s:Symptom {name: 'Cough'})
CREATE (p)-[:HAS_SYMPTOM]->(s);

MATCH (p:Person {name: 'Bob'}), (s:Symptom {name: 'Headache'})
CREATE (p)-[:HAS_SYMPTOM]->(s);

MATCH (p:Person {name: 'Charlie'}), (s:Symptom {name: 'Shortness of Breath'})
CREATE (p)-[:HAS_SYMPTOM]->(s);

MATCH (p:Person {name: 'Diana'}), (s:Symptom {name: 'Fatigue'})
CREATE (p)-[:HAS_SYMPTOM]->(s);

MATCH (p:Person {name: 'Eve'}), (s:Symptom {name: 'Cough'})
CREATE (p)-[:HAS_SYMPTOM]->(s);

MATCH (p:Person {name: 'Eve'}), (s:Symptom {name: 'Fever'})
CREATE (p)-[:HAS_SYMPTOM]->(s);

MATCH (p:Person {name: 'Frank'}), (s:Symptom {name: 'Runny Nose'})
CREATE (p)-[:HAS_SYMPTOM]->(s);

MATCH (p:Person {name: 'Grace'}), (s:Symptom {name: 'Nausea'})
CREATE (p)-[:HAS_SYMPTOM]->(s);

MATCH (p:Person {name: 'Hank'}), (s:Symptom {name: 'Muscle Pain'})
CREATE (p)-[:HAS_SYMPTOM]->(s);

MATCH (p:Person {name: 'Ivy'}), (s:Symptom {name: 'Sore Throat'})
CREATE (p)-[:HAS_SYMPTOM]->(s);

MATCH (p:Person {name: 'Jack'}), (s:Symptom {name: 'Loss of Smell'})
CREATE (p)-[:HAS_SYMPTOM]->(s);

// Link people to confirmed diseases (CONFIRMED)
MATCH (p:Person {name: 'Alice'}), (d:Disease {name: 'Influenza'})
CREATE (p)-[:CONFIRMED]->(d);

MATCH (p:Person {name: 'Bob'}), (d:Disease {name: 'Migraine'})
CREATE (p)-[:CONFIRMED]->(d);

MATCH (p:Person {name: 'Charlie'}), (d:Disease {name: 'Asthma'})
CREATE (p)-[:CONFIRMED]->(d);

MATCH (p:Person {name: 'Diana'}), (d:Disease {name: 'Chronic Fatigue Syndrome'})
CREATE (p)-[:CONFIRMED]->(d);

MATCH (p:Person {name: 'Eve'}), (d:Disease {name: 'Pneumonia'})
CREATE (p)-[:CONFIRMED]->(d);

// Create family relationships (IS_FAMILY)
MATCH (p1:Person {name: 'Alice'}), (p2:Person {name: 'Bob'})
CREATE (p1)-[:IS_FAMILY]->(p2);

MATCH (p1:Person {name: 'Diana'}), (p2:Person {name: 'Charlie'})
CREATE (p1)-[:IS_FAMILY]->(p2);

MATCH (p1:Person {name: 'Eve'}), (p2:Person {name: 'Frank'})
CREATE (p1)-[:IS_FAMILY]->(p2);

MATCH (p1:Person {name: 'Grace'}), (p2:Person {name: 'Hank'})
CREATE (p1)-[:IS_FAMILY]->(p2);

MATCH (p1:Person {name: 'Ivy'}), (p2:Person {name: 'Jack'})
CREATE (p1)-[:IS_FAMILY]->(p2);

// Suggest diseases based on symptoms and relationships
MATCH (p:Person)-[:HAS_SYMPTOM]->(s:Symptom)-[:CAUSES]->(d:Disease)
WHERE NOT (p)-[:CONFIRMED]->(d)
RETURN p.name AS Person, d.name AS SuggestedDisease, COLLECT(s.name) AS Symptoms
ORDER BY Person, SuggestedDisease;
