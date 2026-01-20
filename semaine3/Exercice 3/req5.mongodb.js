// Select the database to use.
use("UEL315_S3");

//Afficher le titre de toutes les publications de type « Article » depuis 2012
db.getCollection("dblp").find(
  { type: "Article", year: { $gte: 2012 } },
  { title: 1, _id: 0 },
);
