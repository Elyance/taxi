package com.example.taxi.entity;

import jakarta.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "billet")
public class Billet {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_billet")
    private Long idBillet;

    @ManyToOne
    @JoinColumn(name = "id_client", nullable = false)
    private Client client;

    @ManyToOne
    @JoinColumn(name = "id_voyage", nullable = false)
    private Voyage voyage;

    @ManyToOne
    @JoinColumn(name = "id_place", nullable = false)
    private Place place;

    @ManyToOne
    @JoinColumn(name = "id_statut_billet")
    private StatutBillet statutBillet;

    @Column(name = "date_achat", nullable = false)
    private LocalDateTime dateAchat;

    @Column(nullable = false, precision = 10, scale = 2)
    private BigDecimal montant;

    public Long getIdBillet() { return idBillet; }
    public void setIdBillet(Long idBillet) { this.idBillet = idBillet; }

    public Client getClient() { return client; }
    public void setClient(Client client) { this.client = client; }

    public Voyage getVoyage() { return voyage; }
    public void setVoyage(Voyage voyage) { this.voyage = voyage; }

    public Place getPlace() { return place; }
    public void setPlace(Place place) { this.place = place; }

    public StatutBillet getStatutBillet() { return statutBillet; }
    public void setStatutBillet(StatutBillet statutBillet) { this.statutBillet = statutBillet; }

    public LocalDateTime getDateAchat() { return dateAchat; }
    public void setDateAchat(LocalDateTime dateAchat) { this.dateAchat = dateAchat; }

    public BigDecimal getMontant() { return montant; }
    public void setMontant(BigDecimal montant) { this.montant = montant; }
}
