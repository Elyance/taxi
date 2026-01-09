<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des Voyages - Achat de Billet</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-style.css">
    <style>
        .container {
            max-width: 1200px;
            margin: 50px auto;
            padding: 20px;
        }
        
        h1 {
            color: #333;
            margin-bottom: 30px;
        }
        
        .filter-section {
            background: #f5f5f5;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 30px;
        }
        
        .filter-section form {
            display: flex;
            align-items: center;
            gap: 15px;
        }
        
        .filter-section label {
            font-weight: bold;
            color: #555;
        }
        
        .filter-section input[type="date"] {
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }
        
        .filter-section button {
            padding: 8px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }
        
        .filter-section button:hover {
            background-color: #0056b3;
        }
        
        .voyage-table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            border-radius: 8px;
            overflow: hidden;
        }
        
        .voyage-table th {
            background-color: #343a40;
            color: white;
            padding: 15px;
            text-align: left;
            font-weight: 600;
        }
        
        .voyage-table td {
            padding: 12px 15px;
            border-bottom: 1px solid #e0e0e0;
        }
        
        .voyage-table tr:last-child td {
            border-bottom: none;
        }
        
        .voyage-table tr:hover {
            background-color: #f8f9fa;
        }
        
        .btn-acheter {
            padding: 8px 16px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            font-weight: 500;
            text-decoration: none;
            display: inline-block;
        }
        
        .btn-acheter:hover {
            background-color: #218838;
        }
        
        .no-results {
            text-align: center;
            padding: 40px;
            color: #666;
            font-size: 16px;
        }
        
        .date-info {
            color: #666;
            margin-bottom: 15px;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Achat de Billet - Liste des Voyages</h1>
        
        <div class="filter-section">
            <form method="get" action="${pageContext.request.contextPath}/voyages">
                <label for="date">Date du voyage :</label>
                <input type="date" id="date" name="date" 
                       value="${dateRecherche}" 
                       required>
                <button type="submit">Rechercher</button>
            </form>
        </div>
        
        <c:if test="${not empty dateRecherche}">
            <p class="date-info">
                Affichage des voyages pour le : 
                <strong>${dateRecherche}</strong>
            </p>
        </c:if>
        
        <c:choose>
            <c:when test="${not empty voyages}">
                <table class="voyage-table">
                    <thead>
                        <tr>
                            <th>Trajet (Départ → Arrivée)</th>
                            <th>Véhicule</th>
                            <th>Chauffeur</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${voyages}" var="voyage">
                            <tr>
                                <td>
                                    <strong>${voyage.trajet.gareDepart.nom}</strong> → 
                                    <strong>${voyage.trajet.gareArrivee.nom}</strong>
                                    <br>
                                    <small style="color: #666;">
                                        ${voyage.dateVoyage.toLocalTime()}
                                    </small>
                                </td>
                                <td>
                                    <strong>${voyage.vehicule.modeleVehicule.libelle}</strong>
                                    <br>
                                    <small style="color: #666;">
                                        Immatriculation: ${voyage.vehicule.immatriculation}
                                    </small>
                                </td>
                                <td>
                                    <strong>${voyage.chauffeur.nom} ${voyage.chauffeur.prenom}</strong>
                                    <br>
                                    <small style="color: #666;">
                                        Tél: ${voyage.chauffeur.telephone}
                                    </small>
                                </td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/voyages/${voyage.idVoyage}/places" 
                                       class="btn-acheter">
                                        Acheter un billet
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <div class="no-results">
                    <p>Aucun voyage trouvé pour cette date.</p>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>
