// Connexion à la BDD
use("UEL315_S3");

// Afficher les années des publications de l'auteur « Wolfgang Wahlster »
// Pas de doublons + tri par ordre croissant
db.getCollection("dblp")
  .aggregate([
    { $match: { authors: "Wolfgang Wahlster" } },
    { $group: { _id: "$year" } }, // années distinctes
    { $sort: { _id: 1 } }, // triage croissant
    { $project: { _id: 0, year: "$_id" } }, // format avec remplacement de _id par year
  ])
  .toArray();
