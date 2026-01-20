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
- [ ] Exercice 2 (requêtes 1 à 5)
- [ ] Exercice 2 (requêtes 6 à 9) - Kamo
- [x] Exercice 3 (requêtes 1 à 5) - Filippos
- [ ] Exercice 3 (requêtes 6 à 10)

## Exercice 1

## Exercice 2

## Exercice 3

### Requête 1

```javascript
const newBook = db.getCollection("dblp").insertOne({
  type: "Book",
  title:
    "Modern Database Systems: The Object Model, Interoperability, and Beyond.",
  year: 1995,
  publisher: "ACM Press and Addison-Wesley",
  authors: ["Won Kim"],
  source: "DBLP",
});
console.log(newBook);
```

Sortie console :

```javascript
{
  acknowledged: true,
  insertedId: ObjectId('696ea8e22cb59dfa64fc830e')
}
```

### Requête 2

```javascript
// Insérer un nouvel enregistrement dans la collection
const newArticle = db.getCollection("dblp").insertOne({
  type: "Article",
  title: "Pas d'inspiration",
  year: 2026,
  publisher: "PULIM",
  authors: ["Filippos Katsanos", "John Doe"],
  source: "DBLP",
});

console.log(newArticle);
```

Sortie console :

```javascript
{
  acknowledged: true,
  insertedId: ObjectId('696ea8e22cb59dfa64fc830f')
}
```

### Requête 3

```javascript
// Afficher le nombre de publications de type « Book »
const bookCount = db.getCollection("dblp").countDocuments({ type: "Book" });
console.log("Nombre de livres:", bookCount);
```

Sortie console :

```console
Nombre de livres:
92
```

### Requête 4

```javascript
// Afficher le nombre de publications dont je suis auteur
const authorName = "Filippos Katsanos";
const authorCount = db
  .getCollection("dblp")
  .countDocuments({ authors: authorName });
console.log(`Nombre de publications de ${authorName}:`, authorCount);
```

Sortie console :

```console
Nombre de publications de Filippos Katsanos:
1
```

### Requête 5

```javascript
//Afficher le nombre de publications de type « Article » depuis 2012
const articleCountSince2012 = db
  .getCollection("dblp")
  .countDocuments({ type: "Article", year: { $gte: 2012 } });
console.log("Nombre d'articles depuis 2012:", articleCountSince2012);
```

Sortie console :

```console
Nombre d'articles depuis 2012:
230
```
