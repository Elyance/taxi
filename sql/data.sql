-- ===== DONNÉES DE TEST - ADMIN =====
INSERT INTO admin (nom, email, mdp) VALUES
('admin', 'admin@example.com', 'test'),
('bob', 'bob@example.com', 'bob123'),
('carol', 'carol@example.com', 'carol123');

-- ===== DONNÉES DE TEST - MODÈLES DE VÉHICULES =====
INSERT INTO modele_vehicule (libelle) VALUES 
('Toyota Hiace'),
('Mercedes Sprinter'),
('Ford Transit'),
('Iveco Daily'),
('Renault Master'),
('Volkswagen Transporter'),
('Fiat Ducato'),
('Peugeot Boxer');

-- ===== DONNÉES DE TEST - VÉHICULES =====
INSERT INTO vehicule (immatriculation, nombre_place, id_modele_vehicule) VALUES
('TN-001-AAA', 18, 1),
('TN-002-BBB', 20, 2),
('TN-003-CCC', 16, 3),
('TN-004-DDD', 14, 4),
('TN-005-EEE', 14, 5),
('TN-006-FFF', 16, 6),
('TN-007-GGG', 22, 7),
('TN-008-HHH', 24, 8),
('TN-009-III', 18, 1),
('TN-010-JJJ', 14, 2);

-- ===== DONNÉES DE TEST - CHAUFFEURS =====
INSERT INTO chauffeur (nom, prenom, telephone) VALUES
('Rakoto', 'Jean', '261321234567'),
('Ramirez', 'Pierre', '261322345678'),
('Rabe', 'Marie', '261323456789'),
('Randria', 'Paul', '261324567890'),
('Rasolofo', 'Sophie', '261325678901'),
('Ratsimba', 'Luc', '261326789012'),
('Rafidy', 'Anne', '261327890123'),
('Ranaivo', 'Michel', '261328901234'),
('Rakotobe', 'Nathalie', '261329012345'),
('Razafindra', 'Marc', '261330123456');

-- ===== DONNÉES DE TEST - GARES =====
INSERT INTO gare (nom) VALUES 
('Gare Centrale Antananarivo'),
('Gare Toamasina'),
('Gare Fianarantsoa'),
('Gare Mahajanga'),
('Gare Antsirabe'),
('Gare Toliara'),
('Gare Morondava'),
('Gare Sambava'),
('Gare Diego Suarez'),
('Gare Antalaha');

-- ===== DONNÉES DE TEST - TRAJETS =====
INSERT INTO trajet (id_gare_depart, id_gare_arrivee) VALUES
(1, 2),  -- Antananarivo -> Toamasina
(1, 3),  -- Antananarivo -> Fianarantsoa
(1, 4),  -- Antananarivo -> Mahajanga
(1, 5),  -- Antananarivo -> Antsirabe
(2, 3),  -- Toamasina -> Fianarantsoa
(2, 5),  -- Toamasina -> Antsirabe
(3, 4),  -- Fianarantsoa -> Mahajanga
(4, 6),  -- Mahajanga -> Toliara
(5, 7),  -- Antsirabe -> Morondava
(8, 9);  -- Sambava -> Diego Suarez

-- ===== DONNÉES DE TEST - TARIFS =====
INSERT INTO tarif (id_trajet, prix_base) VALUES
(1, 65000.00),   -- Antananarivo -> Toamasina
(2, 80000.00),   -- Antananarivo -> Fianarantsoa
(3, 95000.00),   -- Antananarivo -> Mahajanga
(4, 45000.00),   -- Antananarivo -> Antsirabe
(5, 75000.00),   -- Toamasina -> Fianarantsoa
(6, 55000.00),   -- Toamasina -> Antsirabe
(7, 70000.00),   -- Fianarantsoa -> Mahajanga
(8, 120000.00),  -- Mahajanga -> Toliara
(9, 85000.00),   -- Antsirabe -> Morondava
(10, 110000.00); -- Sambava -> Diego Suarez

-- ===== DONNÉES DE TEST - CLIENTS =====
INSERT INTO client (nom, telephone) VALUES
('Andrianampoinimerina Alain', '261331234567'),
('Betsileo Brigitte', '261332345678'),
('Betsimisaraka Christophe', '261333456789'),
('Bezanozano Denise', '261334567890'),
('Merina Émile', '261335678901'),
('Sihanaka Francine', '261336789012'),
('Vezo Gaston', '261337890123'),
('Tanala Henriette', '261338901234'),
('Antandroy Ivan', '261339012345'),
('Betsleo Josée', '261340123456');

-- ===== DONNÉES DE TEST - STATUTS DE BILLETS =====
INSERT INTO statut_billet (libelle) VALUES
('CRÉÉ'),
('CONFIRMÉ'),
('RÉSERVÉ'),
('ANNULÉ'),
('UTILISÉ');

-- ===== DONNÉES DE TEST - PLACES =====
-- Les places sont génériques et utilisées par tous les véhicules selon leur capacité
-- Le maximum de places est 24 (véhicule TN-008-HHH)
INSERT INTO place (id_place, numero) VALUES
(1, 'P001'), (2, 'P002'), (3, 'P003'), (4, 'P004'), (5, 'P005'), (6, 'P006'), (7, 'P007'), (8, 'P008'), 
(9, 'P009'), (10, 'P010'), (11, 'P011'), (12, 'P012'), (13, 'P013'), (14, 'P014'), (15, 'P015'), (16, 'P016'),
(17, 'P017'), (18, 'P018'), (19, 'P019'), (20, 'P020'), (21, 'P021'), (22, 'P022'), (23, 'P023'), (24, 'P024');

-- ===== DONNÉES DE TEST - STATUTS DE COMMANDES =====
INSERT INTO statut_commande (libelle) VALUES
('EN ATTENTE'),
('CONFIRMÉE'),
('LIVRÉE'),
('ANNULÉE');

-- ===== DONNÉES DE TEST - MODES DE PAIEMENT =====
INSERT INTO mode_paiement (libelle) VALUES
('ESPÈCES'),
('CARTE BANCAIRE'),
('VIREMENT'),
('CHÈQUE'),
('MOBILE MONEY');