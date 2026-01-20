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
- [ ] Exercice 2 (requêtes 6 à 9) - Kamo
- [x] Exercice 3 (requêtes 1 à 5) - Filippos
- [x] Exercice 3 (requêtes 6 à 10) - Mathilde

## Exercice 1

## Exercice 2

### Requête 1

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

### Requête 2

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

### Requête 3

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

### Requête 4

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

### Requête 5

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

## Exercice 3

### Requête 1

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

### Requête 2

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

### Requête 3

```javascript
// Afficher le nombre de publications de type « Book »
db.getCollection("dblp").countDocuments({ type: "Book" });
```

Playground Result :

```console
92
```

### Requête 4

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

### Requête 5

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
    "title": "Shared Interfaces for Co-located Interaction."
  },
  {
    "title": "The Semantic Product Memory: An Interactive Black Box for Smart Objects."
  },
  {
    "title": "Perspectives on Reasoning About Time."
  },
  {
    "title": "A SemProM Use Case: Maintenance of Factory and Automotive Components."
  },
  {
    "title": "A SemProM Use Case: Health Care and Compliance."
  },
  {
    "title": "Controlling Interaction with Digital Product Memories."
  },
  {
    "title": "Foundations of Rule Learning"
  },
  {
    "title": "Ubiquitous Display Environments"
  },
  {
    "title": "Considering the Aesthetics of Ubiquitous Displays."
  },
  {
    "title": "Language Processing with Perl and Prolog - Theories, Implementation, and Application"
  },
  {
    "title": "SemProM - Foundations of Semantic Product Memories for the Internet of Things"
  },
  {
    "title": "Audience Measurement for Digital Signage: Exploring the Audience's Perspective."
  },
  {
    "title": "The Smart SemProM."
  } [...]
]
```
