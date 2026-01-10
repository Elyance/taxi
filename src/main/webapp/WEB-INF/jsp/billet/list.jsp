<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des Billets</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-style.css">
    <style>
        .container {
            max-width: 1400px;
            margin: 50px auto;
            padding: 20px;
        }
        
        h1 {
            color: #333;
            margin-bottom: 30px;
        }
        
        .stats-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }
        
        .stat-card {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            border-left: 4px solid #007bff;
        }
        
        .stat-card h3 {
            margin: 0 0 10px 0;
            color: #666;
            font-size: 14px;
            text-transform: uppercase;
        }
        
        .stat-card .value {
            font-size: 32px;
            font-weight: bold;
            color: #333;
        }
        
        .billets-table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            border-radius: 8px;
            overflow: hidden;
        }
        
        .billets-table th {
            background-color: #343a40;
            color: white;
            padding: 15px;
            text-align: left;
            font-weight: 600;
        }
        
        .billets-table td {
            padding: 12px 15px;
            border-bottom: 1px solid #e0e0e0;
        }
        
        .billets-table tr:last-child td {
            border-bottom: none;
        }
        
        .billets-table tr:hover {
            background-color: #f8f9fa;
        }
        
        .badge {
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 12px;
            font-weight: 500;
        }
        
        .badge-success {
            background-color: #d4edda;
            color: #155724;
        }
        
        .badge-warning {
            background-color: #fff3cd;
            color: #856404;
        }
        
        .badge-danger {
            background-color: #f8d7da;
            color: #721c24;
        }
        
        .btn-view {
            padding: 6px 12px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            text-decoration: none;
            display: inline-block;
        }
        
        .btn-view:hover {
            background-color: #0056b3;
        }
        
        .no-results {
            text-align: center;
            padding: 40px;
            color: #666;
            font-size: 16px;
        }
        
        .route-info {
            font-weight: 500;
        }
        
        .route-arrow {
            color: #007bff;
            margin: 0 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>📋 Liste des Billets</h1>
        
        <!-- Filtres -->
        <div style="background: white; padding: 20px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); margin-bottom: 30px;">
            <h3 style="margin-top: 0; margin-bottom: 20px;">🔍 Filtres de recherche</h3>
            <form action="${pageContext.request.contextPath}/billets" method="get">
                <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 15px; align-items: end;">
                    <div>
                        <label for="dateHeure" style="display: block; margin-bottom: 5px; font-weight: 500;">Date/Heure exacte</label>
                        <input type="datetime-local" 
                               id="dateHeure" 
                               name="dateHeure" 
                               value="${dateHeure}" 
                               style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 4px;">
                    </div>
                    <div>
                        <label for="idVehicule" style="display: block; margin-bottom: 5px; font-weight: 500;">Véhicule</label>
                        <select id="idVehicule" 
                                name="idVehicule" 
                                style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 4px;">
                            <option value="">Tous les véhicules</option>
                            <c:forEach items="${vehicules}" var="vehicule">
                                <option value="${vehicule.idVehicule}" 
                                        ${idVehicule == vehicule.idVehicule ? 'selected' : ''}>
                                    ${vehicule.immatriculation} - ${vehicule.modeleVehicule.libelle}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    <div style="display: flex; gap: 10px;">
                        <button type="submit" 
                                style="padding: 8px 20px; background-color: #007bff; color: white; border: none; border-radius: 4px; cursor: pointer; font-weight: 500;">
                            Filtrer
                        </button>
                        <a href="${pageContext.request.contextPath}/billets" 
                           style="padding: 8px 20px; background-color: #6c757d; color: white; border: none; border-radius: 4px; text-decoration: none; display: inline-block; font-weight: 500;">
                            Réinitialiser
                        </a>
                    </div>
                </div>
            </form>
        </div>
        
        <div class="stats-cards">
            <div class="stat-card">
                <h3>Total Billets</h3>
                <div class="value">${billets.size()}</div>
            </div>
            <div class="stat-card" style="border-left-color: #28a745;">
                <h3>Billets Confirmés</h3>
                <div class="value">
                    <c:set var="confirmes" value="0"/>
                    <c:forEach items="${billets}" var="billet">
                        <c:if test="${billet.statutBillet.libelle == 'Confirmé'}">
                            <c:set var="confirmes" value="${confirmes + 1}"/>
                        </c:if>
                    </c:forEach>
                    ${confirmes}
                </div>
            </div>
            <div class="stat-card" style="border-left-color: #ffc107;">
                <h3>Revenus Total</h3>
                <div class="value">
                    <c:set var="total" value="0"/>
                    <c:forEach items="${billets}" var="billet">
                        <c:set var="total" value="${total + billet.montant}"/>
                    </c:forEach>
                    ${total} Ar
                </div>
            </div>
        </div>
        
        <c:choose>
            <c:when test="${not empty billets}">
                <table class="billets-table">
                    <thead>
                        <tr>
                            <th>N° Billet</th>
                            <th>Client</th>
                            <th>Trajet</th>
                            <th>Date Voyage</th>
                            <th>Place</th>
                            <th>Montant</th>
                            <th>Statut</th>
                            <th>Date Achat</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${billets}" var="billet">
                            <tr>
                                <td><strong>#${billet.idBillet}</strong></td>
                                <td>
                                    ${billet.client.nom}<br>
                                    <small style="color: #666;">${billet.client.telephone}</small>
                                </td>
                                <td class="route-info">
                                    ${billet.voyage.trajet.gareDepart.nom}
                                    <span class="route-arrow">→</span>
                                    ${billet.voyage.trajet.gareArrivee.nom}
                                </td>
                                <td>
                                    ${billet.voyage.dateVoyage.toLocalDate()}<br>
                                    <small style="color: #666;">${billet.voyage.dateVoyage.toLocalTime()}</small>
                                </td>
                                <td><strong>${billet.place.numero}</strong></td>
                                <td><strong>${billet.montant} Ar</strong></td>
                                <td>
                                    <c:choose>
                                        <c:when test="${billet.statutBillet.libelle == 'Confirmé'}">
                                            <span class="badge badge-success">${billet.statutBillet.libelle}</span>
                                        </c:when>
                                        <c:when test="${billet.statutBillet.libelle == 'En attente'}">
                                            <span class="badge badge-warning">${billet.statutBillet.libelle}</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge badge-danger">${billet.statutBillet.libelle}</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    ${billet.dateAchat.toLocalDate()}<br>
                                    <small style="color: #666;">${billet.dateAchat.toLocalTime()}</small>
                                </td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/billets/${billet.idBillet}/details" 
                                       class="btn-view">
                                        Voir
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <div class="no-results">
                    <p>Aucun billet enregistré.</p>
                </div>
            </c:otherwise>
        </c:choose>
        
        <div style="margin-top: 30px;">
            <a href="${pageContext.request.contextPath}/voyages" 
               style="padding: 10px 20px; background-color: #28a745; color: white; text-decoration: none; border-radius: 4px; display: inline-block;">
                Acheter un nouveau billet
            </a>
        </div>
    </div>
</body>
</html>
