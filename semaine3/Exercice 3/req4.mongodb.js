// Select the database to use.
use("UEL315_S3");

// Afficher toutes les publications dont je suis l'auteur
db.getCollection("dblp").find({ authors: "Filippos Katsanos" });
