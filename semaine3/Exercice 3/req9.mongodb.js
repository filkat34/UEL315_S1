// connexion à la BDD
use("UEL315_S3");

// Afficher la liste des publications de « Wolfgang Wahlster » triée par année croissante
db.getCollection("dblp")
  .find(
    {
      authors: "Wolfgang Wahlster",
    },
    { _id: 0, year: 1, title: 1, type: 1, publisher: 1, authors: 1, author: 1 },
  )
  .sort({ year: 1, title: 1 })
  .toArray();
