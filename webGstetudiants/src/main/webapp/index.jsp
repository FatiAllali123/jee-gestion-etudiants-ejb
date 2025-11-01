<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Gestion Étudiants - Accueil</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <style>
        body { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); min-height: 100vh; }
        .card { transition: transform 0.3s; }
        .card:hover { transform: translateY(-10px); }
        .navbar-brand { font-weight: 700; }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">
            <i class="fas fa-graduation-cap"></i> Gestion Étudiants
        </a>
    </div>
</nav>

<div class="container mt-5">
    <div class="text-center text-white mb-5">
        <h1 class="display-4 fw-bold">Bienvenue dans le système de gestion</h1>
        <p class="lead">Gérez facilement les étudiants, modules et notes.</p>
    </div>

    <div class="row g-4">
        <div class="col-md-4">
            <div class="card h-100 bg-white text-dark shadow-lg border-0">
                <div class="card-body text-center p-4">
                    <i class="fas fa-user-graduate fa-3x text-primary mb-3"></i>
                    <h5 class="card-title">Étudiants</h5>
                    <p class="card-text">Ajouter, modifier, supprimer et lister les étudiants.</p>
                    <a href="etudiants?action=list" class="btn btn-primary">
                        <i class="fas fa-list"></i> Gérer
                    </a>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card h-100 bg-white text-dark shadow-lg border-0">
                <div class="card-body text-center p-4">
                    <i class="fas fa-book fa-3x text-success mb-3"></i>
                    <h5 class="card-title">Modules</h5>
                    <p class="card-text">Gestion des modules et coefficients.</p>
                    <a href="modules?action=list" class="btn btn-success">
                        <i class="fas fa-list"></i> Gérer
                    </a>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card h-100 bg-white text-dark shadow-lg border-0">
                <div class="card-body text-center p-4">
                    <i class="fas fa-clipboard-list fa-3x text-warning mb-3"></i>
                    <h5 class="card-title">Suivi Notes</h5>
                    <p class="card-text">Saisie et suivi des notes par étudiant et module.</p>
                    <a href="suivies?action=list" class="btn btn-warning text-dark">
                        <i class="fas fa-list"></i> Gérer
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>>