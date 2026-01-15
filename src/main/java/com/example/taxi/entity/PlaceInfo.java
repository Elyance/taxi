package com.example.taxi.entity;

public class PlaceInfo {
    private Integer numeroPlace;
    private boolean reserved;

    public PlaceInfo() {}

    public PlaceInfo(Integer numeroPlace, boolean reserved) {
        this.numeroPlace = numeroPlace;
        this.reserved = reserved;
    }

    public Integer getNumeroPlace() {
        return numeroPlace;
    }

    public void setNumeroPlace(Integer numeroPlace) {
        this.numeroPlace = numeroPlace;
    }

    public boolean isReserved() {
        return reserved;
    }

    public void setReserved(boolean reserved) {
        this.reserved = reserved;
    }
}