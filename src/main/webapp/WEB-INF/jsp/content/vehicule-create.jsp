<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="row mb-4">
    <div class="col-12">
        <h2 class="fw-bold mb-2">Créer un nouveau véhicule</h2>
        <p class="text-muted">Ajouter un nouveau véhicule au système</p>
    </div>
</div>

<div class="row">
    <div class="col-lg-8">
        <div class="card">
            <div class="card-header">
                <i class="bi bi-car-front me-2"></i> Informations du véhicule
            </div>
            <div class="card-body">
                <form action="/admin/vehicule/save" method="post">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label for="marque" class="form-label">Marque</label>
                            <input type="text" class="form-control" id="marque" name="marque" required>
                        </div>
                        <div class="col-md-6">
                            <label for="modele" class="form-label">Modèle</label>
                            <input type="text" class="form-control" id="modele" name="modele" required>
                        </div>
                        <div class="col-md-6">
                            <label for="immatriculation" class="form-label">Immatriculation</label>
                            <input type="text" class="form-control" id="immatriculation" name="immatriculation" required>
                        </div>
                        <div class="col-md-6">
                            <label for="annee" class="form-label">Année</label>
                            <input type="number" class="form-control" id="annee" name="annee" min="1990" max="2026" required>
                        </div>
                        <div class="col-md-6">
                            <label for="couleur" class="form-label">Couleur</label>
                            <input type="text" class="form-control" id="couleur" name="couleur" required>
                        </div>
                        <div class="col-md-6">
                            <label for="places" class="form-label">Nombre de places</label>
                            <input type="number" class="form-control" id="places" name="places" min="1" max="50" required>
                        </div>
                        <div class="col-md-12">
                            <label for="statut" class="form-label">Statut</label>
                            <select class="form-select" id="statut" name="statut" required>
                                <option value="">Sélectionner...</option>
                                <option value="disponible">Disponible</option>
                                <option value="en_service">En service</option>
                                <option value="maintenance">En maintenance</option>
                                <option value="hors_service">Hors service</option>
                            </select>
                        </div>
                        <div class="col-12">
                            <label for="description" class="form-label">Description</label>
                            <textarea class="form-control" id="description" name="description" rows="3"></textarea>
                        </div>
                    </div>
                    <div class="mt-4">
                        <button type="submit" class="btn btn-primary">
                            <i class="bi bi-check-circle me-2"></i> Enregistrer
                        </button>
                        <a href="/admin/dashboard" class="btn btn-secondary">
                            <i class="bi bi-x-circle me-2"></i> Annuler
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <div class="col-lg-4">
        <div class="card">
            <div class="card-header">
                <i class="bi bi-info-circle me-2"></i> Aide
            </div>
            <div class="card-body">
                <p class="small text-muted">
                    Remplissez tous les champs requis pour ajouter un nouveau véhicule à la flotte.
                </p>
                <p class="small text-muted">
                    L'immatriculation doit être unique dans le système.
                </p>
            </div>
        </div>
    </div>
</div>
