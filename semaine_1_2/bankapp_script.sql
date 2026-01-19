-- Activer les contraintes de clés étrangères
-- Essentiel pour maintenir l'intégrité référentielle
PRAGMA foreign_keys = ON;

--- ==========================================
--- CREATION DES TABLES
--- ==========================================

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
    decouvert_autorise REAL NOT NULL DEFAULT 0.0, --- Ajout decouvert autorisé pour requêtes 
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

--- ==========================================
--- INSERTIONS DE DONNÉES INITIALES
--- ==========================================

-- Ajout de 5 nouveaux clients
INSERT OR IGNORE INTO Client (client_id, nom, prenom, email, telephone, adresse)
VALUES
  ('CL101','Dupont','Marie','marie.dupont@mail.com','0600000101','10 rue A, Paris'),
  ('CL102','Martin','Lucas','lucas.martin@mail.com','0600000102','22 rue B, Lyon'),
  ('CL103','Bernard','Inès','ines.bernard@mail.com','0600000103','5 rue C, Lille'),
  ('CL104','Cassie','Nora','nora.cassie@mail.com','0600000104','1 rue D, Nice'),
  ('CL105','Moreau','Yanis','yanis.moreau@mail.com','0600000105','8 rue E, Bordeaux');

-- Création de 3 comptes pour chaque client
INSERT OR IGNORE INTO Compte (numero_compte, solde, type_compte, statut, client_id, date_ouverture)
VALUES
  ('ACC101C', 12500.00, 'COURANT',       'ACTIF', 'CL101', date('now','-3 years')),
  ('ACC101E',  4200.00, 'EPARGNE',       'ACTIF', 'CL101', date('now','-2 years')),
  ('ACC101P',  8000.00, 'PROFESSIONNEL', 'ACTIF', 'CL101', date('now','-1 years')),

  ('ACC102C',   900.00, 'COURANT',       'ACTIF', 'CL102', date('now','-2 years')),
  ('ACC102E', 11000.00, 'EPARGNE',       'ACTIF', 'CL102', date('now','-1 years')),
  ('ACC102P',  1500.00, 'PROFESSIONNEL', 'SUSPENDU', 'CL102', date('now','-4 years')),

  ('ACC103C',  -150.00, 'COURANT',       'ACTIF', 'CL103', date('now','-8 months')),
  ('ACC103E',  2500.00, 'EPARGNE',       'ACTIF', 'CL103', date('now','-6 months')),
  ('ACC103P',  3200.00, 'PROFESSIONNEL', 'ACTIF', 'CL103', date('now','-10 months')),

  ('ACC104C',  3000.00, 'COURANT',       'ACTIF', 'CL104', date('now','-18 months')),
  ('ACC104E',  7000.00, 'EPARGNE',       'ACTIF', 'CL104', date('now','-2 months')),
  ('ACC104P',   200.00, 'PROFESSIONNEL', 'FERME', 'CL104', date('now','-5 years')),

  ('ACC105C',  4500.00, 'COURANT',       'ACTIF', 'CL105', date('now','-1 years')),
  ('ACC105E',  1500.00, 'EPARGNE',       'ACTIF', 'CL105', date('now','-9 months')),
  ('ACC105P', 25000.00, 'PROFESSIONNEL', 'ACTIF', 'CL105', date('now','-3 months'));

-- Ajout de 10 transactions pour différents comptes
INSERT OR IGNORE INTO Transactions (transaction_id, montant, type_transaction, date_transaction, description, statut, compte_id)
VALUES
  ('TRX001', 2500.00, 'DEPOT',   datetime('now','-20 days'), 'Salaire',            'VALIDEE',   'ACC101C'),
  ('TRX002',  120.00, 'RETRAIT', datetime('now','-18 days'), 'Retrait DAB',        'VALIDEE',   'ACC101C'),
  ('TRX003',  300.00, 'VIREMENT',datetime('now','-12 days'), 'Virement loyer',     'VALIDEE',   'ACC101C'),
  ('TRX004',   80.00, 'PAIEMENT_RECURRENT', datetime('now','-35 days'), 'Abonnement', 'VALIDEE', 'ACC101C'),

  ('TRX005', 1000.00, 'DEPOT',   datetime('now','-10 days'), 'Prime',              'VALIDEE',   'ACC102E'),
  ('TRX006',  600.00, 'VIREMENT',datetime('now','-8 days'),  'Virement vers ACC103C', 'VALIDEE','ACC102E'),

  ('TRX007',   60.00, 'RETRAIT', datetime('now','-5 days'),  'Retrait',            'EN_ATTENTE','ACC103C'),
  ('TRX008',  200.00, 'DEPOT',   datetime('now','-2 days'),  'Dépôt espèces',      'VALIDEE',   'ACC103C'),

  ('TRX009',  150.00, 'PAIEMENT_RECURRENT', datetime('now','-40 days'), 'Facture', 'ANNULEE',  'ACC104C'),
  ('TRX010',  900.00, 'VIREMENT',datetime('now','-15 days'), 'Virement pro',       'VALIDEE',   'ACC105P');

  -- Administrateurs
INSERT OR IGNORE INTO Administrateur (admin_id, nom, prenom, email, niveau) VALUES 
('ADMIN002', 'Martin', 'Sophie', 'sophie.martin@bankapp.com', 'ADMIN'),
('ADMIN003', 'Bernard', 'Pierre', 'pierre.bernard@bankapp.com', 'ADMIN');

-- Conseillers
INSERT OR IGNORE INTO Conseiller (conseiller_id, nom, prenom, email, specialite, date_embauche, date_maj)
VALUES
('CO001','Durand','Paul','paul.durand@bankapp.com','Crédit', date('now'), datetime('now')),
('CO002','Legrand','Sana','sana.legrand@bankapp.com','Investissement', date('now'), datetime('now'));

-- Attribution des conseillers aux clients
INSERT OR IGNORE INTO Client_Conseiller (client_id, conseiller_id, statut)
VALUES
('CL101','CO001','ACTIF'),
('CL102','CO001','ACTIF'),
('CL103','CO002','ACTIF'),
('CL104','CO002','ACTIF'),
('CL105','CO001','ACTIF');

--- ==========================================
--- SELECTIONS
--- ==========================================

--- Sélection des clients ayant un solde total > 10000€
SELECT
  c.client_id, c.nom, c.prenom,
  ROUND(SUM(cp.solde), 2) AS solde_total
FROM Client c
JOIN Compte cp ON cp.client_id = c.client_id
GROUP BY c.client_id
HAVING solde_total > 10000
ORDER BY solde_total DESC;

--- Affichage de toutes les transactions effectuées le mois dernier (30J)
SELECT
  t.transaction_id, t.type_transaction, t.montant, t.date_transaction, t.statut,
  t.compte_id
FROM Transactions t
WHERE datetime(t.date_transaction) >= datetime('now','-1 month')
ORDER BY datetime(t.date_transaction) DESC;

--- Liste de tous les comptes avec découvert autorisé
SELECT numero_compte, client_id, type_compte, solde
FROM Compte
WHERE solde < 0;

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

--- ==========================================
--- MISE À JOUR DE DONNÉES
--- ==========================================

-- Mettre à jour le numéro de téléphone d'un client spécifique
-- Cible : Client 'CL101'
UPDATE Client
SET telephone = '0699887766',
    date_maj = datetime('now')
WHERE client_id = 'CL101';

-- Augmenter le découvert autorisé pour certains comptes
-- Cible : +500€ pour tous les comptes de type 'COURANT'
UPDATE Compte
SET decouvert_autorise = decouvert_autorise + 500,
    date_maj = datetime('now')
WHERE type_compte = 'COURANT';

-- Modifier le statut des transactions en attente
-- Action : Valider toutes les transactions actuellement 'EN_ATTENTE'
UPDATE Transactions
SET statut = 'VALIDEE',
    date_maj = datetime('now')
WHERE statut = 'EN_ATTENTE';

--- ==========================================
--- SUPPRESSION DE DONNÉES
--- ==========================================

-- Supprimer les comptes inactifs depuis plus de 2 ans
-- Logique : On identifie les comptes n'ayant aucune transaction datée de moins de 2 ans.
DELETE FROM Compte
WHERE numero_compte NOT IN (
    SELECT DISTINCT compte_id
    FROM Transactions
    WHERE date_transaction >= datetime('now', '-2 years')
);

-- Effacer les transactions refusées ou annulées
-- Logique : Supprime toutes les transactions dont le statut est 'ANNULEE'.
DELETE FROM Transactions
WHERE statut = 'ANNULEE';

-- Retirer les clients sans transactions actives
-- Logique : Supprime les clients qui ne sont associés à aucune transaction (via leurs comptes).
DELETE FROM Client
WHERE client_id NOT IN (
    SELECT DISTINCT c.client_id
    FROM Client c
    JOIN Compte cp ON c.client_id = cp.client_id
    JOIN Transactions t ON cp.numero_compte = t.compte_id
);
