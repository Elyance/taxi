package com.example.taxi.controller;

import com.example.taxi.entity.Admin;
import com.example.taxi.service.AdminService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin")
public class AdminController {

	private final AdminService adminService;

	public AdminController(AdminService adminService) {
		this.adminService = adminService;
	}

	@GetMapping("/login")
	public String showLogin() {
		return "index"; // page d'accueil sert de page de login
	}

	@PostMapping("/login")
	public String doLogin(@RequestParam("nom") String nom,
						  @RequestParam("mdp") String mdp,
						  Model model) {
		Admin admin = adminService.login(nom, mdp);
		if (admin != null) {
			model.addAttribute("admin", admin);
			return "redirect:/admin/dashboard";
		}
		model.addAttribute("error", "Nom ou mot de passe incorrect");
		model.addAttribute("nom", nom);
		return "index";
	}

	@GetMapping("/dashboard")
	public String dashboard(Model model) {
		return "admin/dashboard";
	}
}
