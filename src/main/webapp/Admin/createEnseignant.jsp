<%@ page import="jeeprojet.application.Modele.Utilisateur" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
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
    <title>Créer Enseignant</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<nav>
    <a href="<%= request.getContextPath() %>/logout">Se déconnecter</a>
</nav>
    <h1>Créer Enseignant</h1>

    <!-- Affichage des messages d'erreur -->
    <c:if test="${not empty errors}">
        <div class="error">
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
    <h1><a href="${pageContext.request.contextPath}/listUsers?recherche=enseignant">Retour à la liste des enseignants</a></h1>
    <br>
    <h1><a href="${pageContext.request.contextPath}/redirectionServlet">Retour Accueil</a></h1>

</body>
</html>
