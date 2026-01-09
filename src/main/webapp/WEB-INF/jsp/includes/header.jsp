<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<header class="top-header">
    <div class="header-left">
        <button class="sidebar-toggle" id="sidebarToggle">
            <i class="bi bi-list"></i>
        </button>
        <h5 class="page-title mb-0">${pageTitle != null ? pageTitle : 'Dashboard'}</h5>
    </div>
    
    <div class="header-right">
        <div class="search-box">
            <i class="bi bi-search"></i>
            <input type="text" placeholder="Rechercher..." />
        </div>
        
        <div class="header-actions">
            <a href="#" class="header-icon" title="Notifications">
                <i class="bi bi-bell"></i>
                <span class="badge">3</span>
            </a>
            
            <div class="user-menu dropdown">
                <a href="#" class="user-avatar dropdown-toggle" data-bs-toggle="dropdown">
                    <i class="bi bi-person-circle"></i>
                    <span class="user-name">Admin</span>
                </a>
                <ul class="dropdown-menu dropdown-menu-end">
                    <li><a class="dropdown-item" href="#"><i class="bi bi-person"></i> Profil</a></li>
                    <li><a class="dropdown-item" href="#"><i class="bi bi-gear"></i> Paramètres</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="/admin/logout"><i class="bi bi-box-arrow-right"></i> Déconnexion</a></li>
                </ul>
            </div>
        </div>
    </div>
</header>
