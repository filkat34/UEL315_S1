-- Activer les contraintes de clés étrangères
-- Essentiel pour maintenir l'intégrité référentielle
PRAGMA foreign_keys = ON;

-- CRÉATION DES TABLES PRINCIPALES

-- Table Client
CREATE TABLE Client (
    client_id TEXT PRIMARY KEY,
    nom TEXT NOT NULL,
    prenom TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    telephone TEXT,
    adresse TEXT,
    date_creation TEXT NOT NULL DEFAULT (date('now')),
    date_maj TEXT NOT NULL DEFAULT (datetime('now'))
);

-- Table Conseiller
CREATE TABLE Conseiller (
    conseiller_id TEXT PRIMARY KEY,
    nom TEXT NOT NULL,
    prenom TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    specialite TEXT,
    date_embauche TEXT NOT NULL,
    date_maj TEXT NOT NULL DEFAULT (datetime('now'))
);

-- Table Administrateur
CREATE TABLE Administrateur (
    admin_id TEXT PRIMARY KEY,
    nom TEXT NOT NULL,
    prenom TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    niveau TEXT NOT NULL,
    date_creation TEXT NOT NULL DEFAULT (date('now')),
    date_maj TEXT NOT NULL DEFAULT (datetime('now'))
);

-- Table Compte
CREATE TABLE Compte (
    numero_compte TEXT PRIMARY KEY,
    solde REAL NOT NULL DEFAULT 0.00,
    type_compte TEXT NOT NULL CHECK (type_compte IN ('COURANT','EPARGNE','PROFESSIONNEL')),
    date_ouverture TEXT NOT NULL DEFAULT (date('now')),
    statut TEXT NOT NULL DEFAULT 'ACTIF' CHECK (statut IN ('ACTIF','FERME','SUSPENDU')),
    date_maj TEXT NOT NULL DEFAULT (datetime('now')),
    client_id TEXT NOT NULL,
    FOREIGN KEY (client_id) REFERENCES Client(client_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Table Transactions
CREATE TABLE Transactions (
    transaction_id TEXT PRIMARY KEY,
    montant REAL NOT NULL,
    type_transaction TEXT NOT NULL CHECK (type_transaction IN ('VIREMENT','DEPOT','RETRAIT','PAIEMENT_RECURRENT')),
    date_transaction TEXT NOT NULL DEFAULT (datetime('now')),
    description TEXT,
    statut TEXT NOT NULL DEFAULT 'EN_ATTENTE' CHECK (statut IN ('EN_ATTENTE','VALIDEE','ANNULEE')),
    date_maj TEXT NOT NULL DEFAULT (datetime('now')),
    compte_id TEXT NOT NULL,
    FOREIGN KEY (compte_id) REFERENCES Compte(numero_compte) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Table Pret
CREATE TABLE Pret (
    pret_id TEXT PRIMARY KEY,
    montant REAL NOT NULL,
    taux_interet REAL NOT NULL,
    duree_mois INTEGER NOT NULL,
    statut TEXT NOT NULL DEFAULT 'EN_ATTENTE' CHECK (statut IN ('EN_ATTENTE','APPROUVE','REFUSE','EN_COURS','REMBOURSE')),
    date_debut TEXT,
    date_fin TEXT,
    mensualite REAL,
    date_maj TEXT NOT NULL DEFAULT (datetime('now')),
    client_id TEXT NOT NULL,
    conseiller_id TEXT,
    FOREIGN KEY (client_id) REFERENCES Client(client_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (conseiller_id) REFERENCES Conseiller(conseiller_id) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Table Investissement
CREATE TABLE Investissement (
    investissement_id TEXT PRIMARY KEY,
    type_investissement TEXT NOT NULL,
    montant REAL NOT NULL,
    date_achat TEXT NOT NULL,
    prix_unitaire REAL NOT NULL,
    quantite REAL NOT NULL,
    statut TEXT NOT NULL DEFAULT 'ACTIF' CHECK (statut IN ('ACTIF','VENDU')),
    date_maj TEXT NOT NULL DEFAULT (datetime('now')),
    client_id TEXT NOT NULL,
    FOREIGN KEY (client_id) REFERENCES Client(client_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Table RendezVous
CREATE TABLE RendezVous (
    rendez_vous_id TEXT PRIMARY KEY,
    date_heure_rendez_vous TEXT NOT NULL,
    motif TEXT,
    statut TEXT NOT NULL DEFAULT 'PROGRAMME' CHECK (statut IN ('PROGRAMME','CONFIRME','ANNULE','TERMINE')),
    lieu TEXT,
    type_rendez_vous TEXT NOT NULL CHECK (type_rendez_vous IN ('PHYSIQUE','VISIO','TELEPHONIQUE')),
    date_maj TEXT NOT NULL DEFAULT (datetime('now')),
    client_id TEXT NOT NULL,
    conseiller_id TEXT NOT NULL,
    FOREIGN KEY (client_id) REFERENCES Client(client_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (conseiller_id) REFERENCES Conseiller(conseiller_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Table Message
CREATE TABLE Message (
    message_id TEXT PRIMARY KEY,
    contenu TEXT NOT NULL,
    date_envoi TEXT NOT NULL DEFAULT (datetime('now')),
    lu INTEGER NOT NULL DEFAULT 0 CHECK (lu IN (0,1)),
    type_message TEXT NOT NULL CHECK (type_message IN ('CLIENT_TO_CONSEILLER','CONSEILLER_TO_CLIENT','SYSTEM')),
    expediteur_id TEXT NOT NULL,
    destinataire_id TEXT NOT NULL,
    expediteur_type TEXT NOT NULL CHECK (expediteur_type IN ('CLIENT','CONSEILLER','SYSTEM')),
    destinataire_type TEXT NOT NULL CHECK (destinataire_type IN ('CLIENT','CONSEILLER'))
);

-- Table Document
CREATE TABLE Document (
    document_id TEXT PRIMARY KEY,
    nom TEXT NOT NULL,
    type_document TEXT NOT NULL,
    date_upload TEXT NOT NULL DEFAULT (datetime('now')),
    chemin_fichier TEXT NOT NULL,
    taille INTEGER,
    statut TEXT NOT NULL DEFAULT 'ACTIF' CHECK (statut IN ('ACTIF','ARCHIVE','SUPPRIME')),
    date_maj TEXT NOT NULL DEFAULT (datetime('now')),
    client_id TEXT NOT NULL,
    FOREIGN KEY (client_id) REFERENCES Client(client_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Table Notification
CREATE TABLE Notification (
    notification_id TEXT PRIMARY KEY,
    titre TEXT NOT NULL,
    message TEXT NOT NULL,
    date_envoi TEXT NOT NULL DEFAULT (datetime('now')),
    lu INTEGER NOT NULL DEFAULT 0 CHECK (lu IN (0,1)),
    type_notification TEXT NOT NULL CHECK (type_notification IN ('INFO','ALERTE','RAPPEL')),
    priorite TEXT NOT NULL DEFAULT 'NORMALE' CHECK (priorite IN ('BASSE','NORMALE','HAUTE')),
    date_maj TEXT NOT NULL DEFAULT (datetime('now')),
    client_id TEXT NOT NULL,
    FOREIGN KEY (client_id) REFERENCES Client(client_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Table de liaison Client_Conseiller (relation many-to-many)
CREATE TABLE Client_Conseiller (
    client_id TEXT,
    conseiller_id TEXT,
    date_attribution TEXT NOT NULL DEFAULT (date('now')),
    statut TEXT NOT NULL DEFAULT 'ACTIF' CHECK (statut IN ('ACTIF','INACTIF')),
    date_maj TEXT NOT NULL DEFAULT (datetime('now')),
    PRIMARY KEY (client_id, conseiller_id),
    FOREIGN KEY (client_id) REFERENCES Client(client_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (conseiller_id) REFERENCES Conseiller(conseiller_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- REQUÊTES SQL

-- Ajouter des administrateurs
INSERT INTO Administrateur (admin_id, nom, prenom, email, niveau) VALUES 
    ('ADMIN002', 'Martin', 'Sophie', 'sophie.martin@bankapp.com', 'ADMIN'),
    ('ADMIN003', 'Bernard', 'Pierre', 'pierre.bernard@bankapp.com', 'ADMIN');

--- REQUÊTES COMPLEXES

-- Compter le nombre total de transactions par type de compte
SELECT c.type_compte, COUNT(t.transaction_id) as nombre_transactions
FROM Compte c
LEFT JOIN Transactions t ON c.numero_compte = t.compte_id
GROUP BY c.type_compte;

-- Calculer la moyenne des soldes de tous les comptes épargne
SELECT AVG(solde) as moyenne_solde_epargne
FROM Compte
WHERE type_compte = 'EPARGNE';

-- Trouver les 5 clients les plus actifs en termes de transactions
SELECT cl.nom, cl.prenom, COUNT(t.transaction_id) as total_transactions
FROM Client cl
JOIN Compte c ON cl.client_id = c.client_id
JOIN Transactions t ON c.numero_compte = t.compte_id
GROUP BY cl.client_id
ORDER BY total_transactions DESC
LIMIT 5;

-- Lister les prêts dont la durée restante est inférieure à un an
SELECT *
FROM Pret
WHERE date(date_debut, '+' || duree_mois || ' months') < date('now', '+1 year')
  AND statut = 'EN_COURS';

-- Afficher le total des prêts accordés par conseiller
SELECT co.nom, co.prenom, COUNT(p.pret_id) as nombre_prets, SUM(p.montant) as montant_total
FROM Conseiller co
JOIN Pret p ON co.conseiller_id = p.conseiller_id
WHERE p.statut IN ('APPROUVE', 'EN_COURS', 'REMBOURSE')
GROUP BY co.conseiller_id;

--- REQUÊTES AVANCÉES

-- Identifier les clients avec un total d'investissements supérieur à leur solde total
SELECT c.client_id, c.nom, c.prenom,
       SUM(i.montant) as total_investissements,
       (SELECT SUM(solde) FROM Compte WHERE client_id = c.client_id) as total_solde
FROM Client c
JOIN Investissement i ON c.client_id = i.client_id
GROUP BY c.client_id
HAVING total_investissements > total_solde;

-- Trouver les comptes ayant le plus haut taux de transactions réussies
SELECT c.numero_compte,
       (CAST(SUM(CASE WHEN t.statut = 'VALIDEE' THEN 1 ELSE 0 END) AS REAL) / COUNT(t.transaction_id)) * 100 as taux_reussite
FROM Compte c
JOIN Transactions t ON c.numero_compte = t.compte_id
GROUP BY c.numero_compte
ORDER BY taux_reussite DESC;

-- Lister les clients qui n'ont pas utilisé de services de prêt ou d'investissement
SELECT client_id, nom, prenom
FROM Client
WHERE client_id NOT IN (SELECT client_id FROM Pret)
  AND client_id NOT IN (SELECT client_id FROM Investissement);

-- Déterminer le montant total des intérêts générés par les prêts
SELECT SUM((mensualite * duree_mois) - montant) as total_interets
FROM Pret
WHERE statut IN ('EN_COURS', 'REMBOURSE') AND mensualite IS NOT NULL;

-- Calculer la variation mensuelle du nombre de transactions
WITH MonthlyStats AS (
    SELECT strftime('%Y-%m', date_transaction) as mois,
           COUNT(*) as nb_transactions
    FROM Transactions
    GROUP BY mois
)
SELECT mois,
       nb_transactions,
       LAG(nb_transactions, 1, 0) OVER (ORDER BY mois) as mois_precedent,
       (nb_transactions - LAG(nb_transactions, 1, 0) OVER (ORDER BY mois)) as variation
FROM MonthlyStats;