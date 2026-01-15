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


-- Créer une view pour afficher les voyages avec toutes les informations nécessaires
CREATE OR REPLACE VIEW v_voyage_details AS
SELECT 
    v.id_voyage,
    v.date_voyage,
    t.id_trajet,
    gd.nom AS gare_depart,
    ga.nom AS gare_arrivee,
    COALESCE(tar.prix_base, 0) AS tarif_prix,
    c.id_chauffeur,
    c.nom AS chauffeur_nom,
    c.prenom AS chauffeur_prenom,
    c.telephone AS chauffeur_telephone,
    ve.id_vehicule,
    ve.immatriculation,
    ve.nombre_place,
    mv.libelle AS modele_vehicule
FROM voyage v
LEFT JOIN trajet t ON v.id_trajet = t.id_trajet
LEFT JOIN gare gd ON t.id_gare_depart = gd.id_gare
LEFT JOIN gare ga ON t.id_gare_arrivee = ga.id_gare
LEFT JOIN tarif tar ON t.id_trajet = tar.id_trajet
LEFT JOIN chauffeur c ON v.id_chauffeur = c.id_chauffeur
LEFT JOIN vehicule ve ON v.id_vehicule = ve.id_vehicule
LEFT JOIN modele_vehicule mv ON ve.id_modele_vehicule = mv.id_modele_vehicule;

-- Vue pour obtenir la liste des places avec leur statut
CREATE VIEW v_billet_place_statut AS
SELECT
    b.id_billet,
    b.id_voyage,
    b.id_client,
    b.montant,
    p.id_place,
    CAST(SUBSTRING(p.numero, 2) AS INTEGER) as numero_place,
    sb.id_statut_billet,
    sb.libelle as statut_billet,
    v.date_voyage,
    t.id_trajet,
    g_dep.nom as gare_depart,
    g_arr.nom as gare_arrivee,
    c.nom as nom_client,
    c.telephone as telephone_client,
    vh.immatriculation,
    ch.nom as nom_chauffeur,
    ch.prenom as prenom_chauffeur
FROM billet b
JOIN place p ON b.id_place = p.id_place
JOIN statut_billet sb ON b.id_statut_billet = sb.id_statut_billet
JOIN voyage v ON b.id_voyage = v.id_voyage
JOIN trajet t ON v.id_trajet = t.id_trajet
JOIN gare g_dep ON t.id_gare_depart = g_dep.id_gare
JOIN gare g_arr ON t.id_gare_arrivee = g_arr.id_gare
JOIN client c ON b.id_client = c.id_client
JOIN vehicule vh ON v.id_vehicule = vh.id_vehicule
JOIN chauffeur ch ON v.id_chauffeur = ch.id_chauffeur;