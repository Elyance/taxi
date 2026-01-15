<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="list-header">
    <h2 class="list-title"><i class="fas fa-users"></i> Gestion des Clients</h2>
    <div class="list-actions">
        <button class="btn-primary" onclick="window.location.href='<c:url value='/client/create'/>'">
            <i class="fas fa-plus"></i> Ajouter un Client
        </button>
    </div>
</div>

<c:if test="${not empty param.success}">
    <div class="alert alert-success">
        <div class="alert-icon">
            <i class="fas fa-check-circle"></i>
        </div>
        <div class="alert-content">
            <div class="alert-message">${param.success}</div>
        </div>
    </div>
</c:if>

<c:if test="${not empty param.error}">
    <div class="alert alert-danger">
        <div class="alert-icon">
            <i class="fas fa-exclamation-circle"></i>
        </div>
        <div class="alert-content">
            <div class="alert-message">${param.error}</div>
        </div>
    </div>
</c:if>

<c:choose>
    <c:when test="${empty clients}">
        <div class="empty-state">
            <div class="empty-state-icon"><i class="fas fa-inbox"></i></div>
            <div class="empty-state-title">Aucun client trouvé</div>
            <div class="empty-state-text">Aucun client ne correspond à vos critères de recherche.</div>
            <button class="btn-primary" onclick="window.location.href='<c:url value='/client/create'/>'">
                <i class="fas fa-plus"></i> Ajouter un Client
            </button>
        </div>
    </c:when>
    <c:otherwise>
        <div style="overflow-x: auto;">
            <table class="data-table">
                <thead>
                    <tr>
                        <th>Nom</th>
                        <th>Téléphone</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${clients}" var="client">
                        <tr>
                            <td><strong>${client.nom}</strong></td>
                            <td>${client.telephone}</td>
                            <td>
                                <div class="table-actions">
                                    <a href="<c:url value='/client/details/${client.idClient}'/>" class="btn-action btn-view" title="Voir" style="text-decoration: none;">
                                        <i class="fas fa-eye"></i> Voir
                                    </a>
                                    <a href="<c:url value='/client/edit/${client.idClient}'/>" class="btn-action btn-edit" title="Modifier" style="text-decoration: none;">
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
            Affichage de <strong>${clients.size()}</strong> client(s)
        </p>
    </c:otherwise>
</c:choose>