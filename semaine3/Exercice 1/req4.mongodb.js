// connect to the db
use("UEL315_S3");

// search for countries with Dutch as one of their language:
// they must have the "languages.nld" property, because nld = Netherlands
const schema = {
  $jsonSchema: {
    required: [ "languages" ],
    properties: {
      languages: {
        bsonType: "object",
        required: [ "nld" ],
      }
    }
  }
};

// only show the "name.official" field (hide the id)
const projectionFields = { 
  _id: 0,
  name: { official: 1 },
};

// execute the search
db.pays.find(schema)
  .projection(projectionFields);
