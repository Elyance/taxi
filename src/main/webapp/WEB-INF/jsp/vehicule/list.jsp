<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="list-header">
    <h2 class="list-title"><i class="fas fa-truck"></i> Gestion des Véhicules</h2>
    <div class="list-actions">
        <button class="btn-primary" onclick="window.location.href='<c:url value='/vehicule/create'/>'">
            <i class="fas fa-plus"></i> Ajouter un Véhicule
        </button>
    </div>
</div>

<div class="filter-section">
    <div class="filter-section-title">
        <i class="fas fa-filter"></i> Filtres
    </div>
    <form method="get" action="<c:url value='/vehicule/list'/>" class="filter-form">
        <div class="filter-group">
            <div class="filter-item">
                <label class="filter-label">Immatriculation</label>
                <input type="text" name="immatriculation" class="filter-input" placeholder="Rechercher par immatriculation..." value="${param.immatriculation}">
            </div>
            <div class="filter-item">
                <label class="filter-label">Modèle</label>
                <select name="idModele" class="filter-select">
                    <option value="">Tous les modèles</option>
                    <c:forEach items="${modeles}" var="modele">
                        <option value="${modele.idModeleVehicule}" <c:if test="${param.idModele == modele.idModeleVehicule}">selected</c:if>>
                            ${modele.libelle}
                        </option>
                    </c:forEach>
                </select>
            </div>
            <div class="filter-item">
                <label class="filter-label">Nombre de Places (minimum)</label>
                <input type="number" name="nombrePlace" class="filter-input" placeholder="Ex: 8" min="1" value="${param.nombrePlace}">
            </div>
        </div>
        <div class="filter-actions">
            <button type="submit" class="btn-filter">
                <i class="fas fa-search"></i> Filtrer
            </button>
            <a href="<c:url value='/vehicule/list'/>" class="btn-reset" style="text-decoration: none; display: inline-flex; align-items: center;">
                <i class="fas fa-redo"></i> Réinitialiser
            </a>
        </div>
    </form>
</div>

<c:choose>
    <c:when test="${empty vehicules}">
        <div class="empty-state">
            <div class="empty-state-icon"><i class="fas fa-inbox"></i></div>
            <div class="empty-state-title">Aucun véhicule trouvé</div>
            <div class="empty-state-text">Aucun véhicule ne correspond à vos critères de recherche.</div>
            <button class="btn-primary" onclick="window.location.href='<c:url value='/vehicule/create'/>'">
                <i class="fas fa-plus"></i> Ajouter un Véhicule
            </button>
        </div>
    </c:when>
    <c:otherwise>
        <div style="overflow-x: auto;">
            <table class="data-table">
                <thead>
                    <tr>
                        <th>Immatriculation</th>
                        <th>Nombre Places</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${vehicules}" var="vehicule">
                        <tr>
                            <td><strong>${vehicule.immatriculation}</strong></td>
                            <td>${vehicule.nombrePlace}</td>
                            <td>
                                <div class="table-actions">
                                    <a href="<c:url value='/vehicule/details/${vehicule.idVehicule}'/>" class="btn-action btn-view" title="Voir" style="text-decoration: none;">
                                        <i class="fas fa-eye"></i> Voir
                                    </a>
                                    <a href="<c:url value='/vehicule/edit/${vehicule.idVehicule}'/>" class="btn-action btn-edit" title="Modifier" style="text-decoration: none;">
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
            Affichage de <strong>${vehicules.size()}</strong> véhicule(s)
        </p>
    </c:otherwise>
</c:choose>

