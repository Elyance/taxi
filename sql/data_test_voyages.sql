-- Données de test pour la gestion d'achat de billet

-- Insertion des gares
INSERT INTO gare (nom) VALUES 
('Antananarivo - Soarano'),
('Toamasina'),
('Antsirabe'),
('Fianarantsoa'),
('Mahajanga');

-- Insertion des trajets
INSERT INTO trajet (id_gare_depart, id_gare_arrivee) VALUES 
(1, 2), -- Antananarivo → Toamasina
(1, 3), -- Antananarivo → Antsirabe
(1, 4), -- Antananarivo → Fianarantsoa
(3, 4), -- Antsirabe → Fianarantsoa
(1, 5); -- Antananarivo → Mahajanga

-- Insertion des tarifs pour chaque trajet
INSERT INTO tarif (id_trajet, prix_base) VALUES 
(1, 45000.00), -- Antananarivo → Toamasina : 45 000 Ar
(2, 25000.00), -- Antananarivo → Antsirabe : 25 000 Ar
(3, 60000.00), -- Antananarivo → Fianarantsoa : 60 000 Ar
(4, 35000.00), -- Antsirabe → Fianarantsoa : 35 000 Ar
(5, 55000.00); -- Antananarivo → Mahajanga : 55 000 Ar

-- Insertion des chauffeurs
INSERT INTO chauffeur (nom, prenom, telephone) VALUES 
('Rakoto', 'Jean', '034 12 345 67'),
('Rasoa', 'Marie', '033 98 765 43'),
('Andry', 'Paul', '032 45 678 90'),
('Nirina', 'Sophie', '034 56 789 01'),
('Hery', 'Luc', '033 23 456 78');

-- Insertion des modèles de véhicule
INSERT INTO modele_vehicule (libelle, nombre_place) VALUES 
('Toyota Hiace', 15),
('Mercedes Sprinter', 20),
('Hyundai H350', 12),
('Ford Transit', 18),
('Peugeot Boxer', 14);

-- Insertion des véhicules
INSERT INTO vehicule (immatriculation, id_modele_vehicule) VALUES 
('1234 TAA', 1),
('5678 TAA', 2),
('9012 TAA', 3),
('3456 TAA', 4),
('7890 TAA', 5);

-- Insertion des voyages pour aujourd'hui (9 janvier 2026)
INSERT INTO voyage (id_chauffeur, id_vehicule, id_trajet, date_voyage) VALUES 
(1, 1, 1, '2026-01-09 06:00:00'), -- Antananarivo → Toamasina, 6h00
(2, 2, 2, '2026-01-09 07:30:00'), -- Antananarivo → Antsirabe, 7h30
(3, 3, 1, '2026-01-09 08:00:00'), -- Antananarivo → Toamasina, 8h00
(4, 4, 3, '2026-01-09 09:00:00'), -- Antananarivo → Fianarantsoa, 9h00
(5, 5, 5, '2026-01-09 10:00:00'), -- Antananarivo → Mahajanga, 10h00
(1, 2, 2, '2026-01-09 14:00:00'), -- Antananarivo → Antsirabe, 14h00
(2, 1, 1, '2026-01-09 15:00:00'); -- Antananarivo → Toamasina, 15h00

-- Insertion des voyages pour demain (10 janvier 2026)
INSERT INTO voyage (id_chauffeur, id_vehicule, id_trajet, date_voyage) VALUES 
(3, 3, 2, '2026-01-10 06:30:00'), -- Antananarivo → Antsirabe, 6h30
(4, 4, 1, '2026-01-10 07:00:00'), -- Antananarivo → Toamasina, 7h00
(5, 5, 3, '2026-01-10 08:30:00'), -- Antananarivo → Fianarantsoa, 8h30
(1, 1, 5, '2026-01-10 09:00:00'), -- Antananarivo → Mahajanga, 9h00
(2, 2, 4, '2026-01-10 11:00:00'); -- Antsirabe → Fianarantsoa, 11h00

-- Insertion des voyages pour dans 2 jours (11 janvier 2026)
INSERT INTO voyage (id_chauffeur, id_vehicule, id_trajet, date_voyage) VALUES 
(1, 3, 1, '2026-01-11 06:00:00'), -- Antananarivo → Toamasina, 6h00
(2, 4, 2, '2026-01-11 07:00:00'), -- Antananarivo → Antsirabe, 7h00
(3, 5, 3, '2026-01-11 08:00:00'), -- Antananarivo → Fianarantsoa, 8h00
(4, 1, 5, '2026-01-11 10:00:00'), -- Antananarivo → Mahajanga, 10h00
(5, 2, 1, '2026-01-11 16:00:00'); -- Antananarivo → Toamasina, 16h00

-- Insertion des places pour chaque modèle de véhicule
-- Toyota Hiace (15 places)
INSERT INTO place (id_place, numero, id_modele_vehicule) VALUES 
(1, 'P001', 1), (2, 'P002', 1), (3, 'P003', 1), (4, 'P004', 1), (5, 'P005', 1),
(6, 'P006', 1), (7, 'P007', 1), (8, 'P008', 1), (9, 'P009', 1), (10, 'P010', 1),
(11, 'P011', 1), (12, 'P012', 1), (13, 'P013', 1), (14, 'P014', 1), (15, 'P015', 1);

-- Mercedes Sprinter (20 places)
INSERT INTO place (id_place, numero, id_modele_vehicule) VALUES 
(16, 'P001', 2), (17, 'P002', 2), (18, 'P003', 2), (19, 'P004', 2), (20, 'P005', 2),
(21, 'P006', 2), (22, 'P007', 2), (23, 'P008', 2), (24, 'P009', 2), (25, 'P010', 2),
(26, 'P011', 2), (27, 'P012', 2), (28, 'P013', 2), (29, 'P014', 2), (30, 'P015', 2),
(31, 'P016', 2), (32, 'P017', 2), (33, 'P018', 2), (34, 'P019', 2), (35, 'P020', 2);

-- Hyundai H350 (12 places)
INSERT INTO place (id_place, numero, id_modele_vehicule) VALUES 
(36, 'P001', 3), (37, 'P002', 3), (38, 'P003', 3), (39, 'P004', 3), (40, 'P005', 3),
(41, 'P006', 3), (42, 'P007', 3), (43, 'P008', 3), (44, 'P009', 3), (45, 'P010', 3),
(46, 'P011', 3), (47, 'P012', 3);

-- Ford Transit (18 places)
INSERT INTO place (id_place, numero, id_modele_vehicule) VALUES 
(48, 'P001', 4), (49, 'P002', 4), (50, 'P003', 4), (51, 'P004', 4), (52, 'P005', 4),
(53, 'P006', 4), (54, 'P007', 4), (55, 'P008', 4), (56, 'P009', 4), (57, 'P010', 4),
(58, 'P011', 4), (59, 'P012', 4), (60, 'P013', 4), (61, 'P014', 4), (62, 'P015', 4),
(63, 'P016', 4), (64, 'P017', 4), (65, 'P018', 4);

-- Peugeot Boxer (14 places)
INSERT INTO place (id_place, numero, id_modele_vehicule) VALUES 
(66, 'P001', 5), (67, 'P002', 5), (68, 'P003', 5), (69, 'P004', 5), (70, 'P005', 5),
(71, 'P006', 5), (72, 'P007', 5), (73, 'P008', 5), (74, 'P009', 5), (75, 'P010', 5),
(76, 'P011', 5), (77, 'P012', 5), (78, 'P013', 5), (79, 'P014', 5);

-- Insertion des statuts de place
INSERT INTO statut_place (libelle) VALUES 
('Disponible'),
('Réservé'),
('Occupé');

-- Insertion des statuts pour les places du véhicule 1 (Toyota Hiace - 1234 TAA)
INSERT INTO vehicule_statut_place (id_vehicule, id_place, id_statut_place) VALUES 
(1, 1, 1), (1, 2, 1), (1, 3, 3), (1, 4, 1), (1, 5, 2),
(1, 6, 1), (1, 7, 1), (1, 8, 3), (1, 9, 1), (1, 10, 1),
(1, 11, 2), (1, 12, 1), (1, 13, 1), (1, 14, 1), (1, 15, 1);

-- Insertion des statuts pour les places du véhicule 2 (Mercedes Sprinter - 5678 TAA)
INSERT INTO vehicule_statut_place (id_vehicule, id_place, id_statut_place) VALUES 
(2, 16, 1), (2, 17, 3), (2, 18, 1), (2, 19, 1), (2, 20, 2),
(2, 21, 1), (2, 22, 1), (2, 23, 1), (2, 24, 3), (2, 25, 1),
(2, 26, 1), (2, 27, 2), (2, 28, 1), (2, 29, 1), (2, 30, 1),
(2, 31, 1), (2, 32, 1), (2, 33, 3), (2, 34, 1), (2, 35, 1);

-- Insertion des statuts pour les places du véhicule 3 (Hyundai H350 - 9012 TAA)
INSERT INTO vehicule_statut_place (id_vehicule, id_place, id_statut_place) VALUES 
(3, 36, 1), (3, 37, 1), (3, 38, 3), (3, 39, 1), (3, 40, 1),
(3, 41, 2), (3, 42, 1), (3, 43, 1), (3, 44, 1), (3, 45, 1),
(3, 46, 1), (3, 47, 3);

-- Insertion des statuts pour les places du véhicule 4 (Ford Transit - 3456 TAA)
INSERT INTO vehicule_statut_place (id_vehicule, id_place, id_statut_place) VALUES 
(4, 48, 1), (4, 49, 1), (4, 50, 1), (4, 51, 2), (4, 52, 1),
(4, 53, 1), (4, 54, 3), (4, 55, 1), (4, 56, 1), (4, 57, 1),
(4, 58, 2), (4, 59, 1), (4, 60, 1), (4, 61, 1), (4, 62, 3),
(4, 63, 1), (4, 64, 1), (4, 65, 1);

-- Insertion des statuts pour les places du véhicule 5 (Peugeot Boxer - 7890 TAA)
INSERT INTO vehicule_statut_place (id_vehicule, id_place, id_statut_place) VALUES 
(5, 66, 1), (5, 67, 1), (5, 68, 1), (5, 69, 3), (5, 70, 1),
(5, 71, 2), (5, 72, 1), (5, 73, 1), (5, 74, 1), (5, 75, 1),
(5, 76, 1), (5, 77, 3), (5, 78, 1), (5, 79, 1);

-- Insertion des statuts de billet
INSERT INTO statut_billet (libelle) VALUES 
('Confirmé'),
('Annulé'),
('En attente');

-- Insertion de clients de test
INSERT INTO client (nom, telephone) VALUES 
('Rakotomalala Jean', '034 11 222 33'),
('Rasoanaivo Marie', '033 44 555 66'),
('Andrianasolo Paul', '032 77 888 99'),
('Raharison Sophie', '034 00 111 22'),
('Randrianasolo Luc', '033 33 444 55'),
('Razafindrakoto Anna', '032 66 777 88'),
('Randriamampianina Pierre', '034 99 000 11'),
('Rakotondrabe Julie', '033 22 333 44'),
('Andriamahefa Michel', '032 55 666 77'),
('Rabemananjara Sarah', '034 88 999 00');

-- Insertion de billets de test avec différentes dates et heures d'achat
-- Billets achetés le 9 janvier 2026 à 14h30 (véhicule 1234 TAA - Toyota Hiace)
INSERT INTO billet (id_client, id_voyage, id_place, id_statut_billet, date_achat, montant) VALUES 
(1, 1, 3, 1, '2026-01-09 14:35:00', 45000.00),  -- Voyage 1: Antananarivo → Toamasina, 6h00
(2, 1, 8, 1, '2026-01-09 14:42:00', 45000.00);

-- Billets achetés le 9 janvier 2026 à 15h15 (véhicule 5678 TAA - Mercedes Sprinter)
INSERT INTO billet (id_client, id_voyage, id_place, id_statut_billet, date_achat, montant) VALUES 
(3, 2, 17, 1, '2026-01-09 15:18:00', 25000.00),  -- Voyage 2: Antananarivo → Antsirabe, 7h30
(4, 2, 24, 1, '2026-01-09 15:25:00', 25000.00),
(5, 2, 33, 1, '2026-01-09 15:48:00', 25000.00);

-- Billets achetés le 9 janvier 2026 à 10h00 (véhicule 9012 TAA - Hyundai H350)
INSERT INTO billet (id_client, id_voyage, id_place, id_statut_billet, date_achat, montant) VALUES 
(6, 3, 38, 1, '2026-01-09 10:12:00', 45000.00),  -- Voyage 3: Antananarivo → Toamasina, 8h00
(7, 3, 47, 1, '2026-01-09 10:28:00', 45000.00);

-- Billets achetés le 9 janvier 2026 à 08h30 (véhicule 3456 TAA - Ford Transit)
INSERT INTO billet (id_client, id_voyage, id_place, id_statut_billet, date_achat, montant) VALUES 
(8, 4, 54, 1, '2026-01-09 08:35:00', 60000.00),  -- Voyage 4: Antananarivo → Fianarantsoa, 9h00
(9, 4, 62, 1, '2026-01-09 08:45:00', 60000.00);

-- Billets achetés le 9 janvier 2026 à 16h00 (véhicule 7890 TAA - Peugeot Boxer)
INSERT INTO billet (id_client, id_voyage, id_place, id_statut_billet, date_achat, montant) VALUES 
(10, 5, 69, 1, '2026-01-09 16:05:00', 55000.00), -- Voyage 5: Antananarivo → Mahajanga, 10h00
(1, 5, 77, 1, '2026-01-09 16:22:00', 55000.00);

-- Billets achetés le 10 janvier 2026 à 09h00
INSERT INTO billet (id_client, id_voyage, id_place, id_statut_billet, date_achat, montant) VALUES 
(2, 8, 36, 1, '2026-01-10 09:15:00', 25000.00),  -- Voyage 8: Antananarivo → Antsirabe, 6h30
(3, 9, 48, 1, '2026-01-10 09:30:00', 45000.00);  -- Voyage 9: Antananarivo → Toamasina, 7h00

-- Billets avec statut annulé (pour tester)
INSERT INTO billet (id_client, id_voyage, id_place, id_statut_billet, date_achat, montant) VALUES 
(4, 6, 16, 2, '2026-01-09 14:10:00', 25000.00);  -- Annulé

-- Insertion des paiements correspondants
INSERT INTO paiement (id_billet, montant, date_paiement) VALUES 
(1, 45000.00, '2026-01-09 14:35:00'),
(2, 45000.00, '2026-01-09 14:42:00'),
(3, 25000.00, '2026-01-09 15:18:00'),
(4, 25000.00, '2026-01-09 15:25:00'),
(5, 25000.00, '2026-01-09 15:48:00'),
(6, 45000.00, '2026-01-09 10:12:00'),
(7, 45000.00, '2026-01-09 10:28:00'),
(8, 60000.00, '2026-01-09 08:35:00'),
(9, 60000.00, '2026-01-09 08:45:00'),
(10, 55000.00, '2026-01-09 16:05:00'),
(11, 55000.00, '2026-01-09 16:22:00'),
(12, 25000.00, '2026-01-10 09:15:00'),
(13, 45000.00, '2026-01-10 09:30:00'),
(14, 25000.00, '2026-01-09 14:10:00');
