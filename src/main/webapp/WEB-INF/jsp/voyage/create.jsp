<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div style="margin-bottom: 20px;">
    <nav class="breadcrumb">
        <a href="<c:url value='/dashboard'/>" class="breadcrumb-item">Tableau de Bord</a>
        <span class="breadcrumb-separator"><i class="fas fa-chevron-right"></i></span>
        <a href="<c:url value='/voyage/list'/>" class="breadcrumb-item">Voyages</a>
        <span class="breadcrumb-separator"><i class="fas fa-chevron-right"></i></span>
        <span class="breadcrumb-item active">Créer un Voyage</span>
    </nav>
</div>

<h2 style="font-size: 24px; font-weight: 700; color: #1f2937; margin-bottom: 30px;">
    <i class="fas fa-plus"></i> Créer un Voyage
</h2>

<c:if test="${not empty error}">
    <div class="alert alert-danger" style="margin-bottom: 20px;">
        <i class="fas fa-exclamation-circle"></i> ${error}
    </div>
</c:if>

<form action="<c:url value='/voyage/create'/>" method="POST" class="form-container">
    <fieldset style="border: none; padding: 0; margin-bottom: 30px;">
        <legend style="font-size: 16px; font-weight: 700; color: #1f2937; margin-bottom: 20px; padding-bottom: 10px; border-bottom: 2px solid #e5e7eb;">
            <i class="fas fa-bus"></i> Informations du Voyage
        </legend>

        <div class="form-row">
            <div class="form-group">
                <label class="form-label required">Trajet <span style="color: #ef4444;">*</span></label>
                <select name="idTrajet" class="form-input" required>
                    <option value="">-- Sélectionner un trajet --</option>
                    <c:forEach items="${trajets}" var="trajet">
                        <option value="${trajet.idTrajet}">
                            ${trajet.gareDepart.nom} → ${trajet.gareArrivee.nom}
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label class="form-label required">Chauffeur <span style="color: #ef4444;">*</span></label>
                <select name="idChauffeur" class="form-input" required>
                    <option value="">-- Sélectionner un chauffeur --</option>
                    <c:forEach items="${chauffeurs}" var="chauffeur">
                        <option value="${chauffeur.idChauffeur}">
                            ${chauffeur.nom} ${chauffeur.prenom}
                        </option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label class="form-label required">Véhicule <span style="color: #ef4444;">*</span></label>
                <select name="idVehicule" class="form-input" required>
                    <option value="">-- Sélectionner un véhicule --</option>
                    <c:forEach items="${vehicules}" var="vehicule">
                        <option value="${vehicule.idVehicule}">
                            ${vehicule.immatriculation} (${vehicule.nombrePlace} places)
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label class="form-label required">Date du Voyage <span style="color: #ef4444;">*</span></label>
                <input type="date" name="dateVoyage" class="form-input" required>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label class="form-label required">Heure du Départ <span style="color: #ef4444;">*</span></label>
                <input type="time" name="heureVoyage" class="form-input" required>
            </div>
        </div>
    </fieldset>

    <div class="form-actions">
        <a href="<c:url value='/voyage/list'/>" class="btn-secondary" style="text-decoration: none; display: inline-flex; align-items: center;">
            <i class="fas fa-times"></i> Annuler
        </a>
        <div class="form-actions-primary">
            <button type="submit" class="btn-primary">
                <i class="fas fa-save"></i> Enregistrer
            </button>
        </div>
    </div>
</form>
