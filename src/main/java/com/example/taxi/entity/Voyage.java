package com.example.taxi.entity;

import jakarta.persistence.*;

import java.time.LocalDateTime;


@Entity
@Table(name = "voyage")
public class Voyage {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_voyage")
    private Long idVoyage;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_chauffeur", nullable = false)
    private Chauffeur chauffeur;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_vehicule", nullable = false)
    private Vehicule vehicule;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_trajet", nullable = false)
    private Trajet trajet;

    @Column(name = "date_voyage", nullable = false)
    private LocalDateTime dateVoyage;

    public Long getIdVoyage() {
        return idVoyage;
    }

    public void setIdVoyage(Long idVoyage) {
        this.idVoyage = idVoyage;
    }

    public Chauffeur getChauffeur() {
        return chauffeur;
    }

    public void setChauffeur(Chauffeur chauffeur) {
        this.chauffeur = chauffeur;
    }

    public Vehicule getVehicule() {
        return vehicule;
    }

    public void setVehicule(Vehicule vehicule) {
        this.vehicule = vehicule;
    }

    public Trajet getTrajet() {
        return trajet;
    }

    public void setTrajet(Trajet trajet) {
        this.trajet = trajet;
    }

    public LocalDateTime getDateVoyage() {
        return dateVoyage;
    }

    public void setDateVoyage(LocalDateTime dateVoyage) {
        this.dateVoyage = dateVoyage;
    }

    
}