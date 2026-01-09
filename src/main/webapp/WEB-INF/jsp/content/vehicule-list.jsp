<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="row mb-4">
    <div class="col-12 d-flex justify-content-between align-items-center">
        <div>
            <h2 class="fw-bold mb-2">Liste des véhicules</h2>
            <p class="text-muted">Gérer tous les véhicules de la flotte</p>
        </div>
        <a href="/admin/vehicule/create" class="btn btn-primary">
            <i class="bi bi-plus-circle me-2"></i> Nouveau véhicule
        </a>
    </div>
</div>

<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <i class="bi bi-list-ul me-2"></i> Tous les véhicules
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Immatriculation</th>
                                <th>Marque</th>
                                <th>Modèle</th>
                                <th>Année</th>
                                <th>Couleur</th>
                                <th>Places</th>
                                <th>Statut</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Exemple de données statiques -->
                            <tr>
                                <td>1</td>
                                <td><strong>ABC-123</strong></td>
                                <td>Toyota</td>
                                <td>Corolla</td>
                                <td>2022</td>
                                <td>Blanc</td>
                                <td>4</td>
                                <td><span class="badge bg-success">Disponible</span></td>
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
                                <td><strong>DEF-456</strong></td>
                                <td>Mercedes</td>
                                <td>Sprinter</td>
                                <td>2021</td>
                                <td>Noir</td>
                                <td>8</td>
                                <td><span class="badge bg-primary">En service</span></td>
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
                                <td><strong>GHI-789</strong></td>
                                <td>Renault</td>
                                <td>Kangoo</td>
                                <td>2020</td>
                                <td>Bleu</td>
                                <td>5</td>
                                <td><span class="badge bg-warning">Maintenance</span></td>
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
