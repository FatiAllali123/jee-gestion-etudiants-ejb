<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <title>Liste des Modules</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow-sm">
  <div class="container">
    <a class="navbar-brand fw-bold" href="../index.jsp">
      Gestion Étudiants
    </a>
  </div>
</nav>

<div class="container mt-4">
  <div class="d-flex justify-content-between align-items-center mb-4">
    <h2 class="mb-0">Liste des Modules</h2>
    <a href="modules?action=add" class="btn btn-success shadow-sm">
      Ajouter Module
    </a>
  </div>

  <!-- Message de succès (une seule fois) -->
  <c:if test="${success != null}">
    <div class="alert alert-success alert-dismissible fade show">
      Opération effectuée avec succès !
      <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>
  </c:if>

  <!-- Liste ou message vide -->
  <c:choose>
    <c:when test="${empty modules}">
      <div class="text-center py-5">
        <i class="fas fa-book fa-5x text-muted mb-3"></i>
        <p class="lead text-muted">Aucun module trouvé.</p>
        <a href="modules?action=add" class="btn btn-outline-primary">Ajouter le premier module</a>
      </div>
    </c:when>
    <c:otherwise>
      <div class="table-responsive">
        <table class="table table-striped table-hover align-middle">
          <thead class="table-primary">
          <tr>
            <th>ID</th>
            <th>Code</th>
            <th>Titre</th>
            <th>Coefficient</th>
            <th class="text-center">Actions</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach var="m" items="${modules}">
            <tr>
              <td><strong>#${m.id_module}</strong></td>
              <td><code>${m.code}</code></td>
              <td>${m.titre}</td>
              <td>
                <span class="badge bg-info text-dark fs-6">${m.coefficient}</span>
              </td>
              <td class="text-center">
                <a href="modules?action=edit&id=${m.id_module}"
                   class="btn btn-sm btn-warning" title="Modifier">
                  Modifier
                </a>
                <a href="modules?action=delete&id=${m.id_module}"
                   class="btn btn-sm btn-danger" title="Supprimer"
                   onclick="return confirm('Supprimer le module « ${m.titre} » ?')">
                  Supprimer
                </a>
              </td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
      </div>
    </c:otherwise>
  </c:choose>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>