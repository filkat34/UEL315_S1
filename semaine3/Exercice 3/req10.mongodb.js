// Connexion à la BDD
use("UEL315_S3");

// Supprimer le champ « type » de toutes les publications
db.getCollection("dblp").updateMany({}, { $unset: { type: "" } });
