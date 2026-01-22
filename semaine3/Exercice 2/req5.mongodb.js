use ('UEL315_S3');

// Afficher les différents types de documents qui apparaissent dans cette base
db.getCollection('documents').distinct("fields.type_de_document")