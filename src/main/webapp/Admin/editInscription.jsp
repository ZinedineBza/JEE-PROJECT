<%@ page import="jeeprojet.application.Modele.Utilisateur" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>Modifier une Inscription</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<header id = "headerleft">
    <a href="<%= request.getContextPath() %>/redirectionServlet">
        <img src="${pageContext.request.contextPath}/cyent.png" alt="Logo" class="animated-logo" style="height: 7em;">
    </a>
    <div id="deconnexion">
        <a href="<%= request.getContextPath() %>/logout">Se déconnecter</a>
    </div>
</header>
<h1>Modifier une Inscription</h1>
<form action="<%= request.getContextPath() %>/EditInscriptionServlet" method="post">
    <input type="hidden" name="id" value="${inscription.id}">

    <label for="etudiantEmail">Email de l'Etudiant :</label>
    <input type="email" name="etudiantEmail" id="etudiantEmail" value="${inscription.etudiant.email}" required><br>

    <label for="coursId">ID du Cours :</label>
    <input type="number" name="coursId" id="coursId" value="${inscription.cours.id}" required><br>

    <button type="submit">Mettre à jour</button>
</form>
</body>
</html>
