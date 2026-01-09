<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des Places - Achat de Billet</title>
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
        
        .back-link {
            display: inline-block;
            margin-bottom: 20px;
            color: #007bff;
            text-decoration: none;
            font-size: 14px;
        }
        
        .back-link:hover {
            text-decoration: underline;
        }
        
        .places-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
            gap: 15px;
            margin-top: 30px;
        }
        
        .place-card {
            background: white;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            padding: 20px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .place-card.disponible {
            border-color: #28a745;
            background-color: #f1f9f4;
        }
        
        .place-card.disponible:hover {
            background-color: #28a745;
            color: white;
            transform: translateY(-3px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }
        
        .place-card.occupe {
            border-color: #dc3545;
            background-color: #fef2f2;
            cursor: not-allowed;
            opacity: 0.6;
        }
        
        .place-card.reserve {
            border-color: #ffc107;
            background-color: #fffdf0;
            cursor: not-allowed;
            opacity: 0.8;
        }
        
        .place-numero {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        
        .place-statut {
            font-size: 12px;
            text-transform: uppercase;
            padding: 4px 8px;
            border-radius: 4px;
            display: inline-block;
        }
        
        .place-statut.disponible {
            background-color: #28a745;
            color: white;
        }
        
        .place-statut.occupe {
            background-color: #dc3545;
            color: white;
        }
        
        .place-statut.reserve {
            background-color: #ffc107;
            color: #333;
        }
        
        .legend {
            display: flex;
            gap: 20px;
            margin-bottom: 20px;
            padding: 15px;
            background: #f5f5f5;
            border-radius: 8px;
        }
        
        .legend-item {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 14px;
        }
        
        .legend-color {
            width: 20px;
            height: 20px;
            border-radius: 4px;
        }
        
        .legend-color.disponible {
            background-color: #28a745;
        }
        
        .legend-color.occupe {
            background-color: #dc3545;
        }
        
        .legend-color.reserve {
            background-color: #ffc107;
        }
        
        .no-results {
            text-align: center;
            padding: 40px;
            color: #666;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <div class="container">
        <a href="${pageContext.request.contextPath}/voyages" class="back-link">
            ← Retour à la liste des voyages
        </a>
        
        <h1>Sélection de la place - Voyage #${idVoyage}</h1>
        
        <div class="legend">
            <div class="legend-item">
                <div class="legend-color disponible"></div>
                <span>Disponible</span>
            </div>
            <div class="legend-item">
                <div class="legend-color reserve"></div>
                <span>Réservé</span>
            </div>
            <div class="legend-item">
                <div class="legend-color occupe"></div>
                <span>Occupé</span>
            </div>
        </div>
        
        <c:choose>
            <c:when test="${not empty places}">
                <div class="places-grid">
                    <c:forEach items="${places}" var="placeStatut">
                        <c:set var="statutClass" value="${placeStatut.statutPlace.libelle.toLowerCase()}" />
                        <div class="place-card ${statutClass}" 
                             onclick="${statutClass == 'disponible' ? 'selectPlace(\'' += placeStatut.place.numero += '\')' : ''}">
                            <div class="place-numero">${placeStatut.place.numero}</div>
                            <span class="place-statut ${statutClass}">${placeStatut.statutPlace.libelle}</span>
                        </div>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <div class="no-results">
                    <p>Aucune place trouvée pour ce voyage.</p>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
    
    <script>
        function selectPlace(numeroPlace) {
            alert('Place sélectionnée : ' + numeroPlace);
            // Ici vous pourrez rediriger vers une page de confirmation d'achat
        }
    </script>
</body>
</html>
