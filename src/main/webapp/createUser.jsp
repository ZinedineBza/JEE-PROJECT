<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Créer Utilisateur</title>
</head>
<body>
<h1>Créer Utilisateur</h1>

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

<form action="createUser" method="post">
    <label for="pseudo">Pseudo:</label>
    <input type="text" name="pseudo" id="pseudo" value="${param.pseudo}" required><br>

    <label for="motDePasse">Mot de Passe:</label>
    <input type="password" name="motDePasse" id="motDePasse" required><br>

    <label for="role">Role:</label>
    <input type="text" name="role" id="role" value="${param.role}" required><br>

    <label for="nom">Nom:</label>
    <input type="text" name="nom" id="nom" value="${param.nom}"><br>

    <label for="prenom">Prenom:</label>
    <input type="text" name="prenom" id="prenom" value="${param.prenom}"><br>

    <label for="dateNaissance">Date de Naissance:</label>
    <input type="date" name="dateNaissance" id="dateNaissance" value="${param.dateNaissance}"><br>

    <label for="email">Email:</label>
    <input type="email" name="email" id="email" value="${param.email}" required><br>

    <input type="submit" value="Créer">
</form>
<a href="listUsers">Retour à la liste des utilisateurs</a>
</body>
</html>
