<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- Welcome Section -->
<div class="row mb-4">
    <div class="col-12">
        <h2 class="fw-bold mb-2">Bienvenue dans votre tableau de bord</h2>
        <p class="text-muted">Voici un aperçu de votre système de gestion de taxis</p>
    </div>
</div>

<!-- Stats Cards -->
<div class="row g-4 mb-4">
    <div class="col-xl-3 col-md-6">
        <div class="stat-card primary">
            <div class="stat-icon">
                <i class="bi bi-car-front"></i>
            </div>
            <div class="stat-label">Total Véhicules</div>
            <div class="stat-value">24</div>
            <small class="text-success"><i class="bi bi-arrow-up"></i> 12% ce mois</small>
        </div>
    </div>
    
    <div class="col-xl-3 col-md-6">
        <div class="stat-card success">
            <div class="stat-icon">
                <i class="bi bi-person-badge"></i>
            </div>
            <div class="stat-label">Chauffeurs Actifs</div>
            <div class="stat-value">18</div>
            <small class="text-success"><i class="bi bi-arrow-up"></i> 5% ce mois</small>
        </div>
    </div>
    
    <div class="col-xl-3 col-md-6">
        <div class="stat-card warning">
            <div class="stat-icon">
                <i class="bi bi-geo-alt"></i>
            </div>
            <div class="stat-label">Courses Aujourd'hui</div>
            <div class="stat-value">142</div>
            <small class="text-muted"><i class="bi bi-dash"></i> Stable</small>
        </div>
    </div>
    
    <div class="col-xl-3 col-md-6">
        <div class="stat-card info">
            <div class="stat-icon">
                <i class="bi bi-currency-dollar"></i>
            </div>
            <div class="stat-label">Revenus du Mois</div>
            <div class="stat-value">€8.5k</div>
            <small class="text-success"><i class="bi bi-arrow-up"></i> 18% ce mois</small>
        </div>
    </div>
</div>

<!-- Quick Actions -->
<div class="row g-4">
    <div class="col-lg-8">
        <div class="card">
            <div class="card-header">
                <i class="bi bi-lightning me-2"></i> Actions Rapides
            </div>
            <div class="card-body">
                <div class="row g-3">
                    <div class="col-md-4">
                        <a href="/admin/vehicule/create" class="btn btn-outline-primary w-100">
                            <i class="bi bi-plus-circle me-2"></i> Nouveau Véhicule
                        </a>
                    </div>
                    <div class="col-md-4">
                        <a href="/admin/chauffeur/create" class="btn btn-outline-success w-100">
                            <i class="bi bi-person-plus me-2"></i> Nouveau Chauffeur
                        </a>
                    </div>
                    <div class="col-md-4">
                        <a href="#" class="btn btn-outline-info w-100">
                            <i class="bi bi-file-earmark-text me-2"></i> Voir Rapports
                        </a>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="card mt-4">
            <div class="card-header">
                <i class="bi bi-activity me-2"></i> Activités Récentes
            </div>
            <div class="card-body">
                <div class="list-group list-group-flush">
                    <div class="list-group-item border-0 px-0">
                        <div class="d-flex align-items-center">
                            <div class="flex-shrink-0">
                                <div class="avatar bg-success-subtle text-success rounded-circle p-2">
                                    <i class="bi bi-plus-circle"></i>
                                </div>
                            </div>
                            <div class="flex-grow-1 ms-3">
                                <p class="mb-0 fw-semibold">Nouveau véhicule ajouté</p>
                                <small class="text-muted">Mercedes Sprinter - Il y a 2 heures</small>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item border-0 px-0">
                        <div class="d-flex align-items-center">
                            <div class="flex-shrink-0">
                                <div class="avatar bg-primary-subtle text-primary rounded-circle p-2">
                                    <i class="bi bi-person-check"></i>
                                </div>
                            </div>
                            <div class="flex-grow-1 ms-3">
                                <p class="mb-0 fw-semibold">Nouveau chauffeur vérifié</p>
                                <small class="text-muted">Jean Dupont - Il y a 5 heures</small>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item border-0 px-0">
                        <div class="d-flex align-items-center">
                            <div class="flex-shrink-0">
                                <div class="avatar bg-warning-subtle text-warning rounded-circle p-2">
                                    <i class="bi bi-wrench"></i>
                                </div>
                            </div>
                            <div class="flex-grow-1 ms-3">
                                <p class="mb-0 fw-semibold">Maintenance programmée</p>
                                <small class="text-muted">Véhicule #1234 - Demain à 10h</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="col-lg-4">
        <div class="card">
            <div class="card-header">
                <i class="bi bi-calendar-check me-2"></i> Calendrier
            </div>
            <div class="card-body">
                <p class="text-muted text-center py-4">
                    <i class="bi bi-calendar3 display-4 d-block mb-3"></i>
                    Intégration du calendrier à venir
                </p>
            </div>
        </div>
        
        <div class="card mt-4">
            <div class="card-header">
                <i class="bi bi-bell me-2"></i> Notifications
            </div>
            <div class="card-body">
                <div class="alert alert-warning mb-2">
                    <i class="bi bi-exclamation-triangle me-2"></i>
                    <small>3 véhicules nécessitent une maintenance</small>
                </div>
                <div class="alert alert-info mb-2">
                    <i class="bi bi-info-circle me-2"></i>
                    <small>2 nouveaux chauffeurs en attente d'approbation</small>
                </div>
                <div class="alert alert-success mb-0">
                    <i class="bi bi-check-circle me-2"></i>
                    <small>Tous les paiements sont à jour</small>
                </div>
            </div>
        </div>
    </div>
</div>
