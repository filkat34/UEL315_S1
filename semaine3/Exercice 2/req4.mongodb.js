use ('UEL315_S3');

// Afficher toutes les informations vers les documents n'ayant pas de champ "type_de_document"
db.getCollection('documents').find(
    { "fields.type_de_document": { $exists: false } }
)

// Variante : Afficher tous les documents ayant le champ "type_de_document" mais vide
/* db.getCollection('documents').find(
    { "fields.type_de_document": "" }
) */