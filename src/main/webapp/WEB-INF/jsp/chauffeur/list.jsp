<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="list-header">
    <h2 class="list-title"><i class="fas fa-id-card"></i> Gestion des Chauffeurs</h2>
    <div class="list-actions">
        <button class="btn-primary" onclick="window.location.href='<c:url value='/chauffeur/create'/>'">
            <i class="fas fa-plus"></i> Ajouter un Chauffeur
        </button>
    </div>
</div>

<div class="filter-section">
    <div class="filter-section-title">
        <i class="fas fa-filter"></i> Filtres
    </div>
    <form method="get" action="<c:url value='/chauffeur/list'/>" class="filter-form">
        <div class="filter-group">
            <div class="filter-item">
                <label class="filter-label">Nom</label>
                <input type="text" name="nom" class="filter-input" placeholder="Rechercher par nom..." value="${param.nom}">
            </div>
            <div class="filter-item">
                <label class="filter-label">Prénom</label>
                <input type="text" name="prenom" class="filter-input" placeholder="Rechercher par prénom..." value="${param.prenom}">
            </div>
        </div>
        <div class="filter-actions">
            <button type="submit" class="btn-filter">
                <i class="fas fa-search"></i> Filtrer
            </button>
            <a href="<c:url value='/chauffeur/list'/>" class="btn-reset" style="text-decoration: none; display: inline-flex; align-items: center;">
                <i class="fas fa-redo"></i> Réinitialiser
            </a>
        </div>
    </form>
</div>

<c:choose>
    <c:when test="${empty chauffeurs}">
        <div class="empty-state">
            <div class="empty-state-icon"><i class="fas fa-inbox"></i></div>
            <div class="empty-state-title">Aucun chauffeur trouvé</div>
            <div class="empty-state-text">Aucun chauffeur ne correspond à vos critères de recherche.</div>
            <button class="btn-primary" onclick="window.location.href='<c:url value='/chauffeur/create'/>'">
                <i class="fas fa-plus"></i> Ajouter un Chauffeur
            </button>
        </div>
    </c:when>
    <c:otherwise>
        <div style="overflow-x: auto;">
            <table class="data-table">
                <thead>
                    <tr>
                        <th>Nom</th>
                        <th>Prénom</th>
                        <th>Téléphone</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${chauffeurs}" var="chauffeur">
                        <tr>
                            <td><strong>${chauffeur.nom}</strong></td>
                            <td>${chauffeur.prenom}</td>
                            <td>${chauffeur.telephone}</td>
                            <td>
                                <div class="table-actions">
                                    <a href="<c:url value='/chauffeur/details/${chauffeur.idChauffeur}'/>" class="btn-action btn-view" title="Voir" style="text-decoration: none;">
                                        <i class="fas fa-eye"></i> Voir
                                    </a>
                                    <a href="<c:url value='/chauffeur/edit/${chauffeur.idChauffeur}'/>" class="btn-action btn-edit" title="Modifier" style="text-decoration: none;">
                                        <i class="fas fa-edit"></i> Éditer
                                    </a>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <p style="text-align: center; color: #6b7280; font-size: 13px; margin-top: 15px;">
            Affichage de <strong>${chauffeurs.size()}</strong> chauffeur(s)
        </p>
    </c:otherwise>
</c:choose>
