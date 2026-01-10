<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Détails du Billet</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-style.css">
    <style>
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
        }
        
        .success-message {
            background: #d4edda;
            color: #155724;
            padding: 15px;
            border-radius: 8px;
            border-left: 4px solid #28a745;
            margin-bottom: 30px;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .success-icon {
            font-size: 24px;
        }
        
        .ticket {
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
            overflow: hidden;
            margin-bottom: 30px;
        }
        
        .ticket-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 25px;
            text-align: center;
        }
        
        .ticket-header h1 {
            margin: 0 0 10px 0;
            font-size: 28px;
        }
        
        .ticket-number {
            font-size: 16px;
            opacity: 0.9;
        }
        
        .ticket-body {
            padding: 30px;
        }
        
        .info-section {
            margin-bottom: 25px;
        }
        
        .info-section-title {
            font-size: 12px;
            text-transform: uppercase;
            color: #888;
            margin-bottom: 8px;
            font-weight: 600;
            letter-spacing: 0.5px;
        }
        
        .info-section-content {
            font-size: 18px;
            font-weight: bold;
            color: #333;
        }
        
        .info-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 25px;
        }
        
        .divider {
            border-top: 2px dashed #e0e0e0;
            margin: 25px 0;
        }
        
        .price-section {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
            margin-top: 20px;
        }
        
        .price-label {
            font-size: 14px;
            color: #666;
            margin-bottom: 5px;
        }
        
        .price-amount {
            font-size: 32px;
            font-weight: bold;
            color: #28a745;
        }
        
        .actions {
            display: flex;
            gap: 15px;
            margin-top: 30px;
        }
        
        .btn {
            flex: 1;
            padding: 12px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            display: inline-block;
        }
        
        .btn-primary {
            background-color: #007bff;
            color: white;
        }
        
        .btn-primary:hover {
            background-color: #0056b3;
        }
        
        .btn-secondary {
            background-color: #6c757d;
            color: white;
        }
        
        .btn-secondary:hover {
            background-color: #545b62;
        }
        
        .route-arrow {
            display: inline-block;
            margin: 0 10px;
            color: #667eea;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="success-message">
            <span class="success-icon">✓</span>
            <div>
                <strong>Billet créé avec succès !</strong>
                <p style="margin: 5px 0 0 0;">Votre réservation a été confirmée.</p>
            </div>
        </div>
        
        <div class="ticket">
            <div class="ticket-header">
                <h1>🎫 BILLET DE VOYAGE</h1>
                <div class="ticket-number">Billet N° ${billet.idBillet}</div>
            </div>
            
            <div class="ticket-body">
                <!-- Informations du trajet -->
                <div class="info-section">
                    <div class="info-section-title">Trajet</div>
                    <div class="info-section-content">
                        ${billet.voyage.trajet.gareDepart.nom}
                        <span class="route-arrow">→</span>
                        ${billet.voyage.trajet.gareArrivee.nom}
                    </div>
                </div>
                
                <div class="divider"></div>
                
                <!-- Informations de voyage -->
                <div class="info-grid">
                    <div class="info-section">
                        <div class="info-section-title">Date & Heure</div>
                        <div class="info-section-content">
                            ${billet.voyage.dateVoyage.toLocalDate()}<br>
                            <small style="font-size: 16px;">${billet.voyage.dateVoyage.toLocalTime()}</small>
                        </div>
                    </div>
                    
                    <div class="info-section">
                        <div class="info-section-title">Place</div>
                        <div class="info-section-content">${billet.place.numero}</div>
                    </div>
                </div>
                
                <div class="divider"></div>
                
                <!-- Informations du véhicule et chauffeur -->
                <div class="info-grid">
                    <div class="info-section">
                        <div class="info-section-title">Véhicule</div>
                        <div class="info-section-content">
                            ${billet.voyage.vehicule.modeleVehicule.libelle}<br>
                            <small style="font-size: 14px;">${billet.voyage.vehicule.immatriculation}</small>
                        </div>
                    </div>
                    
                    <div class="info-section">
                        <div class="info-section-title">Chauffeur</div>
                        <div class="info-section-content">
                            ${billet.voyage.chauffeur.nom} ${billet.voyage.chauffeur.prenom}<br>
                            <small style="font-size: 14px;">${billet.voyage.chauffeur.telephone}</small>
                        </div>
                    </div>
                </div>
                
                <div class="divider"></div>
                
                <!-- Informations du client -->
                <div class="info-section">
                    <div class="info-section-title">Passager</div>
                    <div class="info-section-content">
                        ${billet.client.nom}<br>
                        <small style="font-size: 14px;">${billet.client.telephone}</small>
                    </div>
                </div>
                
                <!-- Prix -->
                <div class="price-section">
                    <div class="price-label">Montant payé</div>
                    <div class="price-amount">${billet.montant} Ar</div>
                </div>
                
                <!-- Date d'achat -->
                <div class="info-section" style="text-align: center; margin-top: 20px;">
                    <div class="info-section-title">Date d'achat</div>
                    <div style="font-size: 14px; color: #666;">
                        ${billet.dateAchat.toLocalDate()} à ${billet.dateAchat.toLocalTime()}
                    </div>
                </div>
                
                <!-- Informations de paiement -->
                <c:if test="${not empty paiement}">
                    <div class="divider"></div>
                    <div class="info-section" style="background: #f0fff4; padding: 15px; border-radius: 8px; border: 2px solid #28a745;">
                        <div class="info-section-title" style="color: #28a745;">✓ Paiement effectué</div>
                        <div class="info-grid">
                            <div>
                                <div style="font-size: 12px; color: #666;">Montant payé</div>
                                <div style="font-size: 16px; font-weight: bold; color: #28a745;">${paiement.montant} Ar</div>
                            </div>
                            <div>
                                <div style="font-size: 12px; color: #666;">Date de paiement</div>
                                <div style="font-size: 14px; color: #333;">${paiement.datePaiement.toLocalDate()}</div>
                            </div>
                        </div>
                        <div style="margin-top: 10px; text-align: center;">
                            <small style="color: #666;">Transaction N° ${paiement.idPaiement}</small>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
        
        <div class="actions">
            <a href="${pageContext.request.contextPath}/voyages" class="btn btn-primary">
                Nouveaux voyages
            </a>
            <a href="javascript:window.print()" class="btn btn-secondary">
                Imprimer le billet
            </a>
        </div>
    </div>
</body>
</html>
