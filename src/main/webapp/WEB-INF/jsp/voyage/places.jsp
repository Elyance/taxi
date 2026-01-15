<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div style="margin-bottom: 20px;">
    <nav class="breadcrumb">
        <a href="<c:url value='/dashboard'/>" class="breadcrumb-item">Tableau de Bord</a>
        <span class="breadcrumb-separator"><i class="fas fa-chevron-right"></i></span>
        <a href="<c:url value='/voyage/list'/>" class="breadcrumb-item">Voyages</a>
        <span class="breadcrumb-separator"><i class="fas fa-chevron-right"></i></span>
        <span class="breadcrumb-item active">Sélectionner une Place</span>
    </nav>
</div>

<div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 30px;">
    <h2 style="font-size: 24px; font-weight: 700; color: #1f2937;">
        <i class="fas fa-chair"></i> Sélectionner des Places - ${selectedVoyage.trajet.gareDepart.nom} → ${selectedVoyage.trajet.gareArrivee.nom}
    </h2>
    <a href="<c:url value='/voyage/list'/>" class="btn-secondary" style="text-decoration: none; display: inline-flex; align-items: center;">
        <i class="fas fa-arrow-left"></i> Retour
    </a>
</div>

<div style="background: #f3f4f6; padding: 20px; border-radius: 8px; margin-bottom: 30px;">
    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 30px;">
        <div>
            <h3 style="font-size: 16px; font-weight: 700; color: #1f2937; margin-bottom: 15px;">Informations du Voyage</h3>
            <div style="background: white; padding: 15px; border-radius: 6px; border-left: 4px solid #3b82f6;">
                <p style="margin: 8px 0;"><strong>Chauffeur:</strong> ${selectedVoyage.chauffeur.nom} ${selectedVoyage.chauffeur.prenom}</p>
                <p style="margin: 8px 0;"><strong>Véhicule:</strong> ${selectedVoyage.vehicule.immatriculation} (${selectedVoyage.vehicule.nombrePlace} places)</p>
                <p style="margin: 8px 0;"><strong>Date:</strong> ${selectedVoyage.dateVoyage}</p>
                <p style="margin: 8px 0;"><strong>Tarif:</strong> <span id="priceTarif">${tarif}</span> FCFA par place</p>
            </div>
        </div>
        <div>
            <h3 style="font-size: 16px; font-weight: 700; color: #1f2937; margin-bottom: 15px;">Légende</h3>
            <div style="background: white; padding: 15px; border-radius: 6px;">
                <p style="margin: 8px 0;"><span style="display: inline-block; width: 20px; height: 20px; background: #d1d5db; border-radius: 4px; margin-right: 8px;"></span>Place indisponible</p>
                <p style="margin: 8px 0;"><span style="display: inline-block; width: 20px; height: 20px; background: #10b981; border-radius: 4px; margin-right: 8px;"></span>Place disponible</p>
                <p style="margin: 8px 0;"><span style="display: inline-block; width: 20px; height: 20px; background: #3b82f6; border-radius: 4px; margin-right: 8px;"></span>Place sélectionnée</p>
            </div>
        </div>
    </div>
</div>

<div style="display: grid; grid-template-columns: 1fr 1fr; gap: 30px;">
    <!-- Colonne gauche: Plan du véhicule -->
    <div style="background: white; padding: 30px; border-radius: 8px; border: 2px solid #e5e7eb;">
        <h3 style="font-size: 16px; font-weight: 700; color: #1f2937; margin-bottom: 20px; text-align: center;">
            <i class="fas fa-bus"></i> Plan du Véhicule
        </h3>

        <div style="display: flex; justify-content: center; margin-bottom: 30px;">
            <div style="background: linear-gradient(to right, #d1d5db, #9ca3af); padding: 15px 20px; border-radius: 8px 8px 0 0; width: fit-content; color: white; font-weight: 700; text-align: center;">
                AVANT DU VÉHICULE
            </div>
        </div>

        <div style="display: grid; grid-template-columns: repeat(4, 1fr); gap: 12px; max-width: 600px; margin: 0 auto;">
            <c:forEach var="place" items="${allPlaces}">
                <c:set var="placeNum" value="${String.format('%03d', place.numeroPlace)}"/>
                <button type="button" class="place-btn" 
                        data-place-id="${place.numeroPlace}"
                        <c:if test="${place.reserved}">disabled</c:if>
                        style="padding: 15px 10px; border: 2px solid <c:if test="${place.reserved}">#d1d5db</c:if><c:if test="${!place.reserved}">#d1d5db</c:if>; background: <c:if test="${place.reserved}">#d1d5db</c:if><c:if test="${!place.reserved}">#10b981</c:if>; color: <c:if test="${place.reserved}">#6b7280</c:if><c:if test="${!place.reserved}">white</c:if>; border-radius: 6px; cursor: <c:if test="${place.reserved}">not-allowed</c:if><c:if test="${!place.reserved}">pointer</c:if>; font-weight: 700; font-size: 14px; transition: all 0.3s ease; display: flex; flex-direction: column; align-items: center; gap: 4px; opacity: <c:if test="${place.reserved}">0.6</c:if><c:if test="${!place.reserved}">1</c:if>;"
                        onmouseover="<c:if test="${!place.reserved}">this.style.opacity='0.8'</c:if>"
                        onmouseout="<c:if test="${!place.reserved}">this.style.opacity='1'</c:if>">
                    <i class="fas fa-chair" style="font-size: 16px;"></i>
                    P${placeNum}
                </button>
            </c:forEach>
        </div>

        <div style="margin-top: 25px; padding: 15px; background: #f3f4f6; border-radius: 6px; text-align: center;">
            <p style="margin: 0; color: #6b7280; font-size: 14px;">Places sélectionnées: <strong id="selectedCount">0</strong></p>
            <p style="margin: 8px 0 0 0; color: #1f2937; font-size: 18px; font-weight: 700;">Total: <span id="totalAmount">0</span> FCFA</p>
        </div>
    </div>

    <!-- Colonne droite: Formulaire client -->
    <div id="clientForm" style="display: none; background: white; padding: 30px; border-radius: 8px; border: 2px solid #e5e7eb;">
        <h3 style="font-size: 16px; font-weight: 700; color: #1f2937; margin-bottom: 20px;">
            <i class="fas fa-user"></i> Informations du Client
        </h3>

        <form id="billetForm" action="<c:url value='/billet/create'/>" method="POST" style="display: flex; flex-direction: column; gap: 20px;">
            <!-- Champs cachés pour l'ID du voyage et les places -->
            <input type="hidden" name="voyageId" value="${selectedVoyage.idVoyage}">
            <input type="hidden" name="selectedPlaces" id="selectedPlacesInput">
            <input type="hidden" name="totalAmount" id="totalAmountInput">

            <!-- Sélection type de client -->
            <div style="border-bottom: 2px solid #e5e7eb; padding-bottom: 20px;">
                <label style="display: flex; align-items: center; cursor: pointer; margin-bottom: 15px;">
                    <input type="radio" name="clientType" value="existing" checked style="margin-right: 10px; cursor: pointer;">
                    <span style="font-weight: 600; color: #1f2937;">Client Existant</span>
                </label>

                <label style="display: flex; align-items: center; cursor: pointer;">
                    <input type="radio" name="clientType" value="new" style="margin-right: 10px; cursor: pointer;">
                    <span style="font-weight: 600; color: #1f2937;">Nouveau Client</span>
                </label>
            </div>

            <!-- Section: Client existant -->
            <div id="existingClientSection">
                <label style="display: block; font-weight: 600; color: #1f2937; margin-bottom: 8px;">Sélectionner un Client</label>
                <select name="clientId" id="clientSelect" style="width: 100%; padding: 12px; border: 1px solid #d1d5db; border-radius: 6px; font-size: 14px;">
                    <option value="">-- Choisir un client --</option>
                    <c:forEach var="client" items="${clients}">
                        <option value="${client.idClient}">${client.nom} - ${client.telephone}</option>
                    </c:forEach>
                </select>
            </div>

            <!-- Section: Nouveau client -->
            <div id="newClientSection" style="display: none; border: 2px solid #e5e7eb; padding: 20px; border-radius: 6px; background: #f9fafb;">
                <h4 style="font-weight: 700; color: #1f2937; margin-bottom: 15px; margin-top: 0;">Détails du Nouveau Client</h4>
                
                <div style="margin-bottom: 15px;">
                    <label style="display: block; font-weight: 600; color: #1f2937; margin-bottom: 8px;">Nom</label>
                    <input type="text" name="newClientNom" style="width: 100%; padding: 12px; border: 1px solid #d1d5db; border-radius: 6px; font-size: 14px; box-sizing: border-box;">
                </div>

                <div>
                    <label style="display: block; font-weight: 600; color: #1f2937; margin-bottom: 8px;">Téléphone</label>
                    <input type="tel" name="newClientTelephone" style="width: 100%; padding: 12px; border: 1px solid #d1d5db; border-radius: 6px; font-size: 14px; box-sizing: border-box;">
                </div>
            </div>

            <!-- Boutons -->
            <div style="display: flex; gap: 15px; margin-top: 20px;">
                <a href="<c:url value='/voyage/list'/>" class="btn-secondary" style="text-decoration: none; display: inline-flex; align-items: center; flex: 1; justify-content: center;">
                    <i class="fas fa-times"></i> Annuler
                </a>
                <button type="submit" class="btn-primary" id="submitBtn" disabled style="flex: 1; display: flex; align-items: center; justify-content: center;">
                    <i class="fas fa-check"></i> Confirmer l'Achat
                </button>
            </div>
        </form>
    </div>
</div>

<style>
    .place-btn:hover {
        transform: scale(1.05);
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
    }

    .place-btn.selected {
        background: #3b82f6 !important;
        border-color: #1e40af !important;
        color: white !important;
    }
</style>

<script>
    // Données du voyage
    const voyageData = {
        tarif: ${tarif}
    };

    // Array pour stocker les places sélectionnées
    let selectedPlaces = [];

    // Fonctionnalité de sélection multiple de places
    document.querySelectorAll('.place-btn').forEach(btn => {
        btn.addEventListener('click', function() {
            // Ne pas permettre de cliquer sur les places désactivées (réservées)
            if (this.disabled) {
                alert('Cette place est déjà réservée');
                return;
            }
            
            const placeId = parseInt(this.dataset.placeId);
            
            // Ajouter/retirer la place de la sélection
            if (this.classList.contains('selected')) {
                this.classList.remove('selected');
                selectedPlaces = selectedPlaces.filter(id => id !== placeId);
            } else {
                this.classList.add('selected');
                selectedPlaces.push(placeId);
            }
            
            // Mettre à jour l'affichage
            updateSelection();
        });
    });

    // Mise à jour de la sélection et du formulaire
    function updateSelection() {
        const count = selectedPlaces.length;
        const total = count * voyageData.tarif;
        
        // Mettre à jour le comptage et le total
        document.getElementById('selectedCount').textContent = count;
        document.getElementById('totalAmount').textContent = total.toLocaleString('fr-FR');
        document.getElementById('selectedPlacesInput').value = selectedPlaces.join(',');
        document.getElementById('totalAmountInput').value = total;
        
        // Afficher/masquer le formulaire client
        if (count > 0) {
            document.getElementById('clientForm').style.display = 'block';
            document.getElementById('submitBtn').disabled = false;
        } else {
            document.getElementById('clientForm').style.display = 'none';
            document.getElementById('submitBtn').disabled = true;
        }
    }

    // Gestion du type de client
    document.querySelectorAll('input[name="clientType"]').forEach(radio => {
        radio.addEventListener('change', function() {
            if (this.value === 'existing') {
                document.getElementById('existingClientSection').style.display = 'block';
                document.getElementById('newClientSection').style.display = 'none';
                document.getElementById('clientSelect').name = 'clientId';
                document.querySelectorAll('#newClientSection input').forEach(input => input.removeAttribute('required'));
            } else {
                document.getElementById('existingClientSection').style.display = 'none';
                document.getElementById('newClientSection').style.display = 'block';
                document.getElementById('clientSelect').name = '';
                document.querySelectorAll('#newClientSection input[name*="Nom"], #newClientSection input[name*="Telephone"]').forEach(input => input.setAttribute('required', 'required'));
            }
        });
    });

    // Validation du formulaire
    document.getElementById('billetForm').addEventListener('submit', function(e) {
        const clientType = document.querySelector('input[name="clientType"]:checked').value;
        
        if (clientType === 'existing' && !document.getElementById('clientSelect').value) {
            e.preventDefault();
            alert('Veuillez sélectionner un client existant');
            return;
        }
        
        if (clientType === 'new') {
            const nom = document.querySelector('input[name="newClientNom"]').value.trim();
            const telephone = document.querySelector('input[name="newClientTelephone"]').value.trim();
            
            if (!nom || !telephone) {
                e.preventDefault();
                alert('Veuillez remplir tous les champs obligatoires du nouveau client');
                return;
            }
        }
    });
</script>
