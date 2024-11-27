<%@ page import="jeeprojet.application.Modele.Utilisateur" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<%
    // Récupérer l'utilisateur de la session
    Utilisateur utilisateur = (Utilisateur) session.getAttribute("user");
    String role = "";

    if (utilisateur == null) {
        response.sendRedirect( request.getContextPath() + "/redirectionServlet");
    } else {
        role = utilisateur.getRole();
    }
%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifier Etudiant</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
    <script>
        // Fonction pour alterner la visibilité du mot de passe
        function togglePassword() {
            var passwordField = document.getElementById("motDePasse");
            var toggleButton = document.getElementById("togglePasswordBtn");
            if (passwordField.type === "password") {
                passwordField.type = "text";
                toggleButton.textContent = "Masquer le mot de passe";
            } else {
                passwordField.type = "password";
                toggleButton.textContent = "Afficher le mot de passe";
            }
        }
    </script>
</head>
<body>
<div class="container">
    <h1>Modifier Etudiant</h1>

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

    <!-- Affichage du message de succès -->
    <c:if test="${not empty successMessage}">
        <div style="color: green;">
            <p>${successMessage}</p>
        </div>
    </c:if>

    <form action="<%= request.getContextPath() %>/updateUser" method="post">
        <div class="form-group">
            <label for="motDePasse">Mot de Passe:</label>
            <input type="password" name="motDePasse" id="motDePasse" value="${user.motDePasse}" required>
            <button type="button" id="togglePasswordBtn" onclick="togglePassword()">Afficher le mot de passe</button>
        </div>

        <input type="hidden" name="role" id="role" value="${user.role}" required>

        <div class="form-group">
            <label for="nom">Nom:</label>
            <input type="text" name="nom" id="nom" value="${user.nom}" required>
        </div>

        <div class="form-group">
            <label for="prenom">Prenom:</label>
            <input type="text" name="prenom" id="prenom" value="${user.prenom}" required>
        </div>

        <div class="form-group">
            <label for="dateNaissance">Date de Naissance:</label>
            <input type="text" name="dateNaissance" id="dateNaissance" value="${user.dateNaissance}" required>
        </div>

        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" name="email" id="email" value="${user.email}" required>
        </div>

        <div class="form-group">
            <input type="submit" value="Modifier">
        </div>
    </form>

    <h1><a href="<%= request.getContextPath() %>/listUsers">Retour à la liste des utilisateurs</a></h1>
</div>
</body>
</html>
