CREATE TABLE admin(
   id_admin SERIAL,
   nom VARCHAR(50) ,
   email VARCHAR(50) ,
   mdp VARCHAR(50) ,
   PRIMARY KEY(id_admin)
);

CREATE TABLE gare(
   id_gare SERIAL,
   nom VARCHAR(100)  NOT NULL,
   PRIMARY KEY(id_gare)
);

CREATE TABLE trajet(
   id_trajet SERIAL,
   id_gare_arrivee INTEGER NOT NULL,
   id_gare_depart INTEGER NOT NULL,
   PRIMARY KEY(id_trajet),
   FOREIGN KEY(id_gare_arrivee) REFERENCES gare(id_gare),
   FOREIGN KEY(id_gare_depart) REFERENCES gare(id_gare)
);

CREATE TABLE tarif(
   id_tarif SERIAL,
   id_trajet INTEGER NOT NULL,
   prix_base NUMERIC(10,2)   NOT NULL,
   PRIMARY KEY(id_tarif),
   FOREIGN KEY(id_trajet) REFERENCES trajet(id_trajet)
);

CREATE TABLE chauffeur(
   id_chauffeur SERIAL,
   nom VARCHAR(100)  NOT NULL,
   prenom VARCHAR(100)  NOT NULL,
   telephone VARCHAR(50) ,
   PRIMARY KEY(id_chauffeur)
);

CREATE TABLE modele_vehicule(
   id_modele_vehicule SERIAL,
   libelle VARCHAR(100)  NOT NULL,
   nombre_place INTEGER NOT NULL,
   PRIMARY KEY(id_modele_vehicule)
);

CREATE TABLE vehicule(
   id_vehicule SERIAL,
   immatriculation VARCHAR(50)  NOT NULL,
   id_modele_vehicule INTEGER NOT NULL,
   PRIMARY KEY(id_vehicule),
   UNIQUE(immatriculation),
   FOREIGN KEY(id_modele_vehicule) REFERENCES modele_vehicule(id_modele_vehicule)
);

CREATE TABLE place(
   id_place INTEGER,
   numero VARCHAR(50) ,
   id_modele_vehicule INTEGER NOT NULL,
   PRIMARY KEY(id_place),
   FOREIGN KEY(id_modele_vehicule) REFERENCES modele_vehicule(id_modele_vehicule)
);

CREATE TABLE statut_place(
   id_statut_place SERIAL,
   libelle VARCHAR(50) ,
   PRIMARY KEY(id_statut_place)
);

CREATE TABLE vehicule_statut_place(
   id_vehicule_statut_place SERIAL,
   id_vehicule INTEGER NOT NULL,
   id_place INTEGER NOT NULL,
   id_statut_place INTEGER NOT NULL,
   PRIMARY KEY(id_vehicule_statut_place),
   FOREIGN KEY(id_vehicule) REFERENCES vehicule(id_vehicule),
   FOREIGN KEY(id_place) REFERENCES place(id_place),
   FOREIGN KEY(id_statut_place) REFERENCES statut_place(id_statut_place)
);

CREATE TABLE voyage(
   id_voyage SERIAL,
   id_chauffeur INTEGER NOT NULL,
   id_vehicule INTEGER NOT NULL,
   id_trajet INTEGER NOT NULL,
   date_voyage TIMESTAMP NOT NULL,
   PRIMARY KEY(id_voyage),
   FOREIGN KEY(id_chauffeur) REFERENCES chauffeur(id_chauffeur),
   FOREIGN KEY(id_vehicule) REFERENCES vehicule(id_vehicule),
   FOREIGN KEY(id_trajet) REFERENCES trajet(id_trajet)
);

CREATE TABLE client(
   id_client SERIAL,
   nom VARCHAR(50) ,
   telephone VARCHAR(50) ,
   PRIMARY KEY(id_client)
);

CREATE TABLE statut_billet(
   id_statut_billet SERIAL,
   libelle VARCHAR(50) ,
   PRIMARY KEY(id_statut_billet)
);

CREATE TABLE billet(
   id_billet SERIAL,
   id_client INTEGER NOT NULL,
   id_voyage INTEGER NOT NULL,
   id_place INTEGER NOT NULL,
   id_statut_billet INTEGER NOT NULL,
   date_achat TIMESTAMP NOT NULL,
   montant NUMERIC(10,2)   NOT NULL,
   PRIMARY KEY(id_billet),
   FOREIGN KEY(id_client) REFERENCES client(id_client),
   FOREIGN KEY(id_voyage) REFERENCES voyage(id_voyage),
   FOREIGN KEY(id_statut_billet) REFERENCES statut_billet(id_statut_billet)
);

CREATE TABLE historique_statut_billet(
   id_historique SERIAL,
   id_billet INTEGER NOT NULL,
   id_statut_billet INTEGER NOT NULL,
   date_changement TIMESTAMP NOT NULL,
   PRIMARY KEY(id_historique),
   FOREIGN KEY(id_billet) REFERENCES billet(id_billet),
   FOREIGN KEY(id_statut_billet) REFERENCES statut_billet(id_statut_billet)
);

CREATE TABLE paiement(
   id_paiement SERIAL,
   id_billet INTEGER NOT NULL,
   montant NUMERIC(10,2)   NOT NULL,
   date_paiement TIMESTAMP NOT NULL,
   PRIMARY KEY(id_paiement),
   FOREIGN KEY(id_billet) REFERENCES billet(id_billet)
);