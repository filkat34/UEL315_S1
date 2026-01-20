// connect to the db
use("UEL315_S3");

// only show the "name.official" field
const projectionFields = { _id: 0, name: { official: 1 } };

// find the countries n°10 to 22 (skip the 9 firsts)
db.pays.find().skip(9).limit(22 - 10).projection(projectionFields);
