<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div style="margin-bottom: 20px;">
    <nav class="breadcrumb">
        <a href="<c:url value='/dashboard'/>" class="breadcrumb-item">Tableau de Bord</a>
        <span class="breadcrumb-separator"><i class="fas fa-chevron-right"></i></span>
        <a href="<c:url value='/client/list'/>" class="breadcrumb-item">Clients</a>
        <span class="breadcrumb-separator"><i class="fas fa-chevron-right"></i></span>
        <span class="breadcrumb-item active">${pageTitle}</span>
    </nav>
</div>

<h2 style="font-size: 24px; font-weight: 700; color: #1f2937; margin-bottom: 10px;">
    <i class="fas fa-plus-circle"></i> ${pageTitle}
</h2>
<p style="color: #6b7280; margin-bottom: 30px;">Remplissez le formulaire ci-dessous pour ${client.idClient != null ? 'modifier le client' : 'ajouter un nouveau client'}.</p>

<c:if test="${not empty error}">
    <div class="alert alert-danger">
        <div class="alert-icon">
            <i class="fas fa-exclamation-circle"></i>
        </div>
        <div class="alert-content">
            <div class="alert-message">${error}</div>
        </div>
    </div>
</c:if>

<form method="post" action="<c:url value='/client/save'/>" class="form-container">
    <fieldset style="margin-bottom: 30px; border: none; padding: 0;">
        <legend style="font-size: 16px; font-weight: 700; color: #1f2937; margin-bottom: 20px; padding-bottom: 10px; border-bottom: 2px solid #e5e7eb;">
            <i class="fas fa-user"></i> Informations Client
        </legend>

        <input type="hidden" name="idClient" value="${client.idClient}">

        <div class="form-group">
            <label class="form-label required">Nom du Client</label>
            <input type="text" name="nom" class="form-input" placeholder="Ex: Martin Dupont" value="${client.nom}" required>
        </div>

        <div class="form-group">
            <label class="form-label required">Téléphone</label>
            <input type="tel" name="telephone" class="form-input" placeholder="Ex: +261312345678 ou 0312345678" value="${client.telephone}" required>
        </div>
    </fieldset>

    <div class="form-actions">
        <button type="button" class="btn-secondary" onclick="window.location.href='<c:url value='/client/list'/>'">
            <i class="fas fa-times"></i> Annuler
        </button>
        <div class="form-actions-primary">
            <button type="submit" class="btn-primary">
                <i class="fas fa-save"></i> Enregistrer
            </button>
        </div>
    </div>
</form>