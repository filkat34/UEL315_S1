use('UEL315_S3');

// Calculer le total des réservations par type de document
db.getCollection('documents').aggregate([
    {
        $group: {
            _id: "$fields.type_de_document",
            total_reservations: { $sum: "$fields.nombre_de_reservations" }
        }
    },
    { $sort: { total_reservations: -1 } }
])