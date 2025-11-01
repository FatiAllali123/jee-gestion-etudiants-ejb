<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 10/30/2025
  Time: 3:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Liste des Étudiants</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
        <a class="navbar-brand" href="../index.jsp">Gestion Étudiants</a>
    </div>
</nav>

<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h2>Liste des Étudiants</h2>
        <a href="etudiants?action=add" class="btn btn-success">
            <i class="fas fa-plus"></i> Ajouter
        </a>
    </div>

    <c:if test="${not empty param.success}">
        <div class="alert alert-success">Opération effectuée avec succès !</div>
    </c:if>

    <div class="table-responsive">
        <table class="table table-striped table-hover">
            <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Nom</th>
                <th>Prénom</th>
                <th>CNE</th>
                <th>Niveau</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="e" items="${etudiants}">
                <tr>
                    <td>${e.id_etudiant}</td>
                    <td>${e.nom}</td>
                    <td>${e.prenom}</td>
                    <td>${e.cne}</td>
                    <td>${e.niveau}</td>
                    <td>
                        <a href="etudiants?action=edit&id=${e.id_etudiant}" class="btn btn-sm btn-warning">
                            <i class="fas fa-edit"></i>
                        </a>
                        <a href="etudiants?action=delete&id=${e.id_etudiant}"
                           class="btn btn-sm btn-danger" onclick="return confirm('Supprimer ?')">
                            <i class="fas fa-trash"></i>
                        </a>
                        <a href="suivies?action=listByEtudiant&id=${e.id_etudiant}"
                           class="btn btn-sm btn-info text-white" title="Voir les notes">
                            Notes
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>