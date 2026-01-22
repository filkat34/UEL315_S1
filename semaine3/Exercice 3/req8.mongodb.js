// Connexion à la BDD
use("UEL315_S3");

// Afficher la liste de tous les éditeurs (champ "publisher") distincts
// sans doublons
db.getCollection("dblp").distinct("publisher", {
  publisher: { $exists: true, $ne: null, $ne: "" },
});
