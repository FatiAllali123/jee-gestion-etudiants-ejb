<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 10/30/2025
  Time: 9:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <title>Ajouter Étudiant</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container">
    <a class="navbar-brand" href="../index.jsp">Retour</a>
  </div>
</nav>

<div class="container mt-5">
  <div class="row justify-content-center">
    <div class="col-md-6">
      <div class="card shadow">
        <div class="card-header bg-primary text-white">
          <h4 class="mb-0">Nouvel Étudiant</h4>
        </div>
        <div class="card-body">
          <form action="etudiants" method="post">
            <input type="hidden" name="action" value="save">
            <div class="mb-3">
              <label>Nom</label>
              <input type="text" name="nom" class="form-control" required>
            </div>
            <div class="mb-3">
              <label>Prénom</label>
              <input type="text" name="prenom" class="form-control" required>
            </div>
            <div class="mb-3">
              <label>CNE</label>
              <input type="text" name="cne" class="form-control" required>
            </div>
            <div class="mb-3">
              <label>Adresse</label>
              <input type="text" name="adresse" class="form-control">
            </div>
            <div class="mb-3">
              <label>Niveau</label>
              <select name="niveau" class="form-select" required>
                <option value="L1">L1</option>
                <option value="L2">L2</option>
                <option value="L3">L3</option>
                <option value="M1">M1</option>
                <option value="M2">M2</option>
              </select>
            </div>
            <div class="text-end">
              <a href="etudiants?action=list" class="btn btn-secondary">Annuler</a>
              <button type="submit" class="btn btn-primary">Enregistrer</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>