# UEL315 Base de données (Groupe D)

## Membres du groupe

| Etudiant.e  |   Alias    |
| :---------: | :--------: |
| Mathilde C. | Clouddy23  |
|   Kamo G.   | Spaghette5 |
| Mathieu L.  |  mathleys  |
| Filippos K. |  filkat34  |

## Objectifs

- [x] Concevoir un diagramme de cas d'utilisation
- [x] Concevoir un diagramme de classes
- [x] Concevoir un modèle conceptuel de données
- [x] Créer la base de données SQLite
- [x] Créer les tables de la base de données SQLite
- [x] Rédiger un script sql avec les requêtes à la base de données
- [x] Exécuter le script SQL pour créer et peupler la base de données
- [x] Tester les requêtes de SELECT, UPDATE, DELETE

## Préparation de l'environnement de travail

- Lire la documentation sur le [site officiel](https://plantuml.com/fr/guide) concernant les diagrammes de cas d'utilisation et de classes.
- Installer l'extension [PlantUML](https://marketplace.visualstudio.com/items?itemName=jebbs.plantuml) sur VSCode.
- Regarder [un tutoriel](https://www.youtube.com/watch?v=xkwJ9GwgZJU) pour prendre en main l'extension VSCode de PlantUML
- Télécharger et installer [DBBrowser](https://sqlitebrowser.org/) pour pouvoir gérer une base de données SQLite
- Se renseigner sur les spécificités de [SQLite](https://sqlite.org/lang.html)

## Processus à suivre

1. Créer une branche du dépôt et travailler sur ses requêtes dans le fichier `bankapp_script.sql`
2. Tester ses requêtes en les insérant à la base (fichier `baknapp.db`) grâce à DB Browser
3. Prendre des captures d'écran de ce que vous faites sur DB Browser et les déposer dans le dossier `docs` du dépôt
4. Faire sa demande de tirage

## Tâches

### Modelisation de la base des données

- [x] Concevoir un diagramme de cas d'utilisation
- [x] Concevoir un diagramme de classes
- [x] Concevoir un modèle conceptuel de données

![Diagramme des cas d'utilisation](out/usecases/usecases.png)

![Diagramme de classes](out/ClassDiagram/classdiagram.png)

![Modèle Conceptuel de Données](out/MCD/mcd.png)

### Création de la base de données

- [x] Création d'une base de données SQLite `bankapp.db` grâce au logiciel _DB Browser_
- [x] Ecriture des requêtes SQL de création des différentes tables à partir du MCD
- [x] Exécution du script de création des tables sur DB Browser

![Création des tables](docs/creationTables.png)

## Requêtes SQL du TD

### 1. Insérer des Données

- [x] Ajouter 5 nouveaux clients dans la table Clients.

![Ajout clients](docs/RequêtesSQL/creation5Clients.png)

- [x] Créer 3 nouveaux comptes pour chaque client ajouté.

![Ajout comptes](docs/RequêtesSQL/creation3ComptesClient.png)

- [x] Insérer 10 transactions pour différents comptes.

![Insert 10 transactions](docs/RequêtesSQL/Creation10Transactions.png)

### 2. Lire des Données

- [x] Sélectionner les clients ayant un solde supérieur à 10 000 €.

![solde > 10000](docs/RequêtesSQL/selectionClientsSoldeSuperieur10000.png)

- [x] Afficher toutes les transactions effectuées le mois dernier.

![trans mois dernier](docs/RequêtesSQL/listeTransactionsMoisDernier.png)

- [x] Lister tous les comptes avec un découvert autorisé.

![découvert autorisé](docs/RequêtesSQL/listeComptesDecouvertAutorise.png)

### 3. Mettre à Jour des Données

- [x] Mettre à jour le numéro de téléphone d'un client spécifique.
- [x] Augmenter le découvert autorisé pour certains comptes.
- [x] Modifier le statut des transactions en attente.

### 4. Supprimer des Données

- [x] Supprimer les comptes inactifs depuis plus de 2 ans.
- [x] Effacer les transactions refusées ou annulées.
- [x] Retirer les clients sans transactions actives.

### 5. Requêtes Complexes

- [x] Compter le nombre total de transactions par type de compte.

![Requete1](docs/requetes_complexes/requete1.png)

- [x] Calculer la moyenne des soldes de tous les comptes épargne.

![Requete2](docs/requetes_complexes/requete2.png)

- [x] Trouver les 5 clients les plus actifs en termes de transactions.

![Requete3](docs/requetes_complexes/requete3.png)

- [x] Lister les prêts dont la durée restante est inférieure à un an.

![Requete4](docs/requetes_complexes/requete4.png)

- [x] Afficher le total des prêts accordés par conseiller.

![Requete5](docs/requetes_complexes/requete5.png)

### 6. Requêtes Avancées

- [x] Identifier les clients avec un total d'investissements supérieur à leur solde total.

![Requete1](docs/requetes_avancees/requete1.png)

- [x] Trouver les comptes ayant le plus haut taux de transactions réussies.

![Requete2](docs/requetes_avancees/requete2.png)

- [x] Lister les clients qui n'ont pas utilisé de services de prêt ou d'investissement.

![Requete3](docs/requetes_avancees/requete3.png)

- [x] Déterminer le montant total des intérêts générés par les prêts.

![Requete4](docs/requetes_avancees/requete4.png)

- [x] Calculer la variation mensuelle du nombre de transactions.

![Requete5](docs/requetes_avancees/requete5.png)

## Webographie

### Autres logiciels de modelisation opensource

- [Looping](https://www.looping-mcd.fr/)
- [Umbrello](https://apps.kde.org/fr/umbrello/)

### Pour s'entraîner au SQL

- [SQLBolt](https://sqlbolt.com/)
