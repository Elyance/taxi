<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Informations Client - Achat de Billet</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-style.css">
    <style>
        .container {
            max-width: 800px;
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
        
        .form-container {
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        
        .form-section {
            margin-bottom: 30px;
            padding: 20px;
            background: #f9f9f9;
            border-radius: 8px;
            border: 2px solid #e0e0e0;
        }
        
        .form-section.active {
            border-color: #007bff;
            background: #f0f8ff;
        }
        
        .section-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 15px;
            color: #333;
        }
        
        .form-group {
            margin-bottom: 15px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: 500;
            color: #555;
        }
        
        .form-group input,
        .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }
        
        .form-group input:focus,
        .form-group select:focus {
            outline: none;
            border-color: #007bff;
        }
        
        .radio-group {
            display: flex;
            gap: 20px;
            margin-bottom: 20px;
        }
        
        .radio-option {
            display: flex;
            align-items: center;
            gap: 8px;
        }
        
        .radio-option input[type="radio"] {
            width: auto;
        }
        
        .btn-submit {
            width: 100%;
            padding: 12px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 20px;
        }
        
        .btn-submit:hover {
            background-color: #218838;
        }
        
        .info-box {
            background: #e7f3ff;
            padding: 15px;
            border-radius: 4px;
            border-left: 4px solid #007bff;
            margin-bottom: 20px;
        }
        
        .info-box p {
            margin: 5px 0;
            color: #333;
        }
        
        .hidden {
            display: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <a href="javascript:history.back()" class="back-link">
            ← Retour à la sélection de place
        </a>
        
        <h1>Informations Client</h1>
        
        <div class="form-container">
            <div class="info-box">
                <p><strong>Voyage #${idVoyage}</strong></p>
                <p><strong>Place sélectionnée : ${idPlace}</strong></p>
            </div>
            
            <form action="${pageContext.request.contextPath}/billets/create" method="post" id="billetForm">
                <input type="hidden" name="idVoyage" value="${idVoyage}">
                <input type="hidden" name="idPlace" value="${idPlace}">
                
                <div class="radio-group">
                    <div class="radio-option">
                        <input type="radio" id="clientExistant" name="typeClient" value="existant" checked>
                        <label for="clientExistant">Client existant</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="nouveauClient" name="typeClient" value="nouveau">
                        <label for="nouveauClient">Nouveau client</label>
                    </div>
                </div>
                
                <!-- Section Client Existant -->
                <div class="form-section active" id="sectionExistant">
                    <div class="section-title">Sélectionner un client existant</div>
                    
                    <div class="form-group">
                        <label for="selectClient">Choisir un client :</label>
                        <select id="selectClient" name="idClient">
                            <option value="">-- Sélectionner un client --</option>
                            <c:forEach items="${clients}" var="client">
                                <option value="${client.idClient}">
                                    ${client.nom} - ${client.telephone} (ID: ${client.idClient})
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="inputIdClient">Ou entrer l'ID du client :</label>
                        <input type="number" id="inputIdClient" name="idClientManuel" 
                               placeholder="Entrer l'ID du client">
                    </div>
                </div>
                
                <!-- Section Nouveau Client -->
                <div class="form-section hidden" id="sectionNouveau">
                    <div class="section-title">Créer un nouveau client</div>
                    
                    <div class="form-group">
                        <label for="nomClient">Nom complet <span style="color: red;">*</span></label>
                        <input type="text" id="nomClient" name="nomClient" 
                               placeholder="Nom du client">
                    </div>
                    
                    <div class="form-group">
                        <label for="telephoneClient">Téléphone <span style="color: red;">*</span></label>
                        <input type="text" id="telephoneClient" name="telephoneClient" 
                               placeholder="Numéro de téléphone">
                    </div>
                </div>
                
                <!-- Montant du billet -->
                <div class="form-group">
                    <label for="montant">Montant du billet (Ar) <span style="color: red;">*</span></label>
                    <input type="number" id="montant" name="montant" 
                           step="0.01" value="${montant}" readonly 
                           style="background-color: #f5f5f5; cursor: not-allowed;">
                    <small style="color: #666; font-size: 12px;">Le montant est déterminé par le tarif du trajet</small>
                </div>
                
                <button type="submit" class="btn-submit">Confirmer l'achat</button>
            </form>
        </div>
    </div>
    
    <script>
        // Gestion du toggle entre client existant et nouveau
        const radioExistant = document.getElementById('clientExistant');
        const radioNouveau = document.getElementById('nouveauClient');
        const sectionExistant = document.getElementById('sectionExistant');
        const sectionNouveau = document.getElementById('sectionNouveau');
        const selectClient = document.getElementById('selectClient');
        const inputIdClient = document.getElementById('inputIdClient');
        const nomClient = document.getElementById('nomClient');
        const telephoneClient = document.getElementById('telephoneClient');
        
        radioExistant.addEventListener('change', function() {
            if (this.checked) {
                sectionExistant.classList.add('active');
                sectionExistant.classList.remove('hidden');
                sectionNouveau.classList.remove('active');
                sectionNouveau.classList.add('hidden');
                
                // Rendre les champs du nouveau client optionnels
                nomClient.removeAttribute('required');
                telephoneClient.removeAttribute('required');
            }
        });
        
        radioNouveau.addEventListener('change', function() {
            if (this.checked) {
                sectionNouveau.classList.add('active');
                sectionNouveau.classList.remove('hidden');
                sectionExistant.classList.remove('active');
                sectionExistant.classList.add('hidden');
                
                // Rendre les champs du nouveau client obligatoires
                nomClient.setAttribute('required', 'required');
                telephoneClient.setAttribute('required', 'required');
                
                // Réinitialiser la sélection
                selectClient.value = '';
                inputIdClient.value = '';
            }
        });
        
        // Synchroniser le select et l'input manuel
        selectClient.addEventListener('change', function() {
            inputIdClient.value = this.value;
        });
        
        inputIdClient.addEventListener('input', function() {
            selectClient.value = this.value;
        });
        
        // Validation avant soumission
        document.getElementById('billetForm').addEventListener('submit', function(e) {
            const typeClient = document.querySelector('input[name="typeClient"]:checked').value;
            
            if (typeClient === 'existant') {
                const idClient = selectClient.value || inputIdClient.value;
                if (!idClient) {
                    e.preventDefault();
                    alert('Veuillez sélectionner ou entrer l\'ID d\'un client');
                    return;
                }
                // Nettoyer les champs du nouveau client
                nomClient.removeAttribute('name');
                telephoneClient.removeAttribute('name');
                
                // S'assurer que idClient est bien envoyé
                if (!selectClient.value) {
                    selectClient.value = inputIdClient.value;
                }
            } else {
                // Nettoyer le champ idClient pour nouveau client
                selectClient.removeAttribute('name');
                inputIdClient.removeAttribute('name');
            }
        });
    </script>
</body>
</html>
