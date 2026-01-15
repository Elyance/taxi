<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div style="margin-bottom: 20px;">
    <nav class="breadcrumb">
        <a href="<c:url value='/dashboard'/>" class="breadcrumb-item">Tableau de Bord</a>
        <span class="breadcrumb-separator"><i class="fas fa-chevron-right"></i></span>
        <a href="<c:url value='/client/list'/>" class="breadcrumb-item">Clients</a>
        <span class="breadcrumb-separator"><i class="fas fa-chevron-right"></i></span>
        <span class="breadcrumb-item active">Détails du Client</span>
    </nav>
</div>

<div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 30px;">
    <h2 style="font-size: 24px; font-weight: 700; color: #1f2937;">
        <i class="fas fa-info-circle"></i> ${client.nom}
    </h2>
    <div style="display: flex; gap: 10px;">
        <a href="<c:url value='/client/edit/${client.idClient}'/>" class="btn-primary" style="text-decoration: none; display: inline-flex; align-items: center;">
            <i class="fas fa-edit"></i> Modifier
        </a>
        <a href="<c:url value='/client/list'/>" class="btn-secondary" style="text-decoration: none; display: inline-flex; align-items: center;">
            <i class="fas fa-arrow-left"></i> Retour
        </a>
    </div>
</div>

<div class="form-container">
    <fieldset style="border: none; padding: 0; margin-bottom: 30px;">
        <legend style="font-size: 16px; font-weight: 700; color: #1f2937; margin-bottom: 20px; padding-bottom: 10px; border-bottom: 2px solid #e5e7eb;">
            <i class="fas fa-user"></i> Informations Client
        </legend>

        <div class="form-group">
            <label class="form-label" style="font-weight: 700;">Nom</label>
            <p style="margin: 0; padding: 12px 0; color: #1f2937;">${client.nom}</p>
        </div>

        <div class="form-group">
            <label class="form-label" style="font-weight: 700;">Téléphone</label>
            <p style="margin: 0; padding: 12px 0; color: #1f2937;">
                <c:choose>
                    <c:when test="${client.telephone != null && !client.telephone.isEmpty()}">
                        ${client.telephone}
                    </c:when>
                    <c:otherwise>
                        <span style="color: #9ca3af;">Non spécifié</span>
                    </c:otherwise>
                </c:choose>
            </p>
        </div>
    </fieldset>

    <div class="form-actions">
        <a href="<c:url value='/client/delete/${client.idClient}'/>" class="btn-danger" style="text-decoration: none; display: inline-flex; align-items: center;" onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce client ?');">
            <i class="fas fa-trash"></i> Supprimer
        </a>
        <div class="form-actions-primary">
            <a href="<c:url value='/client/edit/${client.idClient}'/>" class="btn-primary" style="text-decoration: none; display: inline-flex; align-items: center;">
                <i class="fas fa-edit"></i> Modifier
            </a>
        </div>
    </div>
</div>