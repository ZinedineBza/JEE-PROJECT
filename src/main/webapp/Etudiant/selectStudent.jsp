<%@ page import="jeeprojet.application.Modele.Utilisateur" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Liste des Étudiants</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
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
<body>
<header>
    <nav>
        <a href="${pageContext.request.contextPath}/redirectionServlet">Accueil</a>
        <% if (!"enseignant".equals(role)) { %>
        <a href="<%= request.getContextPath() %>/ListInscriptionServlet">Inscriptions</a>
        <% } %>
        <a href="<%= request.getContextPath() %>/studentResults">Résultats</a>
        <a href="<%= request.getContextPath() %>/logout">Se déconnecter</a>

    </nav>
</header>
    <h1>Liste des Étudiants</h1>

    <table border="1">
        <thead>
            <tr>
                <th>Nom</th>
                <th>Prénom</th>
                <th>Email</th>
                <th>Voir le Bulletin</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="etudiant" items="${etudiants}">
                <tr>
                    <td>${etudiant.nom}</td>
                    <td>${etudiant.prenom}</td>
                    <td>${etudiant.email}</td>
                    <td>
                        <form action="${pageContext.request.contextPath}/studentResults" method="post">
                            <input type="hidden" name="email" value="${user.email}">
                            <button type="submit" class="notes-button">Notes</button>
                        </form>                                 
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
