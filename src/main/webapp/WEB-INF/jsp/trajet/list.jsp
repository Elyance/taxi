<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="list-header">
    <h2 class="list-title"><i class="fas fa-route"></i> Gestion des Trajets</h2>
    <div class="list-actions">
        <button class="btn-primary" onclick="window.location.href='<c:url value='/trajet/create'/>'">
            <i class="fas fa-plus"></i> Ajouter un Trajet
        </button>
    </div>
</div>

<div class="filter-section">
    <div class="filter-section-title">
        <i class="fas fa-filter"></i> Filtres
    </div>
    <form method="get" action="<c:url value='/trajet/list'/>" class="filter-form">
        <div class="filter-group">
            <div class="filter-item">
                <label class="filter-label">Gare de Départ</label>
                <select name="idGareDepart" class="filter-select">
                    <option value="">Toutes les gares</option>
                    <c:forEach items="${gares}" var="gare">
                        <option value="${gare.idGare}" <c:if test="${param.idGareDepart == gare.idGare}">selected</c:if>>
                            ${gare.nom}
                        </option>
                    </c:forEach>
                </select>
            </div>
            <div class="filter-item">
                <label class="filter-label">Gare d'Arrivée</label>
                <select name="idGareArrivee" class="filter-select">
                    <option value="">Toutes les gares</option>
                    <c:forEach items="${gares}" var="gare">
                        <option value="${gare.idGare}" <c:if test="${param.idGareArrivee == gare.idGare}">selected</c:if>>
                            ${gare.nom}
                        </option>
                    </c:forEach>
                </select>
            </div>
            <div class="filter-item">
                <label class="filter-label">Tarif Min (Fr)</label>
                <input type="number" name="prixMin" class="filter-input" placeholder="Ex: 1000" step="0.01" min="0" value="${param.prixMin}">
            </div>
            <div class="filter-item">
                <label class="filter-label">Tarif Max (Fr)</label>
                <input type="number" name="prixMax" class="filter-input" placeholder="Ex: 10000" step="0.01" min="0" value="${param.prixMax}">
            </div>
        </div>
        <div class="filter-actions">
            <button type="submit" class="btn-filter">
                <i class="fas fa-search"></i> Filtrer
            </button>
            <a href="<c:url value='/trajet/list'/>" class="btn-reset" style="text-decoration: none; display: inline-flex; align-items: center;">
                <i class="fas fa-redo"></i> Réinitialiser
            </a>
        </div>
    </form>
</div>

<c:choose>
    <c:when test="${empty trajets}">
        <div class="empty-state">
            <div class="empty-state-icon"><i class="fas fa-inbox"></i></div>
            <div class="empty-state-title">Aucun trajet trouvé</div>
            <div class="empty-state-text">Aucun trajet ne correspond à vos critères de recherche.</div>
            <button class="btn-primary" onclick="window.location.href='<c:url value='/trajet/create'/>'">
                <i class="fas fa-plus"></i> Ajouter un Trajet
            </button>
        </div>
    </c:when>
    <c:otherwise>
        <div style="overflow-x: auto;">
            <table class="data-table">
                <thead>
                    <tr>
                        <th>Gare de Départ</th>
                        <th>Gare d'Arrivée</th>
                        <th>Tarif (Fr)</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${trajets}" var="trajet">
                        <tr>
                            <td><strong>${trajet.gareDepart}</strong></td>
                            <td><strong>${trajet.gareArrivee}</strong></td>
                            <td style="text-align: right; font-weight: 700;">
                                <c:choose>
                                    <c:when test="${trajet.tarifPrix != null && trajet.tarifPrix > 0}">
                                        ${trajet.tarifPrix}
                                    </c:when>
                                    <c:otherwise>
                                        <span style="color: #9ca3af;">-</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <div class="table-actions">
                                    <span style="color: #9ca3af; font-size: 12px;">-</span>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <p style="text-align: center; color: #6b7280; font-size: 13px; margin-top: 15px;">
            Affichage de <strong>${trajets.size()}</strong> trajet(s)
        </p>
    </c:otherwise>
</c:choose>
