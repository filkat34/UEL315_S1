use('UEL315_S3');

// Lister les auteurs ayant le plus de documents dans la collection
db.getCollection('documents').aggregate([
    {
        $group: {
            _id: "$fields.auteur",
            nombre_de_documents: { $sum: 1 }
        }
    },
    { $sort: { nombre_de_documents: -1 } },
    { $limit: 10 } // Limite aux 10 premiers pour plus de lisibilité
])