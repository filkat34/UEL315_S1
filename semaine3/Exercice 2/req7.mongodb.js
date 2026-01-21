use('UEL315_S3');

// Afficher tous les documents ayant plus de 200 réservations
db.getCollection('documents').find(
    { "fields.nombre_de_reservations": { $gt: 200 } }
)