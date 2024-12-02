<%@ page import="jeeprojet.application.Modele.Utilisateur" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
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
    <title>Créer un Cours</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<div id="deconnexion">
    <a href="<%= request.getContextPath() %>/logout">Se déconnecter</a>
</div>
<h1>Ajouter un nouveau Cours</h1>

<!-- Afficher les erreurs -->
<c:if test="${not empty errors}">
    <div class="error">
        <c:forEach var="error" items="${errors}">
            <p>${error}</p>
        </c:forEach>
    </div>
</c:if>

<form action="${pageContext.request.contextPath}/createCourse" method="post">
    <div class="form-group">
        <label for="emailProf">Professeur:</label>
        <select id="emailProf" name="emailProf">
            <c:forEach var="enseignant" items="${enseignant}">
                <option value="${enseignant.email}" ${enseignant.nom == nom ? "selected" : ""}>${enseignant.prenom} ${enseignant.nom}</option>
            </c:forEach>
        </select>
    </div>

    <div class="form-group">
        <label for="nom">Nom de la Matière:</label>
        <select id="nom" name="nom">
            <c:forEach var="matiere" items="${coursList}">
                <option value="${matiere.nom}" ${matiere.nom == nom ? "selected" : ""}>${matiere.nom}</option>
            </c:forEach>
        </select>
    </div>

    <div class="form-group">
        <label for="salle">Salle:</label>
        <select id="salle" name="salle">
            <c:forEach var="salle" items="${selectedSalle}">
                <option value="${salle.salle}" ${salle.salle == selectedSalle ? "selected" : ""}>${salle.salle}</option>
            </c:forEach>
        </select>
    </div>

    <div class="form-group">
        <label for="date">Date:</label>
        <input type="date" name="date" id="date" value="${date}" required />
    </div>

    <div class="form-group">
        <label for="horaire">Horaire:</label>
        <input type="time" name="horaire" id="horaire" value="${horaire}" required />
    </div>

    <div class="form-group">
        <button type="submit">Ajouter le Cours</button>
    </div>
</form>
</body>
</html>
