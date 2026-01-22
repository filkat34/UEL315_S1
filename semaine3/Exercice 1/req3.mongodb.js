// connect to the db
use("UEL315_S3");

// find a specific country (by its capital): Mayotte
db.pays.findOne({ "capital": [
  "Mamoudzou"
]});
