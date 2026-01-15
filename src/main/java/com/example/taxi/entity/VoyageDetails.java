package com.example.taxi.entity;

import jakarta.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "v_voyage_details")
public class VoyageDetails {
    @Id
    @Column(name = "id_voyage")
    private Long idVoyage;

    @Column(name = "date_voyage")
    private LocalDateTime dateVoyage;

    @Column(name = "id_trajet")
    private Long idTrajet;

    @Column(name = "gare_depart")
    private String gareDepart;

    @Column(name = "gare_arrivee")
    private String gareArrivee;

    @Column(name = "tarif_prix", precision = 10, scale = 2)
    private BigDecimal tarifPrix;

    @Column(name = "id_chauffeur")
    private Long idChauffeur;

    @Column(name = "chauffeur_nom")
    private String chauffeurNom;

    @Column(name = "chauffeur_prenom")
    private String chauffeurPrenom;

    @Column(name = "chauffeur_telephone")
    private String chauffeurTelephone;

    @Column(name = "id_vehicule")
    private Long idVehicule;

    @Column(name = "immatriculation")
    private String immatriculation;

    @Column(name = "nombre_place")
    private Integer nombrePlace;

    @Column(name = "modele_vehicule")
    private String modeleVehicule;

    public VoyageDetails() {}

    // Getters et Setters
    public Long getIdVoyage() {
        return idVoyage;
    }

    public void setIdVoyage(Long idVoyage) {
        this.idVoyage = idVoyage;
    }

    public LocalDateTime getDateVoyage() {
        return dateVoyage;
    }

    public void setDateVoyage(LocalDateTime dateVoyage) {
        this.dateVoyage = dateVoyage;
    }

    public Long getIdTrajet() {
        return idTrajet;
    }

    public void setIdTrajet(Long idTrajet) {
        this.idTrajet = idTrajet;
    }

    public String getGareDepart() {
        return gareDepart;
    }

    public void setGareDepart(String gareDepart) {
        this.gareDepart = gareDepart;
    }

    public String getGareArrivee() {
        return gareArrivee;
    }

    public void setGareArrivee(String gareArrivee) {
        this.gareArrivee = gareArrivee;
    }

    public BigDecimal getTarifPrix() {
        return tarifPrix;
    }

    public void setTarifPrix(BigDecimal tarifPrix) {
        this.tarifPrix = tarifPrix;
    }

    public Long getIdChauffeur() {
        return idChauffeur;
    }

    public void setIdChauffeur(Long idChauffeur) {
        this.idChauffeur = idChauffeur;
    }

    public String getChauffeurNom() {
        return chauffeurNom;
    }

    public void setChauffeurNom(String chauffeurNom) {
        this.chauffeurNom = chauffeurNom;
    }

    public String getChauffeurPrenom() {
        return chauffeurPrenom;
    }

    public void setChauffeurPrenom(String chauffeurPrenom) {
        this.chauffeurPrenom = chauffeurPrenom;
    }

    public String getChauffeurTelephone() {
        return chauffeurTelephone;
    }

    public void setChauffeurTelephone(String chauffeurTelephone) {
        this.chauffeurTelephone = chauffeurTelephone;
    }

    public Long getIdVehicule() {
        return idVehicule;
    }

    public void setIdVehicule(Long idVehicule) {
        this.idVehicule = idVehicule;
    }

    public String getImmatriculation() {
        return immatriculation;
    }

    public void setImmatriculation(String immatriculation) {
        this.immatriculation = immatriculation;
    }

    public Integer getNombrePlace() {
        return nombrePlace;
    }

    public void setNombrePlace(Integer nombrePlace) {
        if (nombrePlace < 0) {
            throw new IllegalArgumentException("Le nombre de places ne peut pas être négatif.");
        }
        this.nombrePlace = nombrePlace;
    }

    public String getModeleVehicule() {
        return modeleVehicule;
    }

    public void setModeleVehicule(String modeleVehicule) {
        this.modeleVehicule = modeleVehicule;
    }
}
