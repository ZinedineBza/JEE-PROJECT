<%@ page import="jeeprojet.application.Modele.Utilisateur" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>Inscriptions</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<h1>Étudiants inscrits à vos cours</h1>
<table border="1">
    <thead>
        <tr>
            <th>Nom de l'étudiant</th>
            <th>Prénom</th>
            <th>Email</th>
            <th>Classe</th>
            <th>Matière</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="inscription" items="${inscriptions}">
            <tr>
                <td>${inscription.etudiant.nom}</td>
                <td>${inscription.etudiant.prenom}</td>
                <td>${inscription.etudiant.email}</td>
                <td>${inscription.etudiant.classe}</td>
                <td>${inscription.matiere.nom}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
<a href="${pageContext.request.contextPath}/redirectionServlet">Retour</a>
</body>
</html>
