<!-- createCourse.jsp -->
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Créer un Cours</title>
</head>
<body>
<h1>Ajouter un nouveau Cours</h1>
<form action="createCourse" method="post">
    <label for="nom">Nom du Cours:</label>
    <input type="text" name="nom" id="nom" required/><br/><br/>

    <label for="description">Description:</label>
    <textarea name="description" id="description" required></textarea><br/><br/>

    <label for="dateDebut">Date de Début:</label>
    <input type="date" name="dateDebut" id="dateDebut" required/><br/><br/>

    <label for="dateFin">Date de Fin:</label>
    <input type="date" name="dateFin" id="dateFin" required/><br/><br/>

    <button type="submit">Ajouter le Cours</button>
</form>
</body>
</html>
