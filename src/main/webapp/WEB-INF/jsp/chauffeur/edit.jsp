<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div style="margin-bottom: 20px;">
    <nav class="breadcrumb">
        <a href="<c:url value='/dashboard'/>" class="breadcrumb-item">Tableau de Bord</a>
        <span class="breadcrumb-separator"><i class="fas fa-chevron-right"></i></span>
        <a href="<c:url value='/chauffeur/list'/>" class="breadcrumb-item">Chauffeurs</a>
        <span class="breadcrumb-separator"><i class="fas fa-chevron-right"></i></span>
        <span class="breadcrumb-item active">Modifier le Chauffeur</span>
    </nav>
</div>

<h2 style="font-size: 24px; font-weight: 700; color: #1f2937; margin-bottom: 30px;">
    <i class="fas fa-edit"></i> Modifier le Chauffeur
</h2>

<form action="<c:url value='/chauffeur/edit/${chauffeur.idChauffeur}'/>" method="POST" class="form-container">
    <fieldset style="border: none; padding: 0; margin-bottom: 30px;">
        <legend style="font-size: 16px; font-weight: 700; color: #1f2937; margin-bottom: 20px; padding-bottom: 10px; border-bottom: 2px solid #e5e7eb;">
            <i class="fas fa-user"></i> Informations Personnelles
        </legend>

        <div class="form-row">
            <div class="form-group">
                <label class="form-label required">Nom <span style="color: #ef4444;">*</span></label>
                <input type="text" name="nom" value="${chauffeur.nom}" class="form-input" placeholder="Entrez le nom du chauffeur" required>
            </div>

            <div class="form-group">
                <label class="form-label required">Prénom <span style="color: #ef4444;">*</span></label>
                <input type="text" name="prenom" value="${chauffeur.prenom}" class="form-input" placeholder="Entrez le prénom du chauffeur" required>
            </div>
        </div>

        <div class="form-group">
            <label class="form-label">Téléphone</label>
            <input type="tel" name="telephone" value="${chauffeur.telephone}" class="form-input" placeholder="Entrez le numéro de téléphone (optionnel)">
        </div>
    </fieldset>

    <div class="form-actions">
        <a href="<c:url value='/chauffeur/list'/>" class="btn-secondary" style="text-decoration: none; display: inline-flex; align-items: center;">
            <i class="fas fa-times"></i> Annuler
        </a>
        <div class="form-actions-primary">
            <button type="submit" class="btn-primary">
                <i class="fas fa-save"></i> Enregistrer
            </button>
        </div>
    </div>
</form>
