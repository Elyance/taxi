package com.example.taxi.service;

import com.example.taxi.entity.Paiement;
import com.example.taxi.entity.Commande;
import com.example.taxi.entity.ModePaiement;
import com.example.taxi.entity.StatutCommande;
import com.example.taxi.entity.Billet;
import com.example.taxi.entity.StatutBillet;
import com.example.taxi.repository.PaiementRepository;
import com.example.taxi.repository.ModePaiementRepository;
import com.example.taxi.repository.StatutCommandeRepository;
import com.example.taxi.repository.StatutBilletRepository;
import com.example.taxi.repository.BilletRepository;
import com.example.taxi.repository.DetailCommandeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Service
public class PaiementService {

    @Autowired
    private PaiementRepository paiementRepository;

    @Autowired
    private ModePaiementRepository modePaiementRepository;

    @Autowired
    private StatutCommandeRepository statutCommandeRepository;

    @Autowired
    private StatutBilletRepository statutBilletRepository;

    @Autowired
    private BilletRepository billetRepository;

    @Autowired
    private DetailCommandeRepository detailCommandeRepository;

    /**
     * Crée un paiement et met à jour les statuts de la commande et des billets
     */
    public Paiement createPaiement(Commande commande, BigDecimal montant, String modePaiementLibelle) throws Exception {
        if (commande == null) {
            throw new Exception("La commande est requise");
        }

        if (montant == null || montant.compareTo(BigDecimal.ZERO) <= 0) {
            throw new Exception("Le montant du paiement doit être supérieur à 0");
        }

        // Récupérer le mode de paiement
        ModePaiement modePaiement = getModePaiementByLibelle(modePaiementLibelle);
        if (modePaiement == null) {
            throw new Exception("Mode de paiement non trouvé: " + modePaiementLibelle);
        }

        // Créer le paiement
        Paiement paiement = new Paiement();
        paiement.setCommande(commande);
        paiement.setMontant(montant);
        paiement.setModePaiement(modePaiement);
        paiement.setDatePaiement(LocalDateTime.now());

        Paiement savedPaiement = paiementRepository.save(paiement);

        // Mettre à jour le statut de la commande à "CONFIRMÉE"
        StatutCommande statutConfirmee = getStatutCommandeByLibelle("CONFIRMÉE");
        if (statutConfirmee != null) {
            commande.setStatutCommande(statutConfirmee);
            // Pas besoin de re-sauvegarder, JPA gérera la relation
        }

        // Mettre à jour le statut des billets à "CONFIRMÉ"
        StatutBillet statutConfirme = getStatutBilletByLibelle("CONFIRMÉ");
        if (statutConfirme != null) {
            List<Billet> billetsDuCommande = getBilletsForCommande(commande.getIdCommande());
            for (Billet billet : billetsDuCommande) {
                billet.setStatutBillet(statutConfirme);
                billetRepository.save(billet);
            }
        }

        return savedPaiement;
    }

    /**
     * Récupère les billets associés à une commande via DetailCommande
     */
    public List<Billet> getBilletsForCommande(Long commandeId) {
        return detailCommandeRepository.findBilletsByCommandeId(commandeId);
    }

    /**
     * Récupère le voyageId d'une commande via ses billets
     */
    public Long getVoyageIdForCommande(Long commandeId) {
        List<Billet> billets = getBilletsForCommande(commandeId);
        if (!billets.isEmpty()) {
            return billets.get(0).getVoyage().getIdVoyage();
        }
        return null;
    }

    /**
     * Récupère un mode de paiement par son libellé
     */
    public ModePaiement getModePaiementByLibelle(String libelle) {
        return modePaiementRepository.findByLibelle(libelle);
    }

    /**
     * Récupère un statut de commande par son libellé
     */
    public StatutCommande getStatutCommandeByLibelle(String libelle) {
        return statutCommandeRepository.findByLibelle(libelle);
    }

    /**
     * Récupère un statut de billet par son libellé
     */
    public StatutBillet getStatutBilletByLibelle(String libelle) {
        return statutBilletRepository.findByLibelle(libelle);
    }

    public Paiement getPaiementById(Long id) {
        return paiementRepository.findById(id).orElse(null);
    }

    public List<Paiement> getAllPaiements() {
        return paiementRepository.findAll();
    }

    public List<Paiement> getPaiementsForCommande(Long commandeId) {
        return paiementRepository.findByCommandeId(commandeId);
    }
}
