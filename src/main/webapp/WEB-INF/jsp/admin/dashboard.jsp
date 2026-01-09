<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Dashboard Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet" />
    <style>
        .sidebar {
            width: 280px;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            background: linear-gradient(180deg, #343a40 0%, #495057 100%);
            color: #fff;
            padding: 1.5rem 1rem;
            overflow-y: auto;
            box-shadow: 2px 0 10px rgba(0,0,0,0.1);
        }
        .sidebar .logo {
            text-align: center;
            margin-bottom: 2.5rem;
            font-size: 1.8rem;
            font-weight: bold;
            color: #fff;
        }
        .sidebar .logo img {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            border: 3px solid #fff;
            margin-bottom: 0.5rem;
        }
        .sidebar .nav {
            margin: 0;
        }
        .sidebar .module-item {
            margin-bottom: 1rem;
        }
        .sidebar .module-toggle {
            display: flex;
            align-items: center;
            color: #adb5bd;
            padding: 0.75rem 1rem;
            border-radius: 0.5rem;
            text-decoration: none;
            transition: all 0.3s ease;
            font-weight: 500;
        }
        .sidebar .module-toggle:hover {
            color: #fff;
            background: rgba(255,255,255,0.1);
            text-decoration: none;
        }
        .sidebar .module-toggle i {
            margin-right: 0.75rem;
            font-size: 1.2rem;
        }
        .sidebar .module-toggle.active {
            background: #0d6efd;
            color: #fff;
        }
        .sidebar .dropdown-menu {
            background: #495057;
            border: none;
            border-radius: 0.5rem;
            margin-top: 0.5rem;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }
        .sidebar .dropdown-item {
            color: #adb5bd;
            padding: 0.5rem 1rem;
            transition: all 0.2s ease;
        }
        .sidebar .dropdown-item:hover {
            color: #fff;
            background: #6c757d;
        }
        .sidebar .dropdown-item i {
            margin-right: 0.5rem;
            width: 16px;
        }
        .main-content {
            margin-left: 280px;
            padding: 2rem;
            background: #f8f9fa;
            min-height: 100vh;
        }
        .main-content h1 {
            color: #343a40;
            margin-bottom: 1rem;
        }
        .main-content p {
            color: #6c757d;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <div class="logo">
            <img src="/images/logo.png" alt="Logo" style="width: 50px; height: 50px;" class="mb-2" />
            Taxi Admin
        </div>
        <nav class="nav flex-column">
            <div class="module-item">
                <a class="module-toggle dropdown-toggle" href="#" id="vehiculeDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="bi bi-car-front"></i> Véhicule
                </a>
                <ul class="dropdown-menu" aria-labelledby="vehiculeDropdown">
                    <li><a class="dropdown-item" href="#"><i class="bi bi-plus-circle"></i> Créer</a></li>
                    <li><a class="dropdown-item" href="#"><i class="bi bi-eye"></i> Lire</a></li>
                    <li><a class="dropdown-item" href="#"><i class="bi bi-pencil"></i> Mettre à jour</a></li>
                    <li><a class="dropdown-item" href="#"><i class="bi bi-trash"></i> Supprimer</a></li>
                </ul>
            </div>
            <div class="module-item">
                <a class="module-toggle dropdown-toggle" href="#" id="chauffeurDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="bi bi-person"></i> Chauffeur
                </a>
                <ul class="dropdown-menu" aria-labelledby="chauffeurDropdown">
                    <li><a class="dropdown-item" href="#"><i class="bi bi-plus-circle"></i> Créer</a></li>
                    <li><a class="dropdown-item" href="#"><i class="bi bi-eye"></i> Lire</a></li>
                    <li><a class="dropdown-item" href="#"><i class="bi bi-pencil"></i> Mettre à jour</a></li>
                    <li><a class="dropdown-item" href="#"><i class="bi bi-trash"></i> Supprimer</a></li>
                </ul>
            </div>
        </nav>
    </div>

    <div class="main-content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <h1><i class="bi bi-speedometer2 me-2"></i> Tableau de Bord Administrateur</h1>
                    <p class="lead">Gérez vos véhicules et chauffeurs efficacement.</p>
                    <div class="alert alert-info" role="alert">
                        <i class="bi bi-info-circle me-2"></i> Sélectionnez un module dans la sidebar pour accéder aux fonctionnalités.
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>