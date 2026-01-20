use("UEL315_S3");

// Ajouter une nouvelle publication de type « Book »
db.getCollection("dblp").insertOne({
  type: "Book",
  title:
    "Modern Database Systems: The Object Model, Interoperability, and Beyond.",
  year: 1995,
  publisher: "ACM Press and Addison-Wesley",
  authors: ["Won Kim"],
  source: "DBLP",
});
