// Select the database to use.
use("UEL315_S3");

// Afficher le nombre de publications de type « Book »
db.getCollection("dblp").countDocuments({ type: "Book" });
