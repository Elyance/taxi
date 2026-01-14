<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div style="margin-bottom: 20px;">
    <nav class="breadcrumb">
        <a href="<c:url value='/dashboard'/>" class="breadcrumb-item">Tableau de Bord</a>
        <span class="breadcrumb-separator"><i class="fas fa-chevron-right"></i></span>
        <a href="<c:url value='/vehicule/list'/>" class="breadcrumb-item">Véhicules</a>
        <span class="breadcrumb-separator"><i class="fas fa-chevron-right"></i></span>
        <span class="breadcrumb-item active">Modifier un Véhicule</span>
    </nav>
</div>

<h2 style="font-size: 24px; font-weight: 700; color: #1f2937; margin-bottom: 10px;">
    <i class="fas fa-edit"></i> Modifier le Véhicule
</h2>
<p style="color: #6b7280; margin-bottom: 30px;">Modifiez les informations du véhicule ${vehicule.immatriculation}</p>

<form method="post" action="<c:url value='/vehicule/edit/${vehicule.idVehicule}'/>" class="form-container">
    <fieldset style="margin-bottom: 30px; border: none; padding: 0;">
        <legend style="font-size: 16px; font-weight: 700; color: #1f2937; margin-bottom: 20px; padding-bottom: 10px; border-bottom: 2px solid #e5e7eb;">
            <i class="fas fa-car"></i> Informations Véhicule
        </legend>

        <div class="form-row">
            <div class="form-group form-group-row">
                <label class="form-label required">Immatriculation</label>
                <input type="text" name="immatriculation" class="form-input" value="${vehicule.immatriculation}" required>
            </div>

            <div class="form-group form-group-row">
                <label class="form-label required">Nombre de Places</label>
                <input type="number" name="nombrePlace" class="form-input" value="${vehicule.nombrePlace}" min="1" max="20" required>
            </div>
        </div>

        <div class="form-group">
            <label class="form-label">Modèle</label>
            <select name="idModele" class="form-select">
                <option value="">Sélectionner un modèle</option>
                <c:forEach items="${modeles}" var="modele">
                    <option value="${modele.idModeleVehicule}" <c:if test="${vehicule.modeleVehicule != null && vehicule.modeleVehicule.idModeleVehicule == modele.idModeleVehicule}">selected</c:if>>
                        ${modele.libelle}
                    </option>
                </c:forEach>
            </select>
        </div>
    </fieldset>

    <div class="form-actions">
        <button type="button" class="btn-secondary" onclick="window.location.href='<c:url value='/vehicule/list'/>'">
            <i class="fas fa-times"></i> Annuler
        </button>
        <div class="form-actions-primary">
            <button type="submit" class="btn-primary">
                <i class="fas fa-save"></i> Enregistrer
            </button>
        </div>
    </div>
</form>
