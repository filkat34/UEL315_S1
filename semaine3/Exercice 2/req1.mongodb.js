use ('UEL315_S3');

// Afficher tous les titres
db.getCollection('documents').find(
    {}, 
    { "fields.titre_avec_lien_vers_le_catalogue": 1, "_id": 0 }
)