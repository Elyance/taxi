<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<div class="list-header">
    <h2 class="list-title"><i class="fas fa-ticket-alt"></i> Détails du Billet</h2>
</div>

<div class="form-container">
    <div class="form-section">
        <h3 class="form-section-title">Informations du Client</h3>
        <div class="form-row">
            <div class="form-col">
                <div class="form-group">
                    <label class="form-label">Nom</label>
                    <p class="form-value">${billet.nomClient}</p>
                </div>
            </div>
            <div class="form-col">
                <div class="form-group">
                    <label class="form-label">Téléphone</label>
                    <p class="form-value">${billet.telephoneClient}</p>
                </div>
            </div>
        </div>
    </div>

    <div class="form-section">
        <h3 class="form-section-title">Informations du Trajet</h3>
        <div class="form-row">
            <div class="form-col">
                <div class="form-group">
                    <label class="form-label">Gare de Départ</label>
                    <p class="form-value">${billet.gareDepart}</p>
                </div>
            </div>
            <div class="form-col">
                <div class="form-group">
                    <label class="form-label">Gare d'Arrivée</label>
                    <p class="form-value">${billet.gareArrivee}</p>
                </div>
            </div>
        </div>
    </div>

    <div class="form-section">
        <h3 class="form-section-title">Détails du Voyage</h3>
        <div class="form-row">
            <div class="form-col">
                <div class="form-group">
                    <label class="form-label">Date du Voyage</label>
                    <p class="form-value">
                        ${billet.dateVoyage.format(DateTimeFormatter.ofPattern('dd/MM/yyyy'))}
                    </p>
                </div>
            </div>
            <div class="form-col">
                <div class="form-group">
                    <label class="form-label">Heure de Départ</label>
                    <p class="form-value">
                        ${billet.dateVoyage.format(DateTimeFormatter.ofPattern('HH:mm'))}
                    </p>
                </div>
            </div>
        </div>
    </div>

    <div class="form-section">
        <h3 class="form-section-title">Informations du Véhicule et Chauffeur</h3>
        <div class="form-row">
            <div class="form-col">
                <div class="form-group">
                    <label class="form-label">Immatriculation</label>
                    <p class="form-value">${billet.immatriculation}</p>
                </div>
            </div>
            <div class="form-col">
                <div class="form-group">
                    <label class="form-label">Chauffeur</label>
                    <p class="form-value">${billet.nomChauffeur} ${billet.prenomChauffeur}</p>
                </div>
            </div>
        </div>
    </div>

    <div class="form-section">
        <h3 class="form-section-title">Détails de la Place et du Billet</h3>
        <div class="form-row">
            <div class="form-col">
                <div class="form-group">
                    <label class="form-label">Numéro de Place</label>
                    <p class="form-value">
                        <span class="badge badge-info">Place ${billet.numeroPlace}</span>
                    </p>
                </div>
            </div>
            <div class="form-col">
                <div class="form-group">
                    <label class="form-label">Statut</label>
                    <p class="form-value">
                        <c:choose>
                            <c:when test="${billet.statutBillet == 'CONFIRMÉ'}">
                                <span class="badge badge-success">
                                    <i class="fas fa-check-circle"></i> ${billet.statutBillet}
                                </span>
                            </c:when>
                            <c:when test="${billet.statutBillet == 'EN_ATTENTE'}">
                                <span class="badge badge-warning">
                                    <i class="fas fa-hourglass-half"></i> ${billet.statutBillet}
                                </span>
                            </c:when>
                            <c:otherwise>
                                <span class="badge badge-secondary">
                                    <i class="fas fa-times-circle"></i> ${billet.statutBillet}
                                </span>
                            </c:otherwise>
                        </c:choose>
                    </p>
                </div>
            </div>
        </div>
    </div>

    <div class="form-section">
        <h3 class="form-section-title">Montant</h3>
        <div class="form-row">
            <div class="form-col">
                <div class="form-group">
                    <label class="form-label">Tarif du Trajet</label>
                    <p class="form-value">
                        <strong class="text-success">
                            <fmt:formatNumber value="${billet.tarifTrajet}" type="currency" currencySymbol="€"/>
                        </strong>
                    </p>
                </div>
            </div>
            <div class="form-col">
                <div class="form-group">
                    <label class="form-label">Montant Payé</label>
                    <p class="form-value">
                        <strong class="text-success">
                            <fmt:formatNumber value="${billet.montant}" type="currency" currencySymbol="€"/>
                        </strong>
                    </p>
                </div>
            </div>
        </div>
    </div>

    <div class="form-actions">
        <a href="<c:url value='/billet/list'/>" class="btn-secondary" style="text-decoration: none;">
            <i class="fas fa-arrow-left"></i> Retour à la liste
        </a>
    </div>
</div>

<style>
    .form-section {
        margin-bottom: 25px;
        padding-bottom: 20px;
        border-bottom: 1px solid #e5e7eb;
    }

    .form-section:last-of-type {
        border-bottom: none;
        margin-bottom: 0;
    }

    .form-section-title {
        font-size: 15px;
        font-weight: 600;
        color: #1f2937;
        margin-bottom: 15px;
        display: flex;
        align-items: center;
        gap: 8px;
    }

    .form-row {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
        gap: 20px;
    }

    .form-col {
        display: flex;
        flex-direction: column;
    }

    .form-group {
        margin-bottom: 0;
    }

    .form-label {
        font-size: 13px;
        font-weight: 600;
        color: #6b7280;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        margin-bottom: 6px;
    }

    .form-value {
        font-size: 15px;
        color: #1f2937;
        margin: 0;
        padding: 8px 0;
    }
</style>
