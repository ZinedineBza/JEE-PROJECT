<!-- createCourse.jsp -->
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Créer un Cours</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<h1>Ajouter un nouveau Cours</h1>
<form action="createCourse" method="post">
    <label for="emailProf">Email du Professeur:</label>
    <input type="email" name="emailProf" id="emailProf" required/><br/><br/>

    <label for="nom">Nom de la Matière:</label>
    <input type="text" name="nom" id="nom" required/><br/><br/>

    <label for="salle">Salle:</label>
    <input type="text" name="salle" id="salle" required/><br/><br/>

    <label for="date">Date:</label>
    <input type="date" name="date" id="date" required/><br/><br/>

    <label for="horaire">Horaire:</label>
    <input type="time" name="horaire" id="horaire" required/><br/><br/>

    <button type="submit">Ajouter le Cours</button>
</form>
</body>
</html>
