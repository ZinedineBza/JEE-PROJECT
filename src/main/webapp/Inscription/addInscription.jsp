<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ajouter une Inscription</title>
</head>
<body>
<h1>Ajouter une Inscription</h1>
<form action="AddInscriptionServlet" method="post">
    <label for="etudiantEmail">Email de l'Etudiant :</label>
    <input type="email" name="etudiantEmail" id="etudiantEmail" required><br>

    <label for="coursId">ID du Cours :</label>
    <input type="text" name="coursId" id="coursId" required><br>

    <button type="submit">Enregistrer</button>
</form>
</body>
</html>
