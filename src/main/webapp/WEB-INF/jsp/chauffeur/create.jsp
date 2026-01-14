<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div style="margin-bottom: 20px;">
    <nav class="breadcrumb">
        <a href="<c:url value='/dashboard'/>" class="breadcrumb-item">Tableau de Bord</a>
        <span class="breadcrumb-separator"><i class="fas fa-chevron-right"></i></span>
        <a href="<c:url value='/chauffeur/list'/>" class="breadcrumb-item">Chauffeurs</a>
        <span class="breadcrumb-separator"><i class="fas fa-chevron-right"></i></span>
        <span class="breadcrumb-item active">Ajouter un Chauffeur</span>
    </nav>
</div>

<h2 style="font-size: 24px; font-weight: 700; color: #1f2937; margin-bottom: 10px;">
    <i class="fas fa-plus-circle"></i> Ajouter un Chauffeur
</h2>
<p style="color: #6b7280; margin-bottom: 30px;">Remplissez le formulaire ci-dessous pour ajouter un nouveau chauffeur.</p>

<form method="post" action="<c:url value='/chauffeur/create'/>" class="form-container">
    <fieldset style="margin-bottom: 30px; border: none; padding: 0;">
        <legend style="font-size: 16px; font-weight: 700; color: #1f2937; margin-bottom: 20px; padding-bottom: 10px; border-bottom: 2px solid #e5e7eb;">
            <i class="fas fa-user"></i> Informations Personnelles
        </legend>

        <div class="form-row">
            <div class="form-group form-group-row">
                <label class="form-label required">Nom</label>
                <input type="text" name="nom" class="form-input" placeholder="Ex: Dupont" required>
            </div>

            <div class="form-group form-group-row">
                <label class="form-label required">Prénom</label>
                <input type="text" name="prenom" class="form-input" placeholder="Ex: Jean" required>
            </div>
        </div>

        <div class="form-group">
            <label class="form-label">Téléphone</label>
            <input type="tel" name="telephone" class="form-input" placeholder="Ex: +216 XX XXX XXX">
        </div>
    </fieldset>

    <div class="form-actions">
        <button type="button" class="btn-secondary" onclick="window.location.href='<c:url value='/chauffeur/list'/>'">
            <i class="fas fa-times"></i> Annuler
        </button>
        <div class="form-actions-primary">
            <button type="submit" class="btn-primary">
                <i class="fas fa-save"></i> Enregistrer
            </button>
        </div>
    </div>
</form>
