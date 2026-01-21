# UEL315 Base de données (Groupe D) - Semaine 3

## Membres du groupe

| Etudiant.e  |   Alias    |
| :---------: | :--------: |
| Mathilde C. | Clouddy23  |
|   Kamo G.   | Spaghette5 |
| Mathieu L.  |  mathleys  |
| Filippos K. |  filkat34  |
|  Yamine D.  | yamine-dr  |

## Répartition du travail

- [ ] Exercice 1 (en entier) - Yamine
- [x] Exercice 2 (requêtes 1 à 5) - Mathieu
- [x] Exercice 2 (requêtes 6 à 9) - Kamo
- [x] Exercice 3 (requêtes 1 à 5) - Filippos
- [x] Exercice 3 (requêtes 6 à 10) - Mathilde

## Collaboration

Le groupe a utilisé le client _Git_ et la plateforme _Github_ pour collaborer.

L'exercice est versionné dans le dossier `semaine 3` du dépôt [https://github.com/filkat34/UEL315_S1](https://github.com/filkat34/UEL315_S1)

## Exercice 1

## Exercice 2

### Requête 2.1

```js
// Afficher tous les titres
db.getCollection("documents").find(
  {},
  { "fields.titre_avec_lien_vers_le_catalogue": 1, _id: 0 },
);
```

Playground Result :

```js
[
  {
    fields: {
      titre_avec_lien_vers_le_catalogue:
        "Cinquante nuances plus sombres : roman",
    },
  },
  {
    fields: {
      titre_avec_lien_vers_le_catalogue: "Dans la maison",
    },
  },
  {
    fields: {
      titre_avec_lien_vers_le_catalogue: "La nostalgie heureuse",
    },
  },
  {
    fields: {
      titre_avec_lien_vers_le_catalogue: "Au revoir là-haut : roman",
    },
  },
  {
    fields: {
      titre_avec_lien_vers_le_catalogue: "Les lisières",
    },
  },
  {
    fields: {
      titre_avec_lien_vers_le_catalogue:
        "Quai d'Orsay : chroniques diplomatiques. 2",
    },
  },
  {
    fields: {
      titre_avec_lien_vers_le_catalogue: "Etranges rivages",
    },
  },
  {
    fields: {
      titre_avec_lien_vers_le_catalogue: "L'hiver du monde : roman",
    },
  },
  {
    fields: {
      titre_avec_lien_vers_le_catalogue: "La révolte",
    },
  },
  {
    fields: {
      titre_avec_lien_vers_le_catalogue: "Peste & choléra : roman",
    },
  },
  {
    fields: {
      titre_avec_lien_vers_le_catalogue:
        "Immortelle randonnée : Compostelle malgré moi",
    },
  },
  {
    fields: {
      titre_avec_lien_vers_le_catalogue: "Hunger Games",
    },
  },
  {
    fields: {
      titre_avec_lien_vers_le_catalogue: "Que choisir ?",
    },
  },
  {
    fields: {
      titre_avec_lien_vers_le_catalogue: "Skyfall",
    },
  },
  {
    fields: {
      titre_avec_lien_vers_le_catalogue: "Polisse",
    },
  },
  {
    fields: {
      titre_avec_lien_vers_le_catalogue: "Kaïken : roman",
    },
  },
  {
    fields: {
      titre_avec_lien_vers_le_catalogue: "Le grand Coeur : roman",
    },
  },
  {
    fields: {
      titre_avec_lien_vers_le_catalogue: "Aya de Yopougon. 3",
    },
  },
  {
    fields: {
      titre_avec_lien_vers_le_catalogue: "The Master",
    },
  },
  {
    fields: {
      titre_avec_lien_vers_le_catalogue: "Les femmes du bus 678",
    },
  },
];
```

### Requête 2.2

```js
// Afficher tous les titres des documents ayant les rangs 1 à 10
db.getCollection("documents").find(
  { "fields.rang": { $gte: 1, $lte: 10 } },
  { "fields.titre_avec_lien_vers_le_catalogue": 1, _id: 0 },
);
```

Playground Result :

```js
[
  {
    fields: {
      titre_avec_lien_vers_le_catalogue:
        "Cinquante nuances plus sombres : roman",
    },
  },
  {
    fields: {
      titre_avec_lien_vers_le_catalogue: "Au revoir là-haut : roman",
    },
  },
  {
    fields: {
      titre_avec_lien_vers_le_catalogue:
        "Immortelle randonnée : Compostelle malgré moi",
    },
  },
  {
    fields: {
      titre_avec_lien_vers_le_catalogue: "1Q84. 3. Octobre-décembre",
    },
  },
  {
    fields: {
      titre_avec_lien_vers_le_catalogue: "L'embrasement",
    },
  },
  {
    fields: {
      titre_avec_lien_vers_le_catalogue: "Le sermon sur la chute de Rome",
    },
  },
  {
    fields: {
      titre_avec_lien_vers_le_catalogue:
        "La vérité sur l'affaire Harry Quebert : roman",
    },
  },
  {
    fields: {
      titre_avec_lien_vers_le_catalogue: "Le bleu est une couleur chaude",
    },
  },
  {
    fields: {
      titre_avec_lien_vers_le_catalogue: "La liste de mes envies",
    },
  },
  {
    fields: {
      titre_avec_lien_vers_le_catalogue: "Cinquante nuances de Grey : roman",
    },
  },
];
```

### Requête 2.3

```js
// Afficher les auteurs de tous les documents dont le titre commence par la lettre N
db.getCollection("documents").find(
  { "fields.titre_avec_lien_vers_le_catalogue": /^N/ },
  { "fields.auteur": 1, _id: 0 },
);
```

Playground Result :

```js
[
  {
    fields: {
      auteur: "Gloaguen, Philippe",
    },
  },
  {
    fields: {
      auteur: "Mukasonga, Scholastique",
    },
  },
  {
    fields: {
      auteur: "Moix, Yann",
    },
  },
  {
    fields: {
      auteur: "Coatalem, Jean-Luc",
    },
  },
  {
    fields: {
      auteur: "",
    },
  },
  {
    fields: {
      auteur: "Hunter, Erin",
    },
  },
  {
    fields: {
      auteur: "Bonetto, Cristian",
    },
  },
  {
    fields: {
      auteur: "Toussaint, Jean-Philippe",
    },
  },
  {
    fields: {
      auteur: "",
    },
  },
  {
    fields: {
      auteur: "Roth, Philip",
    },
  },
  {
    fields: {
      auteur: "",
    },
  },
  {
    fields: {
      auteur: "",
    },
  },
  {
    fields: {
      auteur: "Coben, Harlan",
    },
  },
  {
    fields: {
      auteur: "Vigan, Delphine de",
    },
  },
  {
    fields: {
      auteur: "Orval, Thierry",
    },
  },
  {
    fields: {
      auteur: "Otis, Ginger Adams",
    },
  },
  {
    fields: {
      auteur: "Bussi, Michel",
    },
  },
];
```

### Requête 2.4

```js
// Afficher toutes les informations vers les documents n'ayant pas de champ "type_de_document"
db.getCollection("documents").find({
  "fields.type_de_document": { $exists: false },
});
```

Playground Result :

```js
[];
```

### Requête 2.5

```js
// Afficher les différents types de documents qui apparaissent dans cette base
db.getCollection("documents").distinct("fields.type_de_document");
```

Playground Result :

```js
[
  "",
  "2016-08-27T18:20:35+02:00",
  "Bande dessinée jeunesse",
  "Bande dessinée jeunesse >12 ans",
  "Bande dessinée pour adulte",
  "DVD en audio-description",
  "DVD jeunesse",
  "DVD- vidéo > 12 ans",
  "DVD-vidéo > 16 ans",
  "DVD-vidéo tous publics",
  "Disque compact",
  "Enregistrement musical pour la jeunesse",
  "Livre de Fonds spécialisés",
  "Livre de section jeunesse > 12 ans",
  "Livre jeunesse",
  "Livre pour adulte",
  "Nouveauté",
  "Nouveauté disque compact",
  "Revue pour adulte",
];
```

### Requête 2.6

```js
// Afficher les titres des 5 documents les plus réservés
db.getCollection('documents').find(
    {}, 
    { "fields.titre_avec_lien_vers_le_catalogue": 1, "_id": 0 }
).sort({ "fields.nombre_de_reservations": -1 }).limit(5)
```

Playground Result :

```js
[
  {
    "fields": {
      "titre_avec_lien_vers_le_catalogue": "La vérité sur l'affaire Harry Quebert : roman"
    }
  },
  {
    "fields": {
      "titre_avec_lien_vers_le_catalogue": "Cinquante nuances de Grey : roman"
    }
  },
  {
    "fields": {
      "titre_avec_lien_vers_le_catalogue": "La liste de mes envies"
    }
  },
  {
    "fields": {
      "titre_avec_lien_vers_le_catalogue": "1Q84. 3. Octobre-décembre"
    }
  },
  {
    "fields": {
      "titre_avec_lien_vers_le_catalogue": "Le bleu est une couleur chaude"
    }
  }
];
```

### Requête 2.7
```js
// Afficher tous les documents ayant plus de 200 réservations
db.getCollection('documents').find(
    { "fields.nombre_de_reservations": { $gt: 200 } }
)
```

Playground Result :

```js
[
  {
    "_id": {
      "$oid": "6970f13ab4385367ac2bee35"
    },
    "datasetid": "les_1000_titres_les_plus_reserves_en_2013",
    "recordid": "472a07556c2555d76c92ddc34f748165118288e6",
    "fields": {
      "nombre_de_reservations": 236,
      "rang": 44,
      "titre_avec_lien_vers_le_catalogue": "Dans la maison",
      "auteur": "",
      "type_de_document": "DVD en audio-description"
    },
    "record_timestamp": "2016-08-27T18:20:35+02:00",
    "FIELD9": ""
  },
  {
    "_id": {
      "$oid": "6970f13ab4385367ac2bee36"
    },
    "datasetid": "les_1000_titres_les_plus_reserves_en_2013",
    "recordid": "16eff9e470f09bb115a433e39ff74c3d6dda13a8",
    "fields": {
      "nombre_de_reservations": 232,
      "rang": 46,
      "titre_avec_lien_vers_le_catalogue": "La nostalgie heureuse",
      "auteur": "Nothomb, Amélie",
      "type_de_document": "Nouveauté"
    },
    "record_timestamp": "2016-08-27T18:20:35+02:00",
    "FIELD9": ""
  },
  {
    "_id": {
      "$oid": "6970f13ab4385367ac2bee37"
    },
    "datasetid": "les_1000_titres_les_plus_reserves_en_2013",
    "recordid": "b64b457e893e9d8d4a65e738cd6ba03cbdff14b4",
    "fields": {
      "nombre_de_reservations": 390,
      "rang": 13,
      "titre_avec_lien_vers_le_catalogue": "La révolte",
      "auteur": "Collins, Suzanne",
      "type_de_document": "Livre de section jeunesse > 12 ans"
    },
    "record_timestamp": "2016-08-27T18:20:35+02:00",
    "FIELD9": ""
  },
  {
    "_id": {
      "$oid": "6970f13ab4385367ac2bee38"
    },
    "datasetid": "les_1000_titres_les_plus_reserves_en_2013",
    "recordid": "16c55ae50ed67fa5020e74825def8eb0a09c22da",
    "fields": {
      "nombre_de_reservations": 342,
      "rang": 19,
      "titre_avec_lien_vers_le_catalogue": "Peste & choléra : roman",
      "auteur": "Deville, Patrick",
      "type_de_document": ""
    },
    "record_timestamp": "2016-08-27T18:20:35+02:00",
    "FIELD9": ""
  },
  {
    "_id": {
      "$oid": "6970f13ab4385367ac2bee39"
    },
    "datasetid": "les_1000_titres_les_plus_reserves_en_2013",
    "recordid": "45e443119f82cbee18b504b7538f86124325805e",
    "fields": {
      "nombre_de_reservations": 408,
      "rang": 10,
      "titre_avec_lien_vers_le_catalogue": "Immortelle randonnée : Compostelle malgré moi",
      "auteur": "Rufin, Jean-Christophe",
      "type_de_document": ""
    },
    "record_timestamp": "2016-08-27T18:20:35+02:00",
    "FIELD9": ""
  },
  {
    "_id": {
      "$oid": "6970f13ab4385367ac2bee3b"
    },
    "datasetid": "les_1000_titres_les_plus_reserves_en_2013",
    "recordid": "f19d32e8c7fd3ed0d3ebd5602d65b03424361cf3",
    "fields": {
      "nombre_de_reservations": 217,
      "rang": 51,
      "titre_avec_lien_vers_le_catalogue": "Hunger Games",
      "auteur": "",
      "type_de_document": "DVD-vidéo tous publics"
    },
    "record_timestamp": "2016-08-27T18:20:35+02:00",
    "FIELD9": ""
  },
  {
    "_id": {
      "$oid": "6970f13ab4385367ac2bee3c"
    },
    "datasetid": "les_1000_titres_les_plus_reserves_en_2013",
    "recordid": "6536ec9c97dedbbb02752311d81ee41548aa3627",
    "fields": {
      "nombre_de_reservations": 226,
      "rang": 48,
      "titre_avec_lien_vers_le_catalogue": "Skyfall",
      "auteur": "",
      "type_de_document": "DVD-vidéo tous publics"
    },
    "record_timestamp": "2016-08-27T18:20:35+02:00",
    "FIELD9": ""
  },
  {
    "_id": {
      "$oid": "6970f13ab4385367ac2bee3e"
    },
    "datasetid": "les_1000_titres_les_plus_reserves_en_2013",
    "recordid": "6675cbb0cf9e894d3c4a543e50bf5808189f37b4",
    "fields": {
      "nombre_de_reservations": 420,
      "rang": 7,
      "titre_avec_lien_vers_le_catalogue": "Cinquante nuances plus sombres : roman",
      "auteur": "James, E.L.",
      "type_de_document": ""
    },
    "record_timestamp": "2016-08-27T18:20:35+02:00",
    "FIELD9": ""
  },
  {
    "_id": {
      "$oid": "6970f13ab4385367ac2bee3f"
    },
    "datasetid": "les_1000_titres_les_plus_reserves_en_2013",
    "recordid": "cb304d3d696a0fdf983eaf1dc01ec804f89c160d",
    "fields": {
      "nombre_de_reservations": 376,
      "rang": 15,
      "titre_avec_lien_vers_le_catalogue": "Quai d'Orsay : chroniques diplomatiques. 2",
      "auteur": "Lanzac, Abel",
      "type_de_document": ""
    },
    "record_timestamp": "2016-08-27T18:20:35+02:00",
    "FIELD9": ""
  },
  {
    "_id": {
      "$oid": "6970f13ab4385367ac2bee40"
    },
    "datasetid": "les_1000_titres_les_plus_reserves_en_2013",
    "recordid": "0086151c7e80c02a0f20ec34a1fb90b92e129c89",
    "fields": {
      "nombre_de_reservations": 207,
      "rang": 54,
      "titre_avec_lien_vers_le_catalogue": "Le grand Coeur : roman",
      "auteur": "Rufin, Jean-Christophe",
      "type_de_document": ""
    },
    "record_timestamp": "2016-08-27T18:20:35+02:00",
    "FIELD9": ""
  },
  {
    "_id": {
      "$oid": "6970f13ab4385367ac2bee42"
    },
    "datasetid": "les_1000_titres_les_plus_reserves_en_2013",
    "recordid": "15a3ed316ea411deb794dd09b8008baa6a38bb2a",
    "fields": {
      "nombre_de_reservations": 412,
      "rang": 8,
      "titre_avec_lien_vers_le_catalogue": "Au revoir là-haut : roman",
      "auteur": "Lemaitre, Pierre",
      "type_de_document": "Nouveauté"
    },
    "record_timestamp": "2016-08-27T18:20:35+02:00",
    "FIELD9": ""
  },
  {
    "_id": {
      "$oid": "6970f13ab4385367ac2bee43"
    },
    "datasetid": "les_1000_titres_les_plus_reserves_en_2013",
    "recordid": "92b67b93e2be1bb76461373a0add32a2f938f28c",
    "fields": {
      "nombre_de_reservations": 265,
      "rang": 33,
      "titre_avec_lien_vers_le_catalogue": "L'hiver du monde : roman",
      "auteur": "Follett, Ken",
      "type_de_document": "Livre pour adulte"
    },
    "record_timestamp": "2016-08-27T18:20:35+02:00",
    "FIELD9": ""
  },
  {
    "_id": {
      "$oid": "6970f13ab4385367ac2bee49"
    },
    "datasetid": "les_1000_titres_les_plus_reserves_en_2013",
    "recordid": "8bb939e7201b6ac2c0ae2b84e5bb9cbf673c9734",
    "fields": {
      "nombre_de_reservations": 250,
      "rang": 38,
      "titre_avec_lien_vers_le_catalogue": "Etranges rivages",
      "auteur": "Arnaldur Indridason",
      "type_de_document": "Livre pour adulte"
    },
    "record_timestamp": "2016-08-27T18:20:35+02:00",
    "FIELD9": ""
  },
  {
    "_id": {
      "$oid": "6970f13ab4385367ac2bee4a"
    },
    "datasetid": "les_1000_titres_les_plus_reserves_en_2013",
    "recordid": "550a4089c7d0abe152b44c7e35a3928c006b0f06",
    "fields": {
      "nombre_de_reservations": 230,
      "rang": 47,
      "titre_avec_lien_vers_le_catalogue": "Les lisières",
      "auteur": "Adam, Olivier",
      "type_de_document": "Nouveauté"
    },
    "record_timestamp": "2016-08-27T18:20:35+02:00",
    "FIELD9": ""
  },
  {
    "_id": {
      "$oid": "6970f13ab4385367ac2bee90"
    },
    "datasetid": "les_1000_titres_les_plus_reserves_en_2013",
    "recordid": "0d4658554dffe2d937c4e28edb08a9d50b3db8b1",
    "fields": {
      "nombre_de_reservations": 455,
      "rang": 4,
      "titre_avec_lien_vers_le_catalogue": "1Q84. 3. Octobre-décembre",
      "auteur": "Murakami, Haruki",
      "type_de_document": "Nouveauté"
    },
    "record_timestamp": "2016-08-27T18:20:35+02:00",
    "FIELD9": ""
  },
  {
    "_id": {
      "$oid": "6970f13ab4385367ac2bee93"
    },
    "datasetid": "les_1000_titres_les_plus_reserves_en_2013",
    "recordid": "badb93738cab2a6227b4e26a843b2ac4305e2b3b",
    "fields": {
      "nombre_de_reservations": 435,
      "rang": 6,
      "titre_avec_lien_vers_le_catalogue": "L'embrasement",
      "auteur": "Collins, Suzanne",
      "type_de_document": "Livre de section jeunesse > 12 ans"
    },
    "record_timestamp": "2016-08-27T18:20:35+02:00",
    "FIELD9": ""
  },
  {
    "_id": {
      "$oid": "6970f13ab4385367ac2bee95"
    },
    "datasetid": "les_1000_titres_les_plus_reserves_en_2013",
    "recordid": "f1ff10b0b1ae21fa8c935a1c73683858d04427d4",
    "fields": {
      "nombre_de_reservations": 299,
      "rang": 23,
      "titre_avec_lien_vers_le_catalogue": "Les apparences",
      "auteur": "Flynn, Gillian",
      "type_de_document": ""
    },
    "record_timestamp": "2016-08-27T18:20:35+02:00",
    "FIELD9": ""
  },
  {
    "_id": {
      "$oid": "6970f13ab4385367ac2bee98"
    },
    "datasetid": "les_1000_titres_les_plus_reserves_en_2013",
    "recordid": "b081bef1648e3a0b2e2c6133b154504472b5696c",
    "fields": {
      "nombre_de_reservations": 272,
      "rang": 30,
      "titre_avec_lien_vers_le_catalogue": "Heureux les heureux",
      "auteur": "Reza, Yasmina",
      "type_de_document": ""
    },
    "record_timestamp": "2016-08-27T18:20:35+02:00",
    "FIELD9": ""
  },
  {
    "_id": {
      "$oid": "6970f13ab4385367ac2bee99"
    },
    "datasetid": "les_1000_titres_les_plus_reserves_en_2013",
    "recordid": "0aef507ef0fb23666db648731d3ca43ae9a59366",
    "fields": {
      "nombre_de_reservations": 405,
      "rang": 11,
      "titre_avec_lien_vers_le_catalogue": "Quai d'Orsay : chroniques diplomatiques. 1",
      "auteur": "Blain, Christophe",
      "type_de_document": "Bande dessinée pour adulte"
    },
    "record_timestamp": "2016-08-27T18:20:35+02:00",
    "FIELD9": ""
  },
  {
    "_id": {
      "$oid": "6970f13ab4385367ac2bee9a"
    },
    "datasetid": "les_1000_titres_les_plus_reserves_en_2013",
    "recordid": "8b80ad84065f9006046e42832ca2696fcbfea78b",
    "fields": {
      "nombre_de_reservations": 266,
      "rang": 32,
      "titre_avec_lien_vers_le_catalogue": "Un sentiment plus fort que la peur : roman",
      "auteur": "Lévy, Marc",
      "type_de_document": "Nouveauté"
    },
    "record_timestamp": "2016-08-27T18:20:35+02:00",
    "FIELD9": ""
  }
];
```

### Requête 2.8

```js
// Calculer le total des réservations par type de document
db.getCollection('documents').aggregate([
    {
        $group: {
            _id: "$fields.type_de_document",
            total_reservations: { $sum: "$fields.nombre_de_reservations" }
        }
    },
    { $sort: { total_reservations: -1 } }
])
```

Playground Result :

```js
[
  {
    "_id": "DVD-vidéo tous publics",
    "total_reservations": 22398
  },
  {
    "_id": "Livre pour adulte",
    "total_reservations": 15706
  },
  {
    "_id": "Nouveauté",
    "total_reservations": 13315
  },
  {
    "_id": "",
    "total_reservations": 10474
  },
  {
    "_id": "Bande dessinée pour adulte",
    "total_reservations": 4357
  },
  {
    "_id": "Bande dessinée jeunesse",
    "total_reservations": 3620
  },
  {
    "_id": "Nouveauté disque compact",
    "total_reservations": 2940
  },
  {
    "_id": "DVD- vidéo > 12 ans",
    "total_reservations": 2406
  },
  {
    "_id": "Livre jeunesse",
    "total_reservations": 2075
  },
  {
    "_id": "Livre de section jeunesse > 12 ans",
    "total_reservations": 2064
  },
  {
    "_id": "Bande dessinée jeunesse >12 ans",
    "total_reservations": 1903
  },
  {
    "_id": "Disque compact",
    "total_reservations": 1230
  },
  {
    "_id": "DVD jeunesse",
    "total_reservations": 872
  },
  {
    "_id": "DVD en audio-description",
    "total_reservations": 343
  },
  {
    "_id": "Livre de Fonds spécialisés",
    "total_reservations": 252
  },
  {
    "_id": "Revue pour adulte",
    "total_reservations": 249
  },
  {
    "_id": "DVD-vidéo > 16 ans",
    "total_reservations": 160
  },
  {
    "_id": "2016-08-27T18:20:35+02:00",
    "total_reservations": 101
  },
  {
    "_id": "Enregistrement musical pour la jeunesse",
    "total_reservations": 49
  }
];
```

### Requête 2.9

```js
// Lister les auteurs ayant le plus de documents dans la collection
db.getCollection('documents').aggregate([
    {
        $group: {
            _id: "$fields.auteur",
            nombre_de_documents: { $sum: 1 }
        }
    },
    { $sort: { nombre_de_documents: -1 } },
    { $limit: 10 } // Limite aux 10 premiers pour plus de lisibilité
])
```

Playground Result :

```js
[
  {
    "_id": "",
    "nombre_de_documents": 336
  },
  {
    "_id": "Gloaguen, Philippe",
    "nombre_de_documents": 32
  },
  {
    "_id": "Mashima, Hiro",
    "nombre_de_documents": 21
  },
  {
    "_id": "Kirkman, Robert",
    "nombre_de_documents": 18
  },
  {
    "_id": "Sobral, Patrick",
    "nombre_de_documents": 17
  },
  {
    "_id": "Muchamore, Robert",
    "nombre_de_documents": 14
  },
  {
    "_id": "Riordan, Rick",
    "nombre_de_documents": 9
  },
  {
    "_id": "Oda, Eiichiro",
    "nombre_de_documents": 9
  },
  {
    "_id": "Hunter, Erin",
    "nombre_de_documents": 9
  },
  {
    "_id": "Läckberg, Camilla",
    "nombre_de_documents": 8
  }
];
```


## Exercice 3

### Requête 3.1

```js
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
```

Playground Result :

```js
{
  "acknowledged": true,
  "insertedId": {
    "$oid": "696f428250d6a3afcbd93e5d"
  }
}
```

### Requête 3.2

```javascript
// Ajouter une nouvelle publication de type « Article »
db.getCollection("dblp").insertOne({
  type: "Article",
  title: "Pas d'inspiration",
  year: 2026,
  publisher: "PULIM",
  authors: ["Filippos Katsanos", "John Doe"],
  source: "DBLP",
});
```

Playground Result :

```js
{
  "acknowledged": true,
  "insertedId": {
    "$oid": "696f42b90b1683a5a82d390b"
  }
}
```

### Requête 3.3

```javascript
// Afficher le nombre de publications de type « Book »
db.getCollection("dblp").countDocuments({ type: "Book" });
```

Playground Result :

```console
92
```

### Requête 3.4

```javascript
// Afficher toutes les publications dont je suis l'auteur
db.getCollection("dblp").find({ authors: "Filippos Katsanos" });
```

Playground result :

```js
[
  {
    _id: {
      $oid: "696f42b90b1683a5a82d390b",
    },
    type: "Article",
    title: "Pas d'inspiration",
    year: 2026,
    publisher: "PULIM",
    authors: ["Filippos Katsanos", "John Doe"],
    source: "DBLP",
  },
];
```

### Requête 3.5

```javascript
//Afficher le titre de toutes les publications depuis 2012 inclus
//Pour tout afficher utiliser .toArray() pour éviter le retour du curseur seulement
db.getCollection("dblp")
  .find({ year: { $gte: 2012 } }, { title: 1, _id: 0 })
  .toArray();
```

Playground result (extrait) :

```js
[
  {
    title: "Shared Interfaces for Co-located Interaction.",
  },
  {
    title:
      "The Semantic Product Memory: An Interactive Black Box for Smart Objects.",
  },
  {
    title: "Perspectives on Reasoning About Time.",
  },
  {
    title:
      "A SemProM Use Case: Maintenance of Factory and Automotive Components.",
  },
  {
    title: "A SemProM Use Case: Health Care and Compliance.",
  },
  {
    title: "Controlling Interaction with Digital Product Memories.",
  },
  {
    title: "Foundations of Rule Learning",
  },
  {
    title: "Ubiquitous Display Environments",
  },
  {
    title: "Considering the Aesthetics of Ubiquitous Displays.",
  },
  {
    title:
      "Language Processing with Perl and Prolog - Theories, Implementation, and Application",
  },
  {
    title:
      "SemProM - Foundations of Semantic Product Memories for the Internet of Things",
  },
  {
    title:
      "Audience Measurement for Digital Signage: Exploring the Audience's Perspective.",
  },
  {
    title: "The Smart SemProM.",
  },
];
```

### Requête 3.6

```js
// Afficher le nombre de publications de type « Article » depuis 2012 (2012 non inclus)
db.getCollection("dblp").countDocuments({
  type: "Article",
  year: { $gt: 2012 },
});
```

Playground result :

```js
157;
```

### Requête 3.7

```js
// Afficher les années des publications de l'auteur « Wolfgang Wahlster »
// Pas de doublons + tri par ordre croissant
db.getCollection("dblp")
  .aggregate([
    { $match: { authors: "Wolfgang Wahlster" } },
    { $group: { _id: "$year" } }, // années distinctes
    { $sort: { _id: 1 } }, // triage croissant
    { $project: { _id: 0, year: "$_id" } }, // format avec remplacement de _id par year
  ])
  .toArray();
```

Playground result :

```js
[
  {
    year: 2006,
  },
  {
    year: 2011,
  },
  {
    year: 2013,
  },
];
```

### Requête 3.8

```js
// Afficher la liste de tous les éditeurs (champ "publisher") distincts
// sans doublons
db.getCollection("dblp").distinct("publisher", {
  publisher: { $exists: true, $ne: null, $ne: "" },
});
```

Playground result :

```js
["ACM Press and Addison-Wesley", "IOS Press", "PULIM", "Springer"];
```

### Requête 3.9

```js
// Afficher la liste des publications de « Wolfgang Wahlster » triée par année croissante
db.getCollection("dblp")
  .find(
    {
      authors: "Wolfgang Wahlster",
    },
    { _id: 0, year: 1, title: 1, type: 1, publisher: 1, authors: 1, author: 1 },
  )
  .sort({ year: 1, title: 1 })
  .toArray();
```

Playground result :

```js
[
  {
    type: "Article",
    title: "Dialogue Systems Go Multimodal: The SmartKom Experience.",
    year: 2006,
    authors: ["Wolfgang Wahlster"],
  },
  {
    type: "Article",
    title: "Seamless Resource-Adaptive Navigation.",
    year: 2011,
    authors: [
      "Tim Schwartz",
      "Christoph Stahl",
      "J?rg Baus",
      "Wolfgang Wahlster",
    ],
  },
  {
    type: "Article",
    title:
      "The Shopping Experience of Tomorrow: Human-Centered and Resource-Adaptive.",
    year: 2011,
    authors: [
      "Wolfgang Wahlster",
      "Michael Feld",
      "Patrick Gebhard",
      "Dominikus Heckmann",
      "Ralf Jung",
      "Michael Kruppa",
      "Michael Schmitz",
      "L?bomira Spassova",
      "Rainer Wasinger",
    ],
  },
  {
    type: "Article",
    title:
      "The Semantic Product Memory: An Interactive Black Box for Smart Objects.",
    year: 2013,
    authors: ["Wolfgang Wahlster"],
  },
];
```

### Requête 3.10

```js
// Supprimer le champ « type » de toutes les publications
db.getCollection("dblp").updateMany({}, { $unset: { type: "" } });
```

Playground result :

```js
{
  "acknowledged": true,
  "insertedId": null,
  "matchedCount": 801,
  "modifiedCount": 801,
  "upsertedCount": 0
}
```
