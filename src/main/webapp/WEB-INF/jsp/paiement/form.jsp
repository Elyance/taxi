<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div style="margin-bottom: 20px;">
    <nav class="breadcrumb">
        <a href="<c:url value='/dashboard'/>" class="breadcrumb-item">Tableau de Bord</a>
        <span class="breadcrumb-separator"><i class="fas fa-chevron-right"></i></span>
        <a href="<c:url value='/voyage/list'/>" class="breadcrumb-item">Voyages</a>
        <span class="breadcrumb-separator"><i class="fas fa-chevron-right"></i></span>
        <span class="breadcrumb-item active">Paiement</span>
    </nav>
</div>

<div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 30px;">
    <h2 style="font-size: 24px; font-weight: 700; color: #1f2937;">
        <i class="fas fa-credit-card"></i> Formulaire de Paiement
    </h2>
    <a href="<c:url value='/voyage/list'/>" class="btn-secondary" style="text-decoration: none; display: inline-flex; align-items: center;">
        <i class="fas fa-arrow-left"></i> Retour
    </a>
</div>

<c:if test="${not empty error}">
    <div style="background: #fee2e2; border: 1px solid #fca5a5; color: #991b1b; padding: 15px; border-radius: 6px; margin-bottom: 20px;">
        <i class="fas fa-exclamation-circle"></i> ${error}
    </div>
</c:if>

<div style="display: grid; grid-template-columns: 1fr 1fr; gap: 30px;">
    <!-- Colonne gauche: Résumé de la commande -->
    <div style="background: white; padding: 30px; border-radius: 8px; border: 2px solid #e5e7eb;">
        <h3 style="font-size: 16px; font-weight: 700; color: #1f2937; margin-bottom: 20px;">
            <i class="fas fa-receipt"></i> Résumé de la Commande
        </h3>

        <div style="background: #f9fafb; padding: 20px; border-radius: 6px;">
            <div style="margin-bottom: 15px; padding-bottom: 15px; border-bottom: 1px solid #e5e7eb;">
                <p style="margin: 0; color: #6b7280; font-size: 14px;">N° Commande</p>
                <p style="margin: 8px 0 0 0; color: #1f2937; font-size: 18px; font-weight: 700;">#${commande.idCommande}</p>
            </div>

            <div style="margin-bottom: 15px; padding-bottom: 15px; border-bottom: 1px solid #e5e7eb;">
                <p style="margin: 0; color: #6b7280; font-size: 14px;">Client</p>
                <p style="margin: 8px 0 0 0; color: #1f2937; font-size: 16px; font-weight: 600;">${commande.client.nom}</p>
            </div>

            <div style="margin-bottom: 15px; padding-bottom: 15px; border-bottom: 1px solid #e5e7eb;">
                <p style="margin: 0; color: #6b7280; font-size: 14px;">Téléphone</p>
                <p style="margin: 8px 0 0 0; color: #1f2937; font-size: 16px;">${commande.client.telephone}</p>
            </div>

            <div style="margin-bottom: 15px; padding-bottom: 15px; border-bottom: 1px solid #e5e7eb;">
                <p style="margin: 0; color: #6b7280; font-size: 14px;">Date de Commande</p>
                <p style="margin: 8px 0 0 0; color: #1f2937; font-size: 16px;">${commande.dateCommande}</p>
            </div>

            <div style="background: #dbeafe; padding: 15px; border-radius: 6px; border-left: 4px solid #3b82f6;">
                <p style="margin: 0; color: #0c4a6e; font-size: 14px;">Montant Total</p>
                <p style="margin: 8px 0 0 0; color: #1e40af; font-size: 24px; font-weight: 700;">
                    <c:out value="${commande.montantTotal}"/> FCFA
                </p>
            </div>
        </div>
    </div>

    <!-- Colonne droite: Formulaire de paiement -->
    <div style="background: white; padding: 30px; border-radius: 8px; border: 2px solid #e5e7eb;">
        <h3 style="font-size: 16px; font-weight: 700; color: #1f2937; margin-bottom: 20px;">
            <i class="fas fa-money-bill-wave"></i> Détails du Paiement
        </h3>

        <form id="paiementForm" action="<c:url value='/paiement/process'/>" method="POST" style="display: flex; flex-direction: column; gap: 20px;">
            <!-- Champ caché pour l'ID de la commande -->
            <input type="hidden" name="commandeId" value="${commande.idCommande}">

            <!-- Montant du paiement -->
            <div>
                <label style="display: block; font-weight: 600; color: #1f2937; margin-bottom: 8px;">
                    Montant à Payer (FCFA) <span style="color: #dc2626;">*</span>
                </label>
                <input type="number" name="montant" id="montantInput" 
                       value="${montantParDefaut}" 
                       step="100" 
                       min="0"
                       style="width: 100%; padding: 12px; border: 1px solid #d1d5db; border-radius: 6px; font-size: 14px; box-sizing: border-box;"
                       required>
                <p style="margin: 8px 0 0 0; color: #6b7280; font-size: 13px;">
                    (Par défaut: <strong><c:out value="${montantParDefaut}"/></strong> FCFA)
                </p>
            </div>

            <!-- Mode de paiement -->
            <div>
                <label style="display: block; font-weight: 600; color: #1f2937; margin-bottom: 8px;">
                    Mode de Paiement <span style="color: #dc2626;">*</span>
                </label>
                <select name="modePaiement" style="width: 100%; padding: 12px; border: 1px solid #d1d5db; border-radius: 6px; font-size: 14px;" required>
                    <option value="">-- Choisir un mode de paiement --</option>
                    <c:forEach var="mode" items="${modesPaiement}">
                        <option value="${mode.libelle}">${mode.libelle}</option>
                    </c:forEach>
                </select>
            </div>

            <!-- Affichage du résumé -->
            <div style="background: #f0fdf4; padding: 15px; border-radius: 6px; border-left: 4px solid #10b981;">
                <p style="margin: 0; color: #15803d; font-size: 14px;">Montant saisi:</p>
                <p style="margin: 8px 0 0 0; color: #15803d; font-size: 20px; font-weight: 700;">
                    <span id="montantAffiche"><c:out value="${montantParDefaut}"/></span> FCFA
                </p>
            </div>

            <!-- Boutons -->
            <div style="display: flex; gap: 15px; margin-top: 20px;">
                <a href="<c:url value='/voyage/list'/>" class="btn-secondary" style="text-decoration: none; display: inline-flex; align-items: center; flex: 1; justify-content: center;">
                    <i class="fas fa-times"></i> Annuler
                </a>
                <button type="submit" class="btn-primary" style="flex: 1; display: flex; align-items: center; justify-content: center;">
                    <i class="fas fa-check"></i> Confirmer le Paiement
                </button>
            </div>
        </form>
    </div>
</div>

<script>
    // Mettre à jour l'affichage du montant en temps réel
    document.getElementById('montantInput').addEventListener('input', function() {
        const montant = this.value;
        if (montant && !isNaN(montant) && parseFloat(montant) > 0) {
            document.getElementById('montantAffiche').textContent = parseFloat(montant).toLocaleString('fr-FR');
        } else {
            document.getElementById('montantAffiche').textContent = '0';
        }
    });

    // Validation du formulaire
    document.getElementById('paiementForm').addEventListener('submit', function(e) {
        const montant = document.getElementById('montantInput').value;
        const modePaiement = document.querySelector('select[name="modePaiement"]').value;

        if (!montant || parseFloat(montant) <= 0) {
            e.preventDefault();
            alert('Veuillez entrer un montant valide');
            return;
        }

        if (!modePaiement) {
            e.preventDefault();
            alert('Veuillez sélectionner un mode de paiement');
            return;
        }
    });
</script>
