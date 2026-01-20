use ('UEL315_S3');

// Afficher tous les titres des documents ayant les rangs 1 à 10
db.getCollection('documents').find(
    { "fields.rang": { $gte: 1, $lte: 10 } }, 
    { "fields.titre_avec_lien_vers_le_catalogue": 1, "_id": 0 }
)