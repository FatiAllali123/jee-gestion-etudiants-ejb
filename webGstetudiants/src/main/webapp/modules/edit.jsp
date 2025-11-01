<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Modifier Module</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
        <a class="navbar-brand" href="../index.jsp">Accueil</a>
    </div>
</nav>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow">
                <div class="card-header bg-warning text-dark text-center">
                    <h4 class="mb-0">Modifier Module #${module.id_module}</h4>
                </div>
                <div class="card-body">
                    <form action="modules" method="post">
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="id" value="${module.id_module}">

                        <div class="mb-3">
                            <label class="form-label">Code</label>
                            <input type="text" name="code" value="${module.code}" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Titre</label>
                            <input type="text" name="titre" value="${module.titre}" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Coefficient</label>
                            <input type="number" name="coefficient" min="1" max="10" value="${module.coefficient}" class="form-control" required>
                        </div>

                        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                            <a href="modules?action=list" class="btn btn-secondary me-md-2">Annuler</a>
                            <button type="submit" class="btn btn-warning">Mettre à jour</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>