-- Créer une view pour afficher les trajets avec leurs tarifs
CREATE OR REPLACE VIEW v_trajet_with_tarif AS
SELECT 
    t.id_trajet,
    gd.nom AS gare_depart,
    ga.nom AS gare_arrivee,
    COALESCE(tar.prix_base, 0) AS tarif_prix,
    COALESCE(tar.id_tarif, 0) AS id_tarif
FROM trajet t
LEFT JOIN gare gd ON t.id_gare_depart = gd.id_gare
LEFT JOIN gare ga ON t.id_gare_arrivee = ga.id_gare
LEFT JOIN tarif tar ON t.id_trajet = tar.id_trajet;

-- Données de test pour trajets
INSERT INTO trajet (id_gare_depart, id_gare_arrivee) VALUES
(1, 2),
(1, 3),
(2, 3),
(3, 4),
(4, 5)
ON CONFLICT DO NOTHING;

-- Données de test pour tarifs
INSERT INTO tarif (id_trajet, prix_base) VALUES
(1, 5000.00),
(2, 8000.00),
(3, 6500.00),
(4, 7000.00),
(5, 9000.00)
ON CONFLICT DO NOTHING;
