package com.example.taxi.entity;

import jakarta.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "v_billet_place_statut")
public class BilletPlaceStatut {

    @Id
    @Column(name = "id_billet")
    private Long idBillet;

    @Column(name = "id_voyage")
    private Long idVoyage;

    @Column(name = "id_client")
    private Long idClient;

    @Column(name = "montant")
    private BigDecimal montant;

    @Column(name = "id_place")
    private Long idPlace;

    @Column(name = "numero_place")
    private Integer numeroPlace;

    @Column(name = "id_statut_billet")
    private Long idStatutBillet;

    @Column(name = "statut_billet")
    private String statutBillet;

    @Column(name = "date_voyage")
    private LocalDateTime dateVoyage;

    @Column(name = "id_trajet")
    private Long idTrajet;

    @Column(name = "gare_depart")
    private String gareDepart;

    @Column(name = "gare_arrivee")
    private String gareArrivee;

    @Column(name = "tarif_trajet")
    private BigDecimal tarifTrajet;

    @Column(name = "nom_client")
    private String nomClient;

    @Column(name = "telephone_client")
    private String telephoneClient;

    @Column(name = "immatriculation")
    private String immatriculation;

    @Column(name = "nom_chauffeur")
    private String nomChauffeur;

    @Column(name = "prenom_chauffeur")
    private String prenomChauffeur;

    // Getters and Setters
    public Long getIdBillet() {
        return idBillet;
    }

    public void setIdBillet(Long idBillet) {
        this.idBillet = idBillet;
    }

    public Long getIdVoyage() {
        return idVoyage;
    }

    public void setIdVoyage(Long idVoyage) {
        this.idVoyage = idVoyage;
    }

    public Long getIdClient() {
        return idClient;
    }

    public void setIdClient(Long idClient) {
        this.idClient = idClient;
    }

    public BigDecimal getMontant() {
        return montant;
    }

    public void setMontant(BigDecimal montant) {
        this.montant = montant;
    }

    public Long getIdPlace() {
        return idPlace;
    }

    public void setIdPlace(Long idPlace) {
        this.idPlace = idPlace;
    }

    public Integer getNumeroPlace() {
        return numeroPlace;
    }

    public void setNumeroPlace(Integer numeroPlace) {
        this.numeroPlace = numeroPlace;
    }

    public Long getIdStatutBillet() {
        return idStatutBillet;
    }

    public void setIdStatutBillet(Long idStatutBillet) {
        this.idStatutBillet = idStatutBillet;
    }

    public String getStatutBillet() {
        return statutBillet;
    }

    public void setStatutBillet(String statutBillet) {
        this.statutBillet = statutBillet;
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

    public String getNomClient() {
        return nomClient;
    }

    public void setNomClient(String nomClient) {
        this.nomClient = nomClient;
    }

    public String getTelephoneClient() {
        return telephoneClient;
    }

    public void setTelephoneClient(String telephoneClient) {
        this.telephoneClient = telephoneClient;
    }

    public String getImmatriculation() {
        return immatriculation;
    }

    public void setImmatriculation(String immatriculation) {
        this.immatriculation = immatriculation;
    }

    public String getNomChauffeur() {
        return nomChauffeur;
    }

    public void setNomChauffeur(String nomChauffeur) {
        this.nomChauffeur = nomChauffeur;
    }

    public String getPrenomChauffeur() {
        return prenomChauffeur;
    }

    public void setPrenomChauffeur(String prenomChauffeur) {
        this.prenomChauffeur = prenomChauffeur;
    }

    public BigDecimal getTarifTrajet() {
        return tarifTrajet;
    }

    public void setTarifTrajet(BigDecimal tarifTrajet) {
        this.tarifTrajet = tarifTrajet;
    }
}