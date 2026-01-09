<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="row mb-4">
    <div class="col-12">
        <h2 class="fw-bold mb-2">Créer un nouveau chauffeur</h2>
        <p class="text-muted">Ajouter un nouveau chauffeur au système</p>
    </div>
</div>

<div class="row">
    <div class="col-lg-8">
        <div class="card">
            <div class="card-header">
                <i class="bi bi-person-badge me-2"></i> Informations du chauffeur
            </div>
            <div class="card-body">
                <form action="/admin/chauffeur/save" method="post">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label for="nom" class="form-label">Nom</label>
                            <input type="text" class="form-control" id="nom" name="nom" required>
                        </div>
                        <div class="col-md-6">
                            <label for="prenom" class="form-label">Prénom</label>
                            <input type="text" class="form-control" id="prenom" name="prenom" required>
                        </div>
                        <div class="col-md-6">
                            <label for="telephone" class="form-label">Téléphone</label>
                            <input type="tel" class="form-control" id="telephone" name="telephone" required>
                        </div>
                        <div class="col-md-6">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>
                        <div class="col-md-6">
                            <label for="dateNaissance" class="form-label">Date de naissance</label>
                            <input type="date" class="form-control" id="dateNaissance" name="dateNaissance" required>
                        </div>
                        <div class="col-md-6">
                            <label for="numeroPermis" class="form-label">Numéro de permis</label>
                            <input type="text" class="form-control" id="numeroPermis" name="numeroPermis" required>
                        </div>
                        <div class="col-md-6">
                            <label for="datePermis" class="form-label">Date d'obtention du permis</label>
                            <input type="date" class="form-control" id="datePermis" name="datePermis" required>
                        </div>
                        <div class="col-md-6">
                            <label for="statut" class="form-label">Statut</label>
                            <select class="form-select" id="statut" name="statut" required>
                                <option value="">Sélectionner...</option>
                                <option value="actif">Actif</option>
                                <option value="inactif">Inactif</option>
                                <option value="en_conge">En congé</option>
                                <option value="suspendu">Suspendu</option>
                            </select>
                        </div>
                        <div class="col-12">
                            <label for="adresse" class="form-label">Adresse</label>
                            <textarea class="form-control" id="adresse" name="adresse" rows="2" required></textarea>
                        </div>
                        <div class="col-12">
                            <label for="notes" class="form-label">Notes</label>
                            <textarea class="form-control" id="notes" name="notes" rows="3"></textarea>
                        </div>
                    </div>
                    <div class="mt-4">
                        <button type="submit" class="btn btn-success">
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
                    Remplissez tous les champs requis pour ajouter un nouveau chauffeur.
                </p>
                <p class="small text-muted">
                    Le numéro de permis doit être valide et unique.
                </p>
                <p class="small text-muted">
                    Le chauffeur doit avoir au moins 21 ans pour exercer.
                </p>
            </div>
        </div>
    </div>
</div>
