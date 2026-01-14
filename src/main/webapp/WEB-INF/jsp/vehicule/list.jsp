<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="list-header">
    <h2 class="list-title"><i class="fas fa-truck"></i> Gestion des Véhicules</h2>
    <div class="list-actions">
        <button class="btn-primary" onclick="window.location.href='<c:url value='/vehicule/create'/>'">
            <i class="fas fa-plus"></i> Ajouter un Véhicule
        </button>
    </div>
</div>

<!-- Filter Section -->
<div class="filter-section">
    <div class="filter-section-title">
        <i class="fas fa-filter"></i> Filtres
    </div>
    <form method="get" action="#">
        <div class="filter-group">
            <div class="filter-item">
                <label class="filter-label">Immatriculation</label>
                <input type="text" class="filter-input" placeholder="Rechercher par immatriculation...">
            </div>
            <div class="filter-item">
                <label class="filter-label">Modèle</label>
                <select class="filter-select">
                    <option value="">Tous les modèles</option>
                    <option value="1">Toyota Hiace</option>
                    <option value="2">Mercedes Sprinter</option>
                    <option value="3">Ford Transit</option>
                </select>
            </div>
            <div class="filter-item">
                <label class="filter-label">Statut</label>
                <select class="filter-select">
                    <option value="">Tous les statuts</option>
                    <option value="actif">Actif</option>
                    <option value="maintenance">En maintenance</option>
                    <option value="inactif">Inactif</option>
                </select>
            </div>
        </div>
        <div class="filter-actions">
            <button type="submit" class="btn-filter">
                <i class="fas fa-search"></i> Filtrer
            </button>
            <button type="reset" class="btn-reset">
                <i class="fas fa-redo"></i> Réinitialiser
            </button>
        </div>
    </form>
</div>

<!-- Table Section -->
<div style="overflow-x: auto;">
    <table class="data-table">
        <thead>
            <tr>
                <th>Immatriculation</th>
                <th>Modèle</th>
                <th>Nombre Places</th>
                <th>Date Ajout</th>
                <th>Statut</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><strong>TN-3251-CD</strong></td>
                <td>Toyota Hiace</td>
                <td>8</td>
                <td>14/01/2025</td>
                <td><span style="background: #d1fae5; color: #065f46; padding: 4px 12px; border-radius: 20px; font-size: 12px; font-weight: 500;">Actif</span></td>
                <td>
                    <div class="table-actions">
                        <button class="btn-action btn-view" title="Voir">
                            <i class="fas fa-eye"></i> Voir
                        </button>
                        <button class="btn-action btn-edit" title="Modifier">
                            <i class="fas fa-edit"></i> Éditer
                        </button>
                        <button class="btn-action btn-delete" title="Supprimer">
                            <i class="fas fa-trash"></i> Supprimer
                        </button>
                    </div>
                </td>
            </tr>
            <tr>
                <td><strong>TN-4562-BD</strong></td>
                <td>Mercedes Sprinter</td>
                <td>12</td>
                <td>10/01/2025</td>
                <td><span style="background: #fef3c7; color: #78350f; padding: 4px 12px; border-radius: 20px; font-size: 12px; font-weight: 500;">Maintenance</span></td>
                <td>
                    <div class="table-actions">
                        <button class="btn-action btn-view" title="Voir">
                            <i class="fas fa-eye"></i> Voir
                        </button>
                        <button class="btn-action btn-edit" title="Modifier">
                            <i class="fas fa-edit"></i> Éditer
                        </button>
                        <button class="btn-action btn-delete" title="Supprimer">
                            <i class="fas fa-trash"></i> Supprimer
                        </button>
                    </div>
                </td>
            </tr>
            <tr>
                <td><strong>TN-7891-AD</strong></td>
                <td>Ford Transit</td>
                <td>10</td>
                <td>05/01/2025</td>
                <td><span style="background: #fee2e2; color: #7f1d1d; padding: 4px 12px; border-radius: 20px; font-size: 12px; font-weight: 500;">Inactif</span></td>
                <td>
                    <div class="table-actions">
                        <button class="btn-action btn-view" title="Voir">
                            <i class="fas fa-eye"></i> Voir
                        </button>
                        <button class="btn-action btn-edit" title="Modifier">
                            <i class="fas fa-edit"></i> Éditer
                        </button>
                        <button class="btn-action btn-delete" title="Supprimer">
                            <i class="fas fa-trash"></i> Supprimer
                        </button>
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
</div>

<!-- Pagination -->
<div class="pagination">
    <span class="pagination-item disabled"><i class="fas fa-chevron-left"></i></span>
    <span class="pagination-item active">1</span>
    <span class="pagination-item">2</span>
    <span class="pagination-item">3</span>
    <span class="pagination-item"><i class="fas fa-chevron-right"></i></span>
</div>

<!-- Records Info -->
<p style="text-align: center; color: #6b7280; font-size: 13px; margin-top: 15px;">
    Affichage 1 à 3 sur 3 enregistrements
</p>
