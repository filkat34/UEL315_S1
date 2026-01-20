// Connexion à la BDD
use("UEL315_S3");

// Afficher les années des publications de l'auteur « Wolfgang Wahlster »
const years = db.getCollection("dblp").distinct("year", {
  $or: [{ authors: "Wolfgang Wahlster" }, { author: "Wolfgang Wahlster" }],
});
