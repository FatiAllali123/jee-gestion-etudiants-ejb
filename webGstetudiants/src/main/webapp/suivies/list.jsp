<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 10/30/2025
  Time: 9:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <title>Suivi des Notes</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container">
    <a class="navbar-brand" href="../index.jsp">Retour</a>
  </div>
</nav>

<div class="container mt-4">
  <h2>Suivi des Notes</h2>
  <a href="suivies?action=add" class="btn btn-success mb-3">Ajouter Note</a>

  <table class="table table-bordered">
    <thead class="table-primary">
    <tr>
      <th>Étudiant</th>
      <th>Module</th>
      <th>Note</th>
      <th>Date</th>
      <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="s" items="${suivies}">
      <tr>
        <td>${s.etudiant.prenom} ${s.etudiant.nom}</td>
        <td>${s.module.titre}</td>
        <td><strong>${s.note}</strong></td>
        <td>${s.date_suivie}</td>
        <td>
          <a href="suivies?action=edit&id=${s.id}" class="btn btn-sm btn-warning">Modifier</a>
          <a href="suivies?action=delete&id=${s.id}" class="btn btn-sm btn-danger"
             onclick="return confirm('Supprimer ?')">Supprimer</a>


        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
</body>
</html>