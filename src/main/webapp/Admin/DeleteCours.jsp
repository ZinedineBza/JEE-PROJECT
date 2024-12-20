<%@ page import="jeeprojet.application.Modele.Utilisateur" %>
<!-- DeleteCours.jsp -->
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
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
    <title>Confirmer la Suppression</title>
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
<h1>Êtes-vous sûr de vouloir supprimer ce Cours ?</h1>
<form action="<%= request.getContextPath() %>/deleteCourse" method="get">
    <input type="hidden" name="id" value="${course.id}"/>
    <button type="submit">Oui, supprimer ce Cours</button>
    <a href="listCourses">Annuler</a>
</form>
</body>
</html>
