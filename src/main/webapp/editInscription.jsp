<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Modifier une Inscription</title>
</head>
<body>
<h1>Modifier une Inscription</h1>
<form action="EditInscriptionServlet" method="post">
    <input type="hidden" name="id" value="${inscription.id}">

    <label for="etudiantEmail">Email de l'Etudiant :</label>
    <input type="email" name="etudiantEmail" id="etudiantEmail" value="${inscription.etudiant.email}" required><br>

    <label for="coursId">ID du Cours :</label>
    <input type="number" name="coursId" id="coursId" value="${inscription.cours.id}" required><br>

    <button type="submit">Mettre à jour</button>
</form>
</body>
</html>
