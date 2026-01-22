use ('UEL315_S3');

// Afficher les auteurs de tous les documents dont le titre commence par la lettre N
db.getCollection('documents').find(
    { "fields.titre_avec_lien_vers_le_catalogue": /^N/ }, 
    { "fields.auteur": 1, "_id": 0 }
)