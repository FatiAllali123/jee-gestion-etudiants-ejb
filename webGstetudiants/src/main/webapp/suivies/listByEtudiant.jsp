<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Notes de ${etudiant.prenom} ${etudiant.nom}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<nav class="navbar navbar-expand-lg navbar-dark bg-info shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="../index.jsp">
            Accueil
        </a>
        <span class="navbar-text">
      Notes de <strong>${etudiant.prenom} ${etudiant.nom}</strong>
      <small class="text-light"> (CNE: ${etudiant.cne})</small>
    </span>
    </div>
</nav>

<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3>Notes</h3>
        <a href="../suivies?action=add" class="btn btn-success">
            Ajouter une note
        </a>
    </div>

    <c:choose>
        <c:when test="${empty notes}">
            <div class="text-center py-5 bg-white rounded shadow-sm">
                <i class="fas fa-clipboard-list fa-5x text-muted mb-3"></i>
                <p class="lead text-muted">Aucune note enregistrée pour cet étudiant.</p>
                <a href="../suivies?action=add" class="btn btn-outline-primary">
                    Ajouter la première note
                </a>
            </div>
        </c:when>
        <c:otherwise>
            <div class="card shadow-sm">
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-striped table-hover mb-0">
                            <thead class="table-info">
                            <tr>
                                <th>Module</th>
                                <th>Note</th>
                                <th>Date</th>
                                <th class="text-center">Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="n" items="${notes}">
                                <tr>
                                    <td>
                                        <strong>${n.module.titre}</strong>
                                        <br><small class="text-muted">Code: ${n.module.code}</small>
                                    </td>
                                    <td>
                      <span class="badge ${n.note >= 10 ? 'bg-success' : 'bg-danger'} fs-6">
                        ${n.note}/20
                      </span>
                                    </td>
                                    <td>${n.date_suivie}</td>
                                    <td class="text-center">
                                        <a href="../suivies?action=edit&id=${n.id}" class="btn btn-sm btn-warning">
                                            Modifier
                                        </a>
                                        <a href="../suivies?action=delete&id=${n.id}"
                                           class="btn btn-sm btn-danger"
                                           onclick="return confirm('Supprimer cette note ?')">
                                            Supprimer
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </c:otherwise>
    </c:choose>

    <div class="mt-4 text-center">
        <a href="../etudiants?action=list" class="btn btn-secondary">
            Retour à la liste des étudiants
        </a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>