<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div style="margin-bottom: 20px;">
    <nav class="breadcrumb">
        <a href="<c:url value='/dashboard'/>" class="breadcrumb-item">Tableau de Bord</a>
        <span class="breadcrumb-separator"><i class="fas fa-chevron-right"></i></span>
        <a href="<c:url value='/vehicule/list'/>" class="breadcrumb-item">Véhicules</a>
        <span class="breadcrumb-separator"><i class="fas fa-chevron-right"></i></span>
        <span class="breadcrumb-item active">Ajouter un Véhicule</span>
    </nav>
</div>

<h2 style="font-size: 24px; font-weight: 700; color: #1f2937; margin-bottom: 10px;">
    <i class="fas fa-plus-circle"></i> Ajouter un Véhicule
</h2>
<p style="color: #6b7280; margin-bottom: 30px;">Remplissez le formulaire ci-dessous pour ajouter un nouveau véhicule à la flotte.</p>

<!-- Success Alert Example -->
<div class="alert alert-success" style="display: none;">
    <div class="alert-icon"><i class="fas fa-check-circle"></i></div>
    <div class="alert-content">
        <div class="alert-title">Succès!</div>
        <div class="alert-message">Le véhicule a été créé avec succès.</div>
    </div>
</div>

<!-- Form -->
<form method="post" action="#" class="form-container">
    <!-- Section Véhicule -->
    <fieldset style="margin-bottom: 30px; border: none; padding: 0;">
        <legend style="font-size: 16px; font-weight: 700; color: #1f2937; margin-bottom: 20px; padding-bottom: 10px; border-bottom: 2px solid #e5e7eb;">
            <i class="fas fa-car"></i> Informations Véhicule
        </legend>

        <div class="form-row">
            <div class="form-group form-group-row">
                <label class="form-label required">Immatriculation</label>
                <input type="text" name="immatriculation" class="form-input" placeholder="Ex: TN-3251-CD" required>
                <span class="form-help">Format: TN-XXXX-XX</span>
            </div>

            <div class="form-group form-group-row">
                <label class="form-label required">Modèle Véhicule</label>
                <select name="modeleVehicule" class="form-select" required>
                    <option value="">Sélectionner un modèle</option>
                    <option value="1">Toyota Hiace</option>
                    <option value="2">Mercedes Sprinter</option>
                    <option value="3">Ford Transit</option>
                    <option value="4">Iveco Daily</option>
                </select>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group form-group-row">
                <label class="form-label required">Nombre de Places</label>
                <input type="number" name="nombrePlace" class="form-input" placeholder="Ex: 8" min="1" max="20" required>
            </div>

            <div class="form-group form-group-row">
                <label class="form-label">Année de Fabrication</label>
                <input type="number" name="annee" class="form-input" placeholder="Ex: 2020" min="1990" max="2100">
            </div>
        </div>

        <div class="form-group">
            <label class="form-label">Description</label>
            <textarea name="description" class="form-textarea" placeholder="Ajoutez des détails supplémentaires sur le véhicule..."></textarea>
        </div>
    </fieldset>

    <!-- Section Statut -->
    <fieldset style="border: none; padding: 0; margin-bottom: 30px;">
        <legend style="font-size: 16px; font-weight: 700; color: #1f2937; margin-bottom: 20px; padding-bottom: 10px; border-bottom: 2px solid #e5e7eb;">
            <i class="fas fa-info-circle"></i> Statut & Options
        </legend>

        <div class="form-group">
            <label class="form-label required">Statut</label>
            <select name="statut" class="form-select" required>
                <option value="">Sélectionner un statut</option>
                <option value="actif">Actif</option>
                <option value="maintenance">En Maintenance</option>
                <option value="inactif">Inactif</option>
            </select>
        </div>

        <div class="form-group">
            <label class="checkbox-label">
                <input type="checkbox" name="estDisponible" class="form-checkbox" checked>
                <span>Véhicule disponible pour les voyages</span>
            </label>
        </div>
    </fieldset>

    <!-- Form Actions -->
    <div class="form-actions">
        <button type="button" class="btn-secondary" onclick="window.location.href='<c:url value='/vehicule/list'/>'">
            <i class="fas fa-times"></i> Annuler
        </button>
        <div class="form-actions-primary">
            <button type="reset" class="btn-secondary">
                <i class="fas fa-redo"></i> Réinitialiser
            </button>
            <button type="submit" class="btn-primary">
                <i class="fas fa-save"></i> Enregistrer
            </button>
        </div>
    </div>
</form>
