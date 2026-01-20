// import the JSON file
const countriesData = require('./data.json');

// connect to the db
use("UEL315_S3");

// create new collection "pays" (if it doesn't already exist)
if (!db.getCollectionNames().includes("pays")) {
  db.createCollection("pays");
}

// insert data in the collection
db.pays.insertMany(countriesData);
