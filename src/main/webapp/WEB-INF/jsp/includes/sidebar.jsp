<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<aside class="sidebar">
    <div class="logo">
        <div class="logo-icon">
            <i class="bi bi-taxi-front"></i>
        </div>
        <div class="logo-text">Taxi Admin</div>
    </div>
    
    <nav class="nav flex-column">
        <a href="/admin/dashboard" class="nav-item ${pageContext.request.requestURI.contains('dashboard') ? 'active' : ''}">
            <i class="bi bi-speedometer2"></i>
            <span>Tableau de bord</span>
        </a>
        
        <div class="module-item">
            <a class="module-toggle" data-bs-toggle="collapse" href="#vehiculeMenu" role="button" aria-expanded="false">
                <div class="module-icon-text">
                    <i class="bi bi-car-front"></i>
                    <span>Véhicule</span>
                </div>
                <i class="bi bi-chevron-down toggle-icon"></i>
            </a>
            <div class="collapse submenu" id="vehiculeMenu">
                <a class="submenu-item" href="/admin/vehicule/create"><i class="bi bi-plus-circle"></i> Saisie</a>
                <a class="submenu-item" href="/admin/vehicule/list"><i class="bi bi-list-ul"></i> Affichage</a>
            </div>
        </div>
        
        <div class="module-item">
            <a class="module-toggle" data-bs-toggle="collapse" href="#chauffeurMenu" role="button" aria-expanded="false">
                <div class="module-icon-text">
                    <i class="bi bi-person-badge"></i>
                    <span>Chauffeur</span>
                </div>
                <i class="bi bi-chevron-down toggle-icon"></i>
            </a>
            <div class="collapse submenu" id="chauffeurMenu">
                <a class="submenu-item" href="/admin/chauffeur/create"><i class="bi bi-plus-circle"></i> Saisie</a>
                <a class="submenu-item" href="/admin/chauffeur/list"><i class="bi bi-list-ul"></i> Affichage</a>
            </div>
        </div>
        
        <div class="module-item">
            <a class="module-toggle" data-bs-toggle="collapse" href="#billetMenu" role="button" aria-expanded="false">
                <div class="module-icon-text">
                    <i class="bi bi-receipt"></i>
                    <span>Billet</span>
                </div>
                <i class="bi bi-chevron-down toggle-icon"></i>
            </a>
            <div class="collapse submenu" id="billetMenu">
                <a class="submenu-item" href="/voyages"><i class="bi bi-ticket-perforated"></i> Achat Billet</a>
                <a class="submenu-item" href="/billets"><i class="bi bi-list-ul"></i> Liste des Billets</a>
            </div>
        </div>
    </nav>
    
    <div class="sidebar-footer">
        <a href="/admin/logout" class="logout-btn">
            <i class="bi bi-box-arrow-right"></i>
            <span>Déconnexion</span>
        </a>
    </div>
</aside>
