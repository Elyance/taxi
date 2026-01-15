<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.time.format.DateTimeFormatter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="list-header">
    <h2 class="list-title"><i class="fas fa-ticket-alt"></i> Gestion des Billets</h2>
</div>

<div class="filter-section">
    <div class="filter-section-title">
        <i class="fas fa-filter"></i> Filtres de Recherche
    </div>
    <form method="GET" action="<c:url value='/billet/list'/>" class="filter-form">
        <div class="filter-group">
            <div class="filter-item">
                <label class="filter-label">
                    <i class="fas fa-road"></i> Trajet
                </label>
                <select name="idTrajet" id="idTrajet" class="filter-select">
                    <option value="">-- Tous les trajets --</option>
                    <c:forEach var="trajet" items="${trajets}">
                        <option value="${trajet.idTrajet}" ${param.idTrajet == trajet.idTrajet ? 'selected' : ''}>
                            ${trajet.gareDepart.nom} → ${trajet.gareArrivee.nom}
                        </option>
                    </c:forEach>
                </select>
            </div>
            <div class="filter-item">
                <label class="filter-label">
                    <i class="fas fa-calendar"></i> Date début
                </label>
                <input type="date" name="dateDebut" id="dateDebut" class="filter-input" value="${param.dateDebut}">
            </div>
            <div class="filter-item">
                <label class="filter-label">
                    <i class="fas fa-calendar"></i> Date fin
                </label>
                <input type="date" name="dateFin" id="dateFin" class="filter-input" value="${param.dateFin}">
            </div>
            <div class="filter-item">
                <label class="filter-label">
                    <i class="fas fa-car"></i> Immatriculation
                </label>
                <input type="text" name="immatriculation" id="immatriculation" class="filter-input"
                       placeholder="Ex: ABC123" value="${param.immatriculation}">
            </div>
        </div>
        <div class="filter-actions">
            <button type="submit" class="btn-filter">
                <i class="fas fa-search"></i> Filtrer
            </button>
            <a href="<c:url value='/billet/list'/>" class="btn-reset" style="text-decoration: none; display: inline-flex; align-items: center;">
                <i class="fas fa-redo"></i> Réinit.
            </a>
        </div>
    </form>
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

<!-- Statistiques -->
<div class="billet-stats-container">
    <div class="billet-stat-card">
                        <div class="billet-stat-gradient billet-stat-success">
                            <div class="billet-stat-content">
                                <div>
                                    <h6 class="billet-stat-label">Chiffre d'Affaires</h6>
                                    <h3 class="billet-stat-value">
                                        <fmt:formatNumber value="${chiffreAffaire}" type="currency" currencySymbol="€"/>
                                    </h3>
                                </div>
                                <div class="billet-stat-icon">
                                    <i class="fas fa-chart-line"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="billet-stat-card">
                        <div class="billet-stat-gradient billet-stat-info">
                            <div class="billet-stat-content">
                                <div>
                                    <h6 class="billet-stat-label">Nombre de Billets</h6>
                                    <h3 class="billet-stat-value">${nombreBillets}</h3>
                                </div>
                                <div class="billet-stat-icon">
                                    <i class="fas fa-ticket-alt"></i>
                                </div>
                            </div>
                        </div>
                    </div>
</div>

<!-- Tableau des billets -->
<div class="billet-table-container">
    <div class="billet-table-card">
        <div class="billet-table-header">
            <h3 class="billet-table-title">
                <i class="fas fa-list"></i> Liste des Billets
            </h3>
            <span class="billet-table-badge">
                <c:choose>
                    <c:when test="${nombreBillets > 0}">
                        ${nombreBillets} entrée(s)
                    </c:when>
                    <c:otherwise>
                        Aucune donnée
                    </c:otherwise>
                </c:choose>
            </span>
        </div>
        <div class="billet-table-body">
                    <!-- Debug -->
                    <div style="display:none;">
                        Billets: ${billets}
                        NombreBillets: ${nombreBillets}
                        ChiffreAffaire: ${chiffreAffaire}
                    </div>
                    <c:choose>
                        <c:when test="${empty billets}">
                            <div class="alert alert-info m-3">
                                <i class="fas fa-info-circle"></i> Aucun billet n'a été trouvé avec les critères spécifiés.
                            </div>
                        </c:when>
                        <c:otherwise>
                            <table class="table table-striped table-hover text-nowrap">
                                <thead class="table-light">
                                    <tr>
                                        <th style="width: 5%;"><i class="fas fa-hashtag"></i> ID</th>
                                        <th style="width: 12%;"><i class="fas fa-user"></i> Client</th>
                                        <th style="width: 13%;"><i class="fas fa-road"></i> Trajet</th>
                                        <th style="width: 12%;"><i class="fas fa-calendar"></i> Date/Heure</th>
                                        <th style="width: 10%;"><i class="fas fa-car"></i> Véhicule</th>
                                        <th style="width: 10%;"><i class="fas fa-user-tie"></i> Chauffeur</th>
                                        <th style="width: 6%;"><i class="fas fa-chair"></i> Place</th>
                                        <th style="width: 10%;">
                                            <i class="fas fa-flag"></i> Statut
                                        </th>
                                        <th style="width: 8%;"><i class="fas fa-euro-sign"></i> Montant</th>
                                        <th style="width: 6%;">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="billet" items="${billets}">
                                        <tr class="align-middle">
                                            <td>
                                                <span class="badge badge-secondary">#${billet.idBillet}</span>
                                            </td>
                                            <td>
                                                <strong>${billet.nomClient}</strong><br>
                                                <small class="text-muted">
                                                    <i class="fas fa-phone"></i> ${billet.telephoneClient}
                                                </small>
                                            </td>
                                            <td>
                                                <small>
                                                    ${billet.gareDepart} <br>
                                                    <strong>→</strong> <br>
                                                    ${billet.gareArrivee}
                                                </small>
                                            </td>
                                            <td>
                                                <small>
                                                    ${billet.dateVoyage.format(DateTimeFormatter.ofPattern('dd/MM/yyyy'))}
                                                    <br>
                                                    <strong>${billet.dateVoyage.format(DateTimeFormatter.ofPattern('HH:mm'))}</strong>
                                                </small>
                                            </td>
                                            <td>
                                                <strong>${billet.immatriculation}</strong>
                                            </td>
                                            <td>
                                                <small>${billet.nomChauffeur} ${billet.prenomChauffeur}</small>
                                            </td>
                                            <td class="text-center">
                                                <span class="badge badge-info">P<fmt:formatNumber value="${billet.numeroPlace}" pattern="000"/></span>
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${billet.statutBillet == 'CONFIRMÉ'}">
                                                        <span class="badge badge-success">
                                                            <i class="fas fa-check-circle"></i> ${billet.statutBillet}
                                                        </span>
                                                    </c:when>
                                                    <c:when test="${billet.statutBillet == 'EN_ATTENTE'}">
                                                        <span class="badge badge-warning">
                                                            <i class="fas fa-hourglass-half"></i> ${billet.statutBillet}
                                                        </span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge badge-secondary">
                                                            <i class="fas fa-times-circle"></i> ${billet.statutBillet}
                                                        </span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <strong class="text-success">
                                                    <fmt:formatNumber value="${billet.montant}" type="currency" currencySymbol=""/>
                                                </strong>
                                            </td>
                                            <td>
                                                <a href="<c:url value='/billet/details/${billet.idBillet}'/>" class="btn-action btn-view" title="Voir" style="text-decoration: none;">
                                                    <i class="fas fa-eye"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:otherwise>
                    </c:choose>
    </div>
