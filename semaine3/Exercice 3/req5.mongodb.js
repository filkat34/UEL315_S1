// Select the database to use.
use("UEL315_S3");

//Afficher le titre de toutes les publications depuis 2012
db.getCollection("dblp")
  .find({ year: { $gte: 2012 } }, { title: 1, _id: 0 })
  .toArray();
