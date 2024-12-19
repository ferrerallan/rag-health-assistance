import spacy

nlp = spacy.load("en_core_web_sm")

def extract_person_name(question):
    doc = nlp(question)
    for ent in doc.ents:
        if ent.label_ == "PERSON":
            return ent.text
    return None
