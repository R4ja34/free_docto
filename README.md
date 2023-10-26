Modèles et Relations - Free Docto
Modèles de Données
Patient :
Attributs : id, first_name, last_name, city_id
Relations : Un patient peut avoir plusieurs rendez-vous.

Doctor :
Attributs : id, first_name, last_name, city_id
Relations : Un médecin peut avoir plusieurs rendez-vous et plusieurs spécialités.

Specialty :
Attributs : id, name
Relations : Plusieurs médecins peuvent avoir la même spécialité et vice versa.

Appointment :
Attributs : id, doctor_id, patient_id, city_id, date
Relations : Chaque rendez-vous est associé à un médecin et un patient qui sont dans la meme ville.

City :
Attributs : id, name
Relations : Plusieurs patients, médecins et rendez-vous peuvent être associés à la même ville.
