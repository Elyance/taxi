package com.example.taxi.entity;

import jakarta.persistence.*;

import java.time.LocalDateTime;


@Entity
@Table(name = "historique_statut_billet")
public class HistoriqueStatutBillet {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_historique")
    private Long idHistorique;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_billet", nullable = false)
    private Billet billet;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_statut_billet", nullable = false)
    private StatutBillet statutBillet;

    @Column(name = "date_changement", nullable = false)
    private LocalDateTime dateChangement;
}