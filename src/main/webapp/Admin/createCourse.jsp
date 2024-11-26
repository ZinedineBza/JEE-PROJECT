<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Créer un Cours</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<h1>Ajouter un nouveau Cours</h1>

<!-- Afficher les erreurs -->
<c:if test="${not empty errors}">
    <div class="error">
            <c:forEach var="error" items="${errors}">
                ${error.value}
            </c:forEach>
    </div>
</c:if>

<form action="${pageContext.request.contextPath}/createCourse" method="post">
    <div class="form-group">
        <label for="emailProf">Email du Professeur:</label>
        <input type="email" name="emailProf" id="emailProf" value="${emailProf}" required />
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
        <input type="text" name="salle" id="salle" value="${salle}" required />
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
