<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div style="margin-bottom: 20px;">
    <nav class="breadcrumb">
        <a href="<c:url value='/dashboard'/>" class="breadcrumb-item">Tableau de Bord</a>
        <span class="breadcrumb-separator"><i class="fas fa-chevron-right"></i></span>
        <a href="<c:url value='/trajet/list'/>" class="breadcrumb-item">Trajets</a>
        <span class="breadcrumb-separator"><i class="fas fa-chevron-right"></i></span>
        <span class="breadcrumb-item active">Créer un Trajet</span>
    </nav>
</div>

<h2 style="font-size: 24px; font-weight: 700; color: #1f2937; margin-bottom: 30px;">
    <i class="fas fa-plus"></i> Créer un Trajet
</h2>

<c:if test="${not empty error}">
    <div class="alert alert-danger" style="margin-bottom: 20px;">
        <i class="fas fa-exclamation-circle"></i> ${error}
    </div>
</c:if>

<form action="<c:url value='/trajet/create'/>" method="POST" class="form-container">
    <fieldset style="border: none; padding: 0; margin-bottom: 30px;">
        <legend style="font-size: 16px; font-weight: 700; color: #1f2937; margin-bottom: 20px; padding-bottom: 10px; border-bottom: 2px solid #e5e7eb;">
            <i class="fas fa-route"></i> Informations du Trajet
        </legend>

        <div class="form-row">
            <div class="form-group">
                <label class="form-label required">Gare de Départ <span style="color: #ef4444;">*</span></label>
                <select name="idGareDepart" class="form-input" required>
                    <option value="">-- Sélectionner une gare de départ --</option>
                    <c:forEach items="${gares}" var="gare">
                        <option value="${gare.idGare}">${gare.nom}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label class="form-label required">Gare d'Arrivée <span style="color: #ef4444;">*</span></label>
                <select name="idGareArrivee" class="form-input" required>
                    <option value="">-- Sélectionner une gare d'arrivée --</option>
                    <c:forEach items="${gares}" var="gare">
                        <option value="${gare.idGare}">${gare.nom}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="form-label">Tarif (Fr)</label>
            <input type="number" name="tarifPrix" class="form-input" placeholder="Entrez le tarif (optionnel)" step="0.01" min="0">
        </div>
    </fieldset>

    <div class="form-actions">
        <a href="<c:url value='/trajet/list'/>" class="btn-secondary" style="text-decoration: none; display: inline-flex; align-items: center;">
            <i class="fas fa-times"></i> Annuler
        </a>
        <div class="form-actions-primary">
            <button type="submit" class="btn-primary">
                <i class="fas fa-save"></i> Enregistrer
            </button>
        </div>
    </div>
</form>
