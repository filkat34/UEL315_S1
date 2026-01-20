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
- [ ] Exercice 3 (requêtes 6 à 10)

## Exercice 1

## Exercice 2
### Requête 1
```js
// Afficher tous les titres
db.getCollection('documents').find(
    {}, 
    { "fields.titre_avec_lien_vers_le_catalogue": 1, "_id": 0 }
)
```

Playground Result :

```js
[
  {
    "fields": {
      "titre_avec_lien_vers_le_catalogue": "Cinquante nuances plus sombres : roman"
    }
  },
  {
    "fields": {
      "titre_avec_lien_vers_le_catalogue": "Dans la maison"
    }
  },
  {
    "fields": {
      "titre_avec_lien_vers_le_catalogue": "La nostalgie heureuse"
    }
  },
  {
    "fields": {
      "titre_avec_lien_vers_le_catalogue": "Au revoir là-haut : roman"
    }
  },
  {
    "fields": {
      "titre_avec_lien_vers_le_catalogue": "Les lisières"
    }
  },
  {
    "fields": {
      "titre_avec_lien_vers_le_catalogue": "Quai d'Orsay : chroniques diplomatiques. 2"
    }
  },
  {
    "fields": {
      "titre_avec_lien_vers_le_catalogue": "Etranges rivages"
    }
  },
  {
    "fields": {
      "titre_avec_lien_vers_le_catalogue": "L'hiver du monde : roman"
    }
  },
  {
    "fields": {
      "titre_avec_lien_vers_le_catalogue": "La révolte"
    }
  },
  {
    "fields": {
      "titre_avec_lien_vers_le_catalogue": "Peste & choléra : roman"
    }
  },
  {
    "fields": {
      "titre_avec_lien_vers_le_catalogue": "Immortelle randonnée : Compostelle malgré moi"
    }
  },
  {
    "fields": {
      "titre_avec_lien_vers_le_catalogue": "Hunger Games"
    }
  },
  {
    "fields": {
      "titre_avec_lien_vers_le_catalogue": "Que choisir ?"
    }
  },
  {
    "fields": {
      "titre_avec_lien_vers_le_catalogue": "Skyfall"
    }
  },
  {
    "fields": {
      "titre_avec_lien_vers_le_catalogue": "Polisse"
    }
  },
  {
    "fields": {
      "titre_avec_lien_vers_le_catalogue": "Kaïken : roman"
    }
  },
  {
    "fields": {
      "titre_avec_lien_vers_le_catalogue": "Le grand Coeur : roman"
    }
  },
  {
    "fields": {
      "titre_avec_lien_vers_le_catalogue": "Aya de Yopougon. 3"
    }
  },
  {
    "fields": {
      "titre_avec_lien_vers_le_catalogue": "The Master"
    }
  },
  {
    "fields": {
      "titre_avec_lien_vers_le_catalogue": "Les femmes du bus 678"
    }
  }
]
```

### Requête 2
```js
// Afficher tous les titres des documents ayant les rangs 1 à 10
db.getCollection('documents').find(
    { "fields.rang": { $gte: 1, $lte: 10 } }, 
    { "fields.titre_avec_lien_vers_le_catalogue": 1, "_id": 0 }
)
```

Playground Result :

```js
[
  {
    "fields": {
      "titre_avec_lien_vers_le_catalogue": "Cinquante nuances plus sombres : roman"
    }
  },
  {
    "fields": {
      "titre_avec_lien_vers_le_catalogue": "Au revoir là-haut : roman"
    }
  },
  {
    "fields": {
      "titre_avec_lien_vers_le_catalogue": "Immortelle randonnée : Compostelle malgré moi"
    }
  },
  {
    "fields": {
      "titre_avec_lien_vers_le_catalogue": "1Q84. 3. Octobre-décembre"
    }
  },
  {
    "fields": {
      "titre_avec_lien_vers_le_catalogue": "L'embrasement"
    }
  },
  {
    "fields": {
      "titre_avec_lien_vers_le_catalogue": "Le sermon sur la chute de Rome"
    }
  },
  {
    "fields": {
      "titre_avec_lien_vers_le_catalogue": "La vérité sur l'affaire Harry Quebert : roman"
    }
  },
  {
    "fields": {
      "titre_avec_lien_vers_le_catalogue": "Le bleu est une couleur chaude"
    }
  },
  {
    "fields": {
      "titre_avec_lien_vers_le_catalogue": "La liste de mes envies"
    }
  },
  {
    "fields": {
      "titre_avec_lien_vers_le_catalogue": "Cinquante nuances de Grey : roman"
    }
  }
]
```

### Requête 3
```js
// Afficher les auteurs de tous les documents dont le titre commence par la lettre N
db.getCollection('documents').find(
    { "fields.titre_avec_lien_vers_le_catalogue": /^N/ }, 
    { "fields.auteur": 1, "_id": 0 }
)
```

Playground Result :

```js
[
  {
    "fields": {
      "auteur": "Gloaguen, Philippe"
    }
  },
  {
    "fields": {
      "auteur": "Mukasonga, Scholastique"
    }
  },
  {
    "fields": {
      "auteur": "Moix, Yann"
    }
  },
  {
    "fields": {
      "auteur": "Coatalem, Jean-Luc"
    }
  },
  {
    "fields": {
      "auteur": ""
    }
  },
  {
    "fields": {
      "auteur": "Hunter, Erin"
    }
  },
  {
    "fields": {
      "auteur": "Bonetto, Cristian"
    }
  },
  {
    "fields": {
      "auteur": "Toussaint, Jean-Philippe"
    }
  },
  {
    "fields": {
      "auteur": ""
    }
  },
  {
    "fields": {
      "auteur": "Roth, Philip"
    }
  },
  {
    "fields": {
      "auteur": ""
    }
  },
  {
    "fields": {
      "auteur": ""
    }
  },
  {
    "fields": {
      "auteur": "Coben, Harlan"
    }
  },
  {
    "fields": {
      "auteur": "Vigan, Delphine de"
    }
  },
  {
    "fields": {
      "auteur": "Orval, Thierry"
    }
  },
  {
    "fields": {
      "auteur": "Otis, Ginger Adams"
    }
  },
  {
    "fields": {
      "auteur": "Bussi, Michel"
    }
  }
]
```

### Requête 4
```js
// Afficher toutes les informations vers les documents n'ayant pas de champ "type_de_document"
db.getCollection('documents').find(
    { "fields.type_de_document": { $exists: false } }
)
```

Playground Result :

```js
[]
```

### Requête 5
```js
// Afficher les différents types de documents qui apparaissent dans cette base
db.getCollection('documents').distinct("fields.type_de_document")
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
  "Revue pour adulte"
]
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
//Afficher le titre de toutes les publications de type « Article » depuis 2012
// Pour tout afficher utiliser .toArray() pour éviter le retour du curseur seulement
db.getCollection("dblp")
  .find({ type: "Article", year: { $gte: 2012 } }, { title: 1, _id: 0 })
  .toArray();
```

Playground result :

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
    title: "Considering the Aesthetics of Ubiquitous Displays.",
  },
  {
    title:
      "Audience Measurement for Digital Signage: Exploring the Audience's Perspective.",
  },
  {
    title: "The Smart SemProM.",
  },
  {
    title:
      "A SemProM Use Case: Tracking & Tracing for Green Logistics and Integrity Control.",
  },
  {
    title: "Interaction Modalities for Digital Product Memories.",
  },
  {
    title: "From Research to Practice: Automated Negotiations with People.",
  },
  {
    title: "A Summary of End-User Feedback on Digital Product Memories.",
  },
  {
    title:
      "The Design, Deployment and Evaluation of Situated Display-Based Systems to Support Coordination and Community.",
  },
  {
    title: "The SemProM Data Format.",
  },
  {
    title:
      "DPM Mapper: A Concept to Bridge the Gap Between XML-Based Digital Product Memories and Their Binary Representation.",
  },
  {
    title: "Supporting Interaction with Digital Product Memories.",
  },
  {
    title: "Towards an Integrated Framework for Semantic Product Memories.",
  },
  {
    title: "Virtual Technologies and Empowerment of Users of Rehabilitation.",
  },
  {
    title:
      "A Robotic Platform for Building and Exploiting Digital Product Memories.",
  },
  {
    title: "Hardware Requirements for Digital Product Memories.",
  },
  {
    title: "Ubiquitous Display Environments: An Overview.",
  },
  {
    title:
      "Analysis and Prediction of Museum Visitors' Behavioral Pattern Types.",
  },
  {
    title: "A Digital Product Memory Architecture for Cars.",
  },
  {
    title: "Applying Digital Product Memories in Industrial Production.",
  },
  {
    title: "The Block Interface: Accessing Digital Product Memories.",
  },
  {
    title: "Challenges and Solutions of Ubiquitous User Modeling.",
  },
  {
    title:
      "Using Basic RFID-Based Digital Product Memories for Protection against Counterfeit Goods in Manufacturing Plants.",
  },
  {
    title:
      "Enhancement of Consumer Support in Retail Scenarios by Utilization of Semantic Product Memories.",
  },
  {
    title: "Distributed Digital Product Memories.",
  },
  {
    title: "Capturing Sensor Data in the SemProM Automotive Scenario.",
  },
  {
    title: "Trust Management of Ubiquitous Multi-Display Environments.",
  },
  {
    title:
      "xioScreen: Experiences Gained from Building a Series of Prototypes of Interactive Public Displays.",
  },
  {
    title: "Context-Sensitive Display Environments.",
  },
  {
    title: "The Object Memory Server for Semantic Product Memories.",
  },
  {
    title: "SemProM - Dissemination and Impact.",
  },
  {
    title:
      "Clustering and Prediction of Rankings Within a Kemeny Distance Framework.",
  },
  {
    title: "Supervised Classification of Facial Expressions.",
  },
  {
    title: "Correction of Incoherences in Statistical Matching.",
  },
  {
    title:
      "Importance Sampling: A Variance Reduction Method for Credit Risk Models.",
  },
  {
    title:
      "Classifying Tourism Destinations: An Application of Network Analysis.",
  },
  {
    title: "A Hierarchical Clustering Approach to Modularity Maximization.",
  },
  {
    title:
      "Measuring the Success Factors of a Website: Statistical Methods and an Application to a 'Web District'.",
  },
  {
    title: "Assessing Stability in NonLinear PCA with Hierarchical Data.",
  },
  {
    title: "Model-Based Classification Via Patterned Covariance Analysis.",
  },
  {
    title:
      "Nonparametric Multivariate Inference Via Permutation Tests for CUB Models.",
  },
  {
    title: "Recognising Cello Performers Using Timbre Models.",
  },
  {
    title: "Clustering Data Streams by On-Line Proximity Updating.",
  },
  {
    title: "Auralization of Auditory Models.",
  },
  {
    title:
      "A New Fuzzy Method to Classify Professional Profiles from Job Announcements.",
  },
  {
    title:
      "Energy Consumption - Gross Domestic Product Causal Relationship in the Italian Regions.",
  },
  {
    title:
      "A Gaussian-Von Mises Hidden Markov Model for Clustering Multivariate Linear-Circular Data.",
  },
  {
    title: "Factor Preselection and Multiple Measures of Dependence.",
  },
  {
    title:
      "A Simplified Latent Variable Structural Equation Model with Observable Variables Assessed on Ordinal Scales.",
  },
  {
    title:
      "Logic Based Conjoint Analysis Using the Commuting Quantum Query Language.",
  },
  {
    title: "Shared Components Models in Joint Disease Mapping: A Comparison.",
  },
  {
    title:
      "The Analysis of Network Additionality in the Context of Territorial Innovation Policy: The Case of Italian Technological Districts.",
  },
  {
    title:
      "One-Mode Three-Way Analysis Based on Result of One-Mode Two-Way Analysis.",
  },
  {
    title:
      "Comparison of Some Chosen Tests of Independence of Value-at-Risk Violations.",
  },
  {
    title:
      "Robustness Versus Consistency in Ill-Posed Classification and Regression Problems.",
  },
  {
    title:
      "The Combined Median Rank-Based Gini Index for Customer Satisfaction Analysis.",
  },
  {
    title: "Parallel Coordinate Plots in Archaeology.",
  },
  {
    title:
      "Modified Randomized Modularity Clustering: Adapting the Resolution Limit.",
  },
  {
    title:
      "Antecedents and Outcomes of Participation in Social Networking Sites.",
  },
  {
    title:
      "On Clustering and Classification Via Mixtures of Multivariate t-Distributions.",
  },
  {
    title:
      "On the Simultaneous Analysis of Clinical and Omics Data: A Comparison of Globalboosttest and Pre-validation Techniques.",
  },
  {
    title: "Size and Power of Multivariate Outlier Detection Rules.",
  },
  {
    title:
      "On Matters of Invariance in Latent Variable Models: Reflections on the Concept, and its Relations in Classical and Item Response Theory.",
  },
  {
    title:
      "Comparison of Classical and Sequential Design of Experiments in Note Onset Detection.",
  },
  {
    title:
      "Simulation Experiments for Similarity Indexes Between Two Hierarchical Clusterings.",
  },
  {
    title:
      "A Model for the Clustering of Variables Taking into Account External Data.",
  },
  {
    title:
      "Product Design Optimization Using Ant Colony And Bee Algorithms: A Comparison.",
  },
  {
    title:
      "Using the Variation Coefficient for Adaptive Discrete Beta Kernel Graduation.",
  },
  {
    title:
      "Hospital Clustering in the Treatment of Acute Myocardial Infarction Patients Via a Bayesian Semiparametric Approach.",
  },
  {
    title: "Factor PD-Clustering.",
  },
  {
    title:
      "A Continuous Time Mover-Stayer Model for Labor Market in a Northern Italian Area.",
  },
  {
    title:
      "On the Number of Modes of Finite Mixtures of Elliptical Distributions.",
  },
  {
    title: "Ordering Curves by Data Depth.",
  },
  {
    title: "Cluster Analysis Based on Pre-specified Multiple Layer Structure.",
  },
  {
    title:
      "Local Clique Merging: An Extension of the Maximum Common Subgraph Measure with Applications in Structural Bioinformatics.",
  },
  {
    title: "A Two Layers Incremental Discretization Based on Order Statistics.",
  },
  {
    title: "Correspondence Analysis in the Case of Outliers.",
  },
  {
    title:
      "A Comparison of Objective Bayes Factors for Variable Selection in Linear Regression Models.",
  },
  {
    title: "An Approach to Ranking the Hedge Fund Industry.",
  },
  {
    title:
      "Applying Location Planning Algorithms to Schools: The Case of Special Education in Hesse (Germany).",
  },
  {
    title:
      "The Application of M-Function Analysis to the Geographical Distribution of Earthquake Sequence.",
  },
  {
    title:
      "Component Analysis for Structural Equation Models with Concomitant Indicators.",
  },
  {
    title:
      "Model-Based Clustering of Multistate Data with Latent Change: An Application with DHS Data.",
  },
  {
    title:
      "Cluster It! Semiautomatic Splitting and Naming of Classification Concepts.",
  },
  {
    title: "Identification of Risk Factors in Coronary Bypass Surgery.",
  },
  {
    title:
      "A Case Study About the Effort to Classify Music Intervals by Chroma and Spectrum Analysis.",
  },
  {
    title:
      "Visualizing Data in Social and Behavioral Sciences: An Application of PARAMAP on Judicial Statistics.",
  },
  {
    title:
      "Interactive Principal Components Analysis: A New Technological Resource in the Classroom.",
  },
  {
    title: "Linear Logistic Models with Relaxed Assumptions in R.",
  },
  {
    title:
      "Determining the Similarity Between US Cities Using a Gravity Model for Search Engine Query Data.",
  },
  {
    title:
      "An Evaluation Measure for Learning from Imbalanced Data Based on Asymmetric Beta Distribution.",
  },
  {
    title: "Beanplot Data Analysis in a Temporal Framework.",
  },
  {
    title:
      "A Further Proposal to Perform Multiple Imputation on a Bunch of Polytomous Items Based on Latent Class Analysis.",
  },
  {
    title: "Clustering and Registration of Multidimensional Functional Data.",
  },
  {
    title:
      "Summarizing and Detecting Structural Drifts from Multiple Data Streams.",
  },
  {
    title:
      "Computational Prediction of High-Level Descriptors of Music Personal Categories.",
  },
  {
    title: "Calibration with Spatial Data Constraints.",
  },
  {
    title:
      "Robust Random Effects Models: A Diagnostic Approach Based on the Forward Search.",
  },
  {
    title:
      "A Model-Based Approach for Qualitative Assessment in Opinion Mining.",
  },
  {
    title:
      "Outlier Detection for Geostatistical Functional Data: An Application to Sensor Data.",
  },
  {
    title: "High-Dimensional Bayesian Classifiers Using Non-Local Priors.",
  },
  {
    title:
      "Latent Class Models of Time Series Data: An Entropic-Based Uncertainty Measure.",
  },
  {
    title:
      "The Credit Accumulation Process to Assess the Performances of Degree Programs: An Adjusted Indicator Based on the Result of Entrance Tests.",
  },
  {
    title: "Efficient Spatial Segmentation of Hyper-spectral 3D Volume Data.",
  },
  {
    title:
      "Lifestyle Segmentation Based on Contents of Uploaded Images Versus Ratings of Items.",
  },
  {
    title:
      "Convex Optimization as a Tool for Correcting Dissimilarity Matrices for Regular Minimality.",
  },
  {
    title:
      "Multivariate Modelling of Cross-Commodity Price Relations Along the Petrochemical Value Chain.",
  },
  {
    title: "Modelling Spatial Variations of Fertility Rate in Italy.",
  },
  {
    title:
      "On Two Classes of Weighted Rank Correlation Measures Deriving from the Spearman's ?.",
  },
  {
    title: "An Approach to Forecasting Beanplot Time Series.",
  },
  {
    title:
      "Non-symmetrical Correspondence Analysis of Abbreviated Hard Laddering Interviews.",
  },
  {
    title:
      "Symbolic Cluster Representations for SVM in Credit Client Classification Tasks.",
  },
  {
    title:
      "Spatial Data Mining for Clustering: An Application to the Florentine Metropolitan Area Using RedCap.",
  },
  {
    title:
      "Mixture Model Clustering with Covariates Using Adjusted Three-Step Approaches.",
  },
  {
    title:
      "Solving the Minimum Sum of L1 Distances Clustering Problem by Hyperbolic Smoothing and Partition into Boundary and Gravitational Regions.",
  },
  {
    title:
      "Classification of Data Chunks Using Proximal Vector Machines and Singular Value Decomposition.",
  },
  {
    title:
      "A New Effective Method for Elimination of Systematic Error in Experimental High-Throughput Screening.",
  },
  {
    title: "Issues on Clustering and Data Gridding.",
  },
  {
    title:
      "User-Generated Content for Image Clustering and Marketing Purposes.",
  },
  {
    title: "Inference on the CUB Model: An MCMC Approach.",
  },
  {
    title: "Implications of Axiomatic Consensus Properties.",
  },
  {
    title:
      "Complexity Selection with Cross-validation for Lasso and Sparse Partial Least Squares Using High-Dimensional Data.",
  },
  {
    title:
      "Interpreting Error Measurement: A Case Study Based on Rasch Tree Approach.",
  },
  {
    title:
      "Piano and Guitar Tone Distinction Based on Extended Feature Analysis.",
  },
  {
    title:
      "A Metric Based Approach for the Least Square Regression of Multivariate Modal Symbolic Data.",
  },
  {
    title:
      "Misspecification Resistant Model Selection Using Information Complexity with Applications.",
  },
  {
    title:
      "Optimal Network Revenue Management Decisions Including Flexible Demand Data and Overbooking.",
  },
  {
    title:
      "Detecting Person Heterogeneity in a Large-Scale Orthographic Test Using Item Response Models.",
  },
  {
    title: "Graduation by Adaptive Discrete Beta Kernels.",
  },
  {
    title: "Principal Components Analysis for a Gaussian Mixture.",
  },
  {
    title: "Intrablocks Correspondence Analysis.",
  },
  {
    title: "Dynamic Data Analysis of Evolving Association Patterns.",
  },
  {
    title:
      "Can the Students' Career be Helpful in Predicting an Increase in Universities Income?",
  },
  {
    title: "Visualisation of Cluster Analysis Results.",
  },
  {
    title:
      "High Performance Hardware Architectures for Automated Music Classification.",
  },
  {
    title:
      "Vulnerability of Copula-VaR to Misspecification of Margins and Dependence Structure.",
  },
  {
    title: "Properties of a General Measure of Configuration Agreement.",
  },
  {
    title:
      "Performance Measurement of Italian Provinces in the Presence of Environmental Goals.",
  },
  {
    title:
      "A MCMC Approach for Learning the Structure of Gaussian Acyclic Directed Mixed Graphs.",
  },
  {
    title:
      "External Analysis of Asymmetric Multidimensional Scaling Based on Singular Value Decomposition.",
  },
  {
    title: "Web Panel Representativeness.",
  },
  {
    title: "Grouping Around Different Dimensional Affine Subspaces.",
  },
  {
    title:
      "A Clusterwise Regression Method for the Prediction of the Disposal Income in Municipalities.",
  },
  {
    title:
      "A New Distance Function for Prototype Based Clustering Algorithms in High Dimensional Spaces.",
  },
  {
    title: "An Approach for Topic Trend Detection.",
  },
  {
    title: "Sentiment Analysis of Online Media.",
  },
  {
    title:
      "Visualisation and Analysis of Affiliation Networks as Tools to Describe Professional Profiles.",
  },
  {
    title:
      "Variable Selection in Cluster Analysis: An Approach Based on a New Index.",
  },
  {
    title: "Clustering Ordinal Data via Latent Variable Models.",
  },
  {
    title:
      "Optimal Decision Rules for Constrained Record Linkage: An Evolutionary Approach.",
  },
  {
    title: "A Theoretical and Empirical Analysis of the Black-Litterman Model.",
  },
  {
    title: "Classification of Roman Tiles with Stamp PARDALIVS.",
  },
  {
    title: "Asymmetric Multidimensional Scaling Models for Seriation.",
  },
  {
    title: "Data Stream Summarization by Histograms Clustering.",
  },
  {
    title: "Graphical Models for Eliciting Structural Information.",
  },
  {
    title:
      "Comparing Earth Mover's Distance and its Approximations for Clustering Images.",
  },
  {
    title: "Adaptive Spectral Clustering in Molecular Simulation.",
  },
  {
    title:
      "An Efficient Algorithm for the Detection and Classification of Horizontal Gene Transfer Events and Identification of Mosaic Genes.",
  },
  {
    title: "Regularization and Model Selection with Categorical Covariates.",
  },
  {
    title:
      "Dynamic Principal Component Analysis: A Banking Customer Satisfaction Evaluation.",
  },
  {
    title:
      "Evolutionary Customer Evaluation: A Dynamic Approach to a Banking Case.",
  },
  {
    title:
      "A Two-Phase Clustering Based Strategy for Outliers Detection in Georeferenced Curves.",
  },
  {
    title: "Fundamental Portfolio Construction Based on Mahalanobis Distance.",
  },
  {
    title:
      "Joint Correspondence Analysis Versus Multiple Correspondence Analysis: A Solution to an Undetected Problem.",
  },
  {
    title: "Human-Robot Interaction.",
  },
  {
    title:
      "Motion Planning Using a ToF Camera for Manipulation in Cluttered Environments.",
  },
  {
    title: "Grasping and Control of Multi-Fingered Hands.",
  },
  {
    title: "Rule Set Based Joint State Update.",
  },
  {
    title: "Semantic Attachments for Domain-Independent Planning Systems.",
  },
  {
    title: "Robot Development Process in the DESIRE Project.",
  },
  {
    title:
      "DESIRE WEB 2.0 - Integration Management and Distributed Software Development for Complex Service Robots.",
  },
  {
    title: "Event-Oriented Incremental Component Construction.",
  },
  {
    title: "Scene Analysis for Service Robots.",
  },
  {
    title: "Continual Multiagent Planning.",
  },
  {
    title: "Editorial.",
  },
  {
    title:
      "Range-Based People Detection and Tracking for Socially Enabled Service Robots.",
  },
  {
    title: "Editorial.",
  },
  {
    title: "Navigation in Landmark Networks.",
  },
  {
    title: "Semi Automatic Object Modeling for a Service Robot.",
  },
  {
    title: "Observation and Execution.",
  },
  {
    title: "Face Detection and Person Identification on Mobile Platforms.",
  },
  {
    title: "A High-Speed Tactile Sensor for Slip Detection.",
  },
  {
    title: "Editorial.",
  },
  {
    title:
      "Proactive Continual Planning - - Deliberately Interleaving Planning and Execution in Dynamic Environments.",
  },
  {
    title: "Editorial.",
  },
  {
    title: "Editorial.",
  },
  {
    title: "Structuring Human-Robot-Interaction in Tutoring Scenarios.",
  },
  {
    title: "Editorial.",
  },
  {
    title: "Robot Hardware Design in the DESIRE Project.",
  },
  {
    title: "Identifying Relevant Tactile Features for Object Identification.",
  },
  {
    title:
      "An Automatic Grasp Planning System for Multi-fingered Robotic Hands.",
  },
  {
    title:
      "Component Based Architecture for an Intelligent Mobile Manipulator.",
  },
  {
    title:
      "Layered Programming by Demonstration and Planning for Autonomous Robot Manipulation.",
  },
  {
    title: "A Mixed-Initiative Approach to Interactive Robot Tutoring.",
  },
  {
    title: "Body Schema Learning.",
  },
  {
    title: "Editorial.",
  },
  {
    title: "Innovative Technologies for the Next Generation of Robotic Hands.",
  },
  {
    title: "Exploiting RFID Capabilities Onboard a Service Robot Platform.",
  },
  {
    title: "Grasping Objects of Unknown Geometry with Tactile Feedback.",
  },
  {
    title: "Task-Based Mixed-Initiative Coordination.",
  },
  {
    title: "Flexible Control of Complex Kinematic Chains.",
  },
  {
    title: "3D Environment Modeling Based on Surface Primitives.",
  },
  {
    title: "Editorial.",
  },
  {
    title: "Dual-Arm Manipulation.",
  },
  {
    title: "Task Planning for an Autonomous Service Robot.",
  },
  {
    title:
      "Using the Context-Enhanced Additive Heuristic for Temporal and Numeric Planning.",
  },
  {
    title: "Fault Attacks on Elliptic Curve Cryptosystems.",
  },
  {
    title:
      "Interaction Between Fault Attack Countermeasures and the Resistance Against Power Analysis Attacks.",
  },
  {
    title: "Attacking Block Ciphers.",
  },
  {
    title: "Differential Fault Analysis of DES.",
  },
  {
    title:
      "Design of Cryptographic Devices Resilient to Fault Injection Attacks Using Nonlinear Robust Codes.",
  },
  {
    title:
      "A Survey of Differential Fault Analysis Against Classical RSA Implementations.",
  },
  {
    title: "Fault Attacks on Stream Ciphers.",
  },
  {
    title: "Global Faults on Cryptographic Circuits.",
  },
  {
    title: "Fault Attacks on Pairing-Based Cryptography.",
  },
  {
    title: "Injection Technologies for Fault Attacks on Microprocessors.",
  },
  {
    title: "Lattice-Based Fault Attacks on Signatures.",
  },
  {
    title: "Fault Attacks Against RSA-CRT Implementation.",
  },
  {
    title:
      "On Countermeasures Against Fault Attacks on the Advanced Encryption Standard.",
  },
  {
    title: "Differential Fault Analysis of the Advanced Encryption Standard.",
  },
  {
    title: "Side-Channel Analysis and Its Relevance to Fault Attacks.",
  },
  {
    title:
      "Fault Injection and Key Retrieval Experiments on an Evaluation Board.",
  },
  {
    title: "Countermeasures for Symmetric Key Ciphers.",
  },
  {
    title:
      "On Countermeasures Against Fault Attacks on Elliptic Curve Cryptography Using Fault Detection.",
  },
  {
    title: "Pas d'inspiration",
  },
];
```
