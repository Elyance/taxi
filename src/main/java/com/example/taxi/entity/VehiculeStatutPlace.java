package com.example.taxi.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "vehicule_statut_place")
public class VehiculeStatutPlace {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_vehicule_statut_place")
    private Long idVehiculeStatutPlace;

    @ManyToOne
    @JoinColumn(name = "id_vehicule", nullable = false)
    private Vehicule vehicule;

    @ManyToOne
    @JoinColumn(name = "id_place", nullable = false)
    private Place place;

    @ManyToOne
    @JoinColumn(name = "id_statut_place", nullable = false)
    private StatutPlace statutPlace;

    public Long getIdVehiculeStatutPlace() { return idVehiculeStatutPlace; }
    public void setIdVehiculeStatutPlace(Long idVehiculeStatutPlace) { this.idVehiculeStatutPlace = idVehiculeStatutPlace; }

    public Vehicule getVehicule() { return vehicule; }
    public void setVehicule(Vehicule vehicule) { this.vehicule = vehicule; }

    public Place getPlace() { return place; }
    public void setPlace(Place place) { this.place = place; }

    public StatutPlace getStatutPlace() { return statutPlace; }
    public void setStatutPlace(StatutPlace statutPlace) { this.statutPlace = statutPlace; }
}
