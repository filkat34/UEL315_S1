use('UEL315_S3');

// Afficher les titres des 5 documents les plus réservés
db.getCollection('documents').find(
    {}, 
    { "fields.titre_avec_lien_vers_le_catalogue": 1, "_id": 0 }
).sort({ "fields.nombre_de_reservations": -1 }).limit(5)