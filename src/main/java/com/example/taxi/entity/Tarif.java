package com.example.taxi.entity;

import jakarta.persistence.*;

import java.math.BigDecimal;


@Entity
@Table(name = "tarif")
public class Tarif {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_tarif")
    private Long idTarif;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_trajet", nullable = false)
    private Trajet trajet;

    @Column(name = "prix_base", precision = 10, scale = 2, nullable = false)
    private BigDecimal prixBase;

    public Long getIdTarif() {
        return idTarif;
    }

    public void setIdTarif(Long idTarif) {
        this.idTarif = idTarif;
    }

    public Trajet getTrajet() {
        return trajet;
    }

    public void setTrajet(Trajet trajet) {
        this.trajet = trajet;
    }

    public BigDecimal getPrixBase() {
        return prixBase;
    }

    public void setPrixBase(BigDecimal prixBase) {
        if (prixBase.compareTo(BigDecimal.ZERO) < 0) {
            throw new IllegalArgumentException("Le prix de base ne peut pas être négatif.");
        }
        this.prixBase = prixBase;
    }

    // Getters and Setters
    
}