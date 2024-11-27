<%@ page import="jeeprojet.application.Modele.Utilisateur" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <title>Liste des Inscriptions</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<h1>Liste des Inscriptions</h1>
<table border="1">
    <thead>
    <tr>
        <th>Nom</th>
        <th>Prenom</th>
        <th>email</th>
        <th>Cours</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="inscription" items="${inscriptions}">
        <tr>
            <td>${inscription.id.etudiant.nom}</td>
            <td>${inscription.id.etudiant.prenom}</td>
            <td>${inscription.id.etudiant.email}</td>

            <td>${inscription.cours.nom}</td>
            <td>
                <a href="InscriptionServlet?action=edit&id=${inscription.id}">Modifier</a> |
                <a href="InscriptionServlet?action=delete&id=${inscription.id}" onclick="return confirm('Voulez-vous vraiment supprimer cette inscription ?');">Supprimer</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<a href="addInscription.jsp">Ajouter une Inscription</a>
</body>
</html>