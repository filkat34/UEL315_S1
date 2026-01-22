// connect to the db
use("UEL315_S3");

// only show the "name.official" field (hide the id)
const projectionFields = { 
  _id: 0,
  name: { official: 1 },
};

// find the countries n°10 to 22, sorted by area
db.pays.find()
  .skip(9) // skip the 9 firsts
  .limit(22 - 10) // get the number of countries we want
  .sort({ area: 1 }) // sort by area in ascending order
  .projection(projectionFields);
