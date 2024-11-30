<%@ page import="jeeprojet.application.Modele.Utilisateur" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <title>Gestion des Utilisateurs et Inscriptions</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<header>
    <a href="<%= request.getContextPath() %>/index.jsp">
        <img src="${pageContext.request.contextPath}/cyent.png" alt="Logo" class="animated-logo" style="height: 15em">
    </a>
    <nav>
        <a href="${pageContext.request.contextPath}/FormUser?type=etudiant">Créer un étudiant</a>
        <a href="${pageContext.request.contextPath}/FormUser?type=enseignant">Créer un enseignant</a>
        <a href="<%= request.getContextPath() %>/listUsers?recherche=etudiant">liste les etudiants</a>
        <a href="<%= request.getContextPath() %>/listUsers?recherche=enseignant">liste les enseignants</a>
        <a href="<%=request.getContextPath()%>/AddInscriptionServlet">Ajouter une inscription</a>
        <a href="<%= request.getContextPath() %>/ListInscriptionServlet">Lister les inscriptions</a>
        <a href="${pageContext.request.contextPath}/addResultatEnseignant">Ajouter un Resultat</a>
        <a href="<%= request.getContextPath() %>/listResultats">Lister les Resultats</a>
        <a href="${pageContext.request.contextPath}/createCourse">Ajouter un Cours</a>
        <a href="<%= request.getContextPath() %>/GetMatiere">Liste Cours</a>
        <a href="<%= request.getContextPath() %>/logout">Se déconnecter</a>
    </nav>
</header>


    <h1>Bienvenue dans l'application de gestion</h1>
</header>


<footer>
    &copy; 2024 Gestion Application - Tous droits réservés.
</footer>
</body>
</html>
