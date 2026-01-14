package com.example.taxi.controller;

import com.example.taxi.entity.Admin;
import com.example.taxi.service.AdminService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;

    /**
     * Affiche la page de connexion admin
     */
    @GetMapping("/")
    public String showLoginForm(@RequestParam(value = "error", required = false) String error,
                               Model model) {
        if (error != null) {
            model.addAttribute("error", "Email ou mot de passe incorrect");
        }
        return "admin/login";
    }

    /**
     * Traite la soumission du formulaire de connexion
     */
    @PostMapping("/login")
    public String processLogin(@RequestParam("nom") String nom,
                              @RequestParam("mdp") String mdp,
                              HttpSession session,
                              RedirectAttributes redirectAttributes) {

        try {
            // Authentification
            Admin admin = adminService.authenticate(nom, mdp);

            if (admin != null) {
                // Connexion réussie - stocker en session
                session.setAttribute("admin", admin);
                session.setAttribute("adminId", admin.getIdAdmin());
                session.setAttribute("adminEmail", admin.getEmail());
                session.setAttribute("adminNom", admin.getNom());

                return "redirect:/dashboard";
            } else {
                // Échec de l'authentification
                redirectAttributes.addFlashAttribute("error", "Nom d'utilisateur ou mot de passe incorrect");
                return "redirect:?error=true";
            }

        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Une erreur est survenue lors de la connexion");
            return "redirect:?error=true";
        }
    }

    /**
     * Déconnexion de l'administrateur
     */
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    /**
     * Dashboard administrateur
     */
    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
        // Vérifier si l'admin est connecté
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin == null) {
            return "redirect:/";
        }

        model.addAttribute("admin", admin);
        model.addAttribute("pageTitle", "Tableau de Bord");
        model.addAttribute("contentPage", "/WEB-INF/jsp/admin/dashboard.jsp");
        return "includes/layout";
    }
}
