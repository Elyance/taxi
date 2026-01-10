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

    @ManyToOne
    @JoinColumn(name = "id_trajet", nullable = false)
    private Trajet trajet;

    @Column(name = "prix_base", nullable = false, precision = 10, scale = 2)
    private BigDecimal prixBase;

    public Long getIdTarif() { return idTarif; }
    public void setIdTarif(Long idTarif) { this.idTarif = idTarif; }

    public Trajet getTrajet() { return trajet; }
    public void setTrajet(Trajet trajet) { this.trajet = trajet; }

    public BigDecimal getPrixBase() { return prixBase; }
    public void setPrixBase(BigDecimal prixBase) { this.prixBase = prixBase; }
}
