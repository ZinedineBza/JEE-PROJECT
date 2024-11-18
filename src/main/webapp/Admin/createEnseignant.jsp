<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Créer Enseignant</title>
    <link rel="stylesheet" type="text/css" href="../css/styles.css">
</head>
<body>

    <h1>Créer Enseignant</h1>

    <!-- Affichage des messages d'erreur -->
    <c:if test="${not empty errors}">
        <div style="color: red;">
            <ul>
                <c:forEach var="error" items="${errors}">
                    <li>${error.value}</li>
                </c:forEach>
            </ul>
        </div>
    </c:if>

    <form action="<%= request.getContextPath() %>/createUser" method="post">
        <input type="hidden" name="role" id="role" value="enseignant" required>

        <div class="form-group">
            <label for="nom">Nom:</label>
            <input type="text" name="nom" id="nom" value="${param.nom}">
        </div>

        <div class="form-group">
            <label for="prenom">Prenom:</label>
            <input type="text" name="prenom" id="prenom" value="${param.prenom}">
        </div>

        <div class="form-group">
            <label for="dateNaissance">Date de Naissance:</label>
            <input type="date" name="dateNaissance" id="dateNaissance" value="${param.dateNaissance}">
        </div>

        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" name="email" id="email" value="${param.email}" required>
        </div>

        <div class="form-group">
            <input type="submit" value="Créer">
        </div>
    </form>
    <h1><a href="listUsers">Retour à la liste des utilisateurs</a></h1>
</body>
</html>
