// Connexion à la BDD
use("UEL315_S3");

// Afficher le nombre de publications de type « Article » depuis 2012 (2012 non inclus)
db.getCollection("dblp").countDocuments({
  type: "Article",
  year: { $gt: 2012 },
});
