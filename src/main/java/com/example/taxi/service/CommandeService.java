package com.example.taxi.service;

import com.example.taxi.entity.Commande;
import com.example.taxi.entity.DetailCommande;
import com.example.taxi.entity.Client;
import com.example.taxi.entity.Billet;
import com.example.taxi.entity.StatutCommande;
import com.example.taxi.repository.CommandeRepository;
import com.example.taxi.repository.DetailCommandeRepository;
import com.example.taxi.repository.StatutCommandeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Service
public class CommandeService {

    @Autowired
    private CommandeRepository commandeRepository;

    @Autowired
    private DetailCommandeRepository detailCommandeRepository;

    @Autowired
    private StatutCommandeRepository statutCommandeRepository;

    /**
     * Crée une commande avec ses détails pour une liste de billets
     */
    public Commande createCommandeWithDetails(Client client, List<Billet> billets, BigDecimal montantTotal) throws Exception {
        if (billets == null || billets.isEmpty()) {
            throw new Exception("Au moins un billet est requis pour créer une commande");
        }

        // Obtenir le statut par défaut (EN_ATTENTE)
        StatutCommande statutDefault = statutCommandeRepository.findById(1L).orElse(null);
        if (statutDefault == null) {
            throw new Exception("Statut de commande par défaut non trouvé");
        }

        // Créer la commande
        Commande commande = new Commande();
        commande.setClient(client);
        commande.setDateCommande(LocalDateTime.now());
        commande.setMontantTotal(montantTotal != null ? montantTotal : BigDecimal.ZERO);
        commande.setStatutCommande(statutDefault);

        Commande savedCommande = commandeRepository.save(commande);

        // Créer les détails de commande pour chaque billet
        for (Billet billet : billets) {
            DetailCommande detail = new DetailCommande();
            detail.setCommande(savedCommande);
            detail.setBillet(billet);
            detailCommandeRepository.save(detail);
        }

        return savedCommande;
    }

    public Commande getCommandeById(Long id) {
        return commandeRepository.findById(id).orElse(null);
    }

    public List<Commande> getAllCommandes() {
        return commandeRepository.findAll();
    }

    public List<Commande> getCommandesByClient(Long clientId) {
        return commandeRepository.findByClientId(clientId);
    }
}
