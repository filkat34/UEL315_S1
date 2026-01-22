// connect to the db
use("UEL315_S3");

// only show the "name.official" field (hide the id)
const projectionFields = { 
  _id: 0,
  name: { official: 1 },
};

// execute the search: countries between 400000 and 500000 km²
db.pays.find({ area: { $gt: 400000, $lt: 500000 } })
  .projection(projectionFields);
