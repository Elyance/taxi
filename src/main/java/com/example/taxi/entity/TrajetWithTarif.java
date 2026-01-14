package com.example.taxi.entity;

import jakarta.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "v_trajet_with_tarif")
public class TrajetWithTarif {
    @Id
    @Column(name = "id_trajet")
    private Long idTrajet;

    @Column(name = "gare_depart")
    private String gareDepart;

    @Column(name = "gare_arrivee")
    private String gareArrivee;

    @Column(name = "tarif_prix", precision = 10, scale = 2)
    private BigDecimal tarifPrix;

    @Column(name = "id_tarif")
    private Long idTarif;

    public TrajetWithTarif() {}

    public TrajetWithTarif(Long idTrajet, String gareDepart, String gareArrivee, BigDecimal tarifPrix, Long idTarif) {
        this.idTrajet = idTrajet;
        this.gareDepart = gareDepart;
        this.gareArrivee = gareArrivee;
        this.tarifPrix = tarifPrix;
        this.idTarif = idTarif;
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

    public Long getIdTarif() {
        return idTarif;
    }

    public void setIdTarif(Long idTarif) {
        this.idTarif = idTarif;
    }
}
