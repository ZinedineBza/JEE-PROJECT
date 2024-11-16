<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Ajouter un Résultat</title>
</head>
<body>
<h1>Ajouter un Résultat</h1>
<form action="addResultat" method="post">
    <label for="etudiant">Étudiant :</label>
    <input type="text" id="etudiant" name="etudiant" required/>
    <br/>
    <label for="cours">Cours :</label>
    <input type="text" id="cours" name="cours" required/>
    <br/>
    <label for="note">Note :</label>
    <input type="text" id="note" name="note" required/>
    <br/>
    <label for="commentaire">Commentaire :</label>
    <textarea id="commentaire" name="commentaire"></textarea>
    <br/>
    <label for="note">Date :</label>
    <input type="date" id="date" name="date" required/>
    <br/>
    <input type="submit" value="Ajouter"/>
</form>
<a href="listResultats">Retour à la liste des Résultats</a>
</body>
</html>
