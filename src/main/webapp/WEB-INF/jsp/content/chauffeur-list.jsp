<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="row mb-4">
    <div class="col-12 d-flex justify-content-between align-items-center">
        <div>
            <h2 class="fw-bold mb-2">Liste des chauffeurs</h2>
            <p class="text-muted">Gérer tous les chauffeurs</p>
        </div>
        <a href="/admin/chauffeur/create" class="btn btn-success">
            <i class="bi bi-person-plus me-2"></i> Nouveau chauffeur
        </a>
    </div>
</div>

<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <i class="bi bi-list-ul me-2"></i> Tous les chauffeurs
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Nom complet</th>
                                <th>Téléphone</th>
                                <th>Email</th>
                                <th>N° Permis</th>
                                <th>Statut</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Exemple de données statiques -->
                            <tr>
                                <td>1</td>
                                <td><strong>Jean Dupont</strong></td>
                                <td>+261 34 12 345 67</td>
                                <td>jean.dupont@email.com</td>
                                <td>P123456789</td>
                                <td><span class="badge bg-success">Actif</span></td>
                                <td>
                                    <a href="#" class="btn btn-sm btn-outline-primary" title="Modifier">
                                        <i class="bi bi-pencil"></i>
                                    </a>
                                    <a href="#" class="btn btn-sm btn-outline-danger" title="Supprimer">
                                        <i class="bi bi-trash"></i>
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td><strong>Marie Martin</strong></td>
                                <td>+261 34 98 765 43</td>
                                <td>marie.martin@email.com</td>
                                <td>P987654321</td>
                                <td><span class="badge bg-success">Actif</span></td>
                                <td>
                                    <a href="#" class="btn btn-sm btn-outline-primary" title="Modifier">
                                        <i class="bi bi-pencil"></i>
                                    </a>
                                    <a href="#" class="btn btn-sm btn-outline-danger" title="Supprimer">
                                        <i class="bi bi-trash"></i>
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td><strong>Pierre Bernard</strong></td>
                                <td>+261 33 55 444 33</td>
                                <td>pierre.bernard@email.com</td>
                                <td>P555444333</td>
                                <td><span class="badge bg-warning">En congé</span></td>
                                <td>
                                    <a href="#" class="btn btn-sm btn-outline-primary" title="Modifier">
                                        <i class="bi bi-pencil"></i>
                                    </a>
                                    <a href="#" class="btn btn-sm btn-outline-danger" title="Supprimer">
                                        <i class="bi bi-trash"></i>
                                    </a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
