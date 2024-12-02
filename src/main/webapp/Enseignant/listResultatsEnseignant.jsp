<%@ page import="jeeprojet.application.Modele.Utilisateur" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>Résultats Donnés</title>
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

<h1>Résultats Donnés</h1>
    <table border="1">
        <thead>
            <tr>
                <th>Étudiant</th>
                <th>Matière</th>
                <th>Note</th>
                <th>Commentaire</th>
                <th>Date</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="resultat" items="${resultats}">
                <tr>
                    <td>${resultat.etudiant.nom} ${resultat.etudiant.prenom}</td>
                    <td>${resultat.cours.nom}</td>
                    <td>${resultat.note}</td>
                    <td>${resultat.commentaire}</td>
                    <td>${resultat.id.date}</td>
                </tr>
            </c:forEach>            
        </tbody>
    </table>


<a href="${pageContext.request.contextPath}/addResultatEnseignant">Ajouter un Résultat</a>


</body>
</html>
