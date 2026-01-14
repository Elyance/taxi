package com.example.taxi.entity;

import jakarta.persistence.*;



@Entity
@Table(name = "trajet")
public class Trajet {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_trajet")
    private Long idTrajet;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_gare_arrivee", nullable = false)
    private Gare gareArrivee;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_gare_depart", nullable = false)
    private Gare gareDepart;

    public Long getIdTrajet() {
        return idTrajet;
    }

    public void setIdTrajet(Long idTrajet) {
        this.idTrajet = idTrajet;
    }

    public Gare getGareArrivee() {
        return gareArrivee;
    }

    public void setGareArrivee(Gare gareArrivee) {
        this.gareArrivee = gareArrivee;
    }

    public Gare getGareDepart() {
        return gareDepart;
    }

    public void setGareDepart(Gare gareDepart) {
        this.gareDepart = gareDepart;
    }

    
}