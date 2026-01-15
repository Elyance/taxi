package com.example.taxi.controller;

import com.example.taxi.entity.Client;
import com.example.taxi.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/client")
public class ClientController {

    @Autowired
    private ClientService clientService;

    @GetMapping("/list")
    public String listClients(HttpSession session, Model model) {
        if (session.getAttribute("admin") == null) {
            return "redirect:/";
        }

        try {
            var clients = clientService.getAllClients();
            model.addAttribute("clients", clients);
            model.addAttribute("pageTitle", "Gestion des Clients");
            model.addAttribute("contentPage", "/WEB-INF/jsp/client/list.jsp");
            return "includes/layout";
        } catch (Exception e) {
            model.addAttribute("error", "Erreur lors de la récupération des clients: " + e.getMessage());
            model.addAttribute("pageTitle", "Gestion des Clients");
            model.addAttribute("contentPage", "/WEB-INF/jsp/client/list.jsp");
            return "includes/layout";
        }
    }

    @GetMapping("/create")
    public String showCreateForm(HttpSession session, Model model) {
        if (session.getAttribute("admin") == null) {
            return "redirect:/";
        }

        model.addAttribute("client", new Client());
        model.addAttribute("pageTitle", "Ajouter un Client");
        model.addAttribute("contentPage", "/WEB-INF/jsp/client/form.jsp");
        return "includes/layout";
    }

    @PostMapping("/save")
    public String saveClient(
            @ModelAttribute Client client,
            HttpSession session,
            Model model) {
        if (session.getAttribute("admin") == null) {
            return "redirect:/";
        }

        try {
            if (client.getIdClient() == null) {
                clientService.createClient(client.getNom(), client.getTelephone());
            } else {
                clientService.updateClient(client);
            }
            return "redirect:/client/list?success=Client sauvegardé avec succès";
        } catch (Exception e) {
            model.addAttribute("error", "Erreur lors de la sauvegarde: " + e.getMessage());
            model.addAttribute("client", client);
            model.addAttribute("pageTitle", "Modifier un Client");
            model.addAttribute("contentPage", "/WEB-INF/jsp/client/form.jsp");
            return "includes/layout";
        }
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(
            @PathVariable Long id,
            HttpSession session,
            Model model) {
        if (session.getAttribute("admin") == null) {
            return "redirect:/";
        }

        try {
            Client client = clientService.getClientById(id);
            if (client == null) {
                return "redirect:/client/list?error=Client non trouvé";
            }
            model.addAttribute("client", client);
            model.addAttribute("pageTitle", "Modifier un Client");
            model.addAttribute("contentPage", "/WEB-INF/jsp/client/form.jsp");
            return "includes/layout";
        } catch (Exception e) {
            return "redirect:/client/list?error=" + e.getMessage();
        }
    }

    @GetMapping("/details/{id}")
    public String showDetails(
            @PathVariable Long id,
            HttpSession session,
            Model model) {
        if (session.getAttribute("admin") == null) {
            return "redirect:/";
        }

        try {
            Client client = clientService.getClientById(id);
            if (client == null) {
                return "redirect:/client/list?error=Client non trouvé";
            }
            model.addAttribute("client", client);
            model.addAttribute("pageTitle", "Détails du Client");
            model.addAttribute("contentPage", "/WEB-INF/jsp/client/details.jsp");
            return "includes/layout";
        } catch (Exception e) {
            return "redirect:/client/list?error=" + e.getMessage();
        }
    }

    @GetMapping("/delete/{id}")
    public String deleteClient(
            @PathVariable Long id,
            HttpSession session) {
        if (session.getAttribute("admin") == null) {
            return "redirect:/";
        }

        try {
            clientService.deleteClient(id);
            return "redirect:/client/list?success=Client supprimé avec succès";
        } catch (Exception e) {
            return "redirect:/client/list?error=" + e.getMessage();
        }
    }
}