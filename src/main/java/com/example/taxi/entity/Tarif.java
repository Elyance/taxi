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
}