<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Créer Utilisateur</title>
</head>
<body>
<h1>Créer Utilisateur</h1>
<form action="createUser" method="post">
    <label for="pseudo">Pseudo:</label>
    <input type="text" name="pseudo" id="pseudo" required><br>

    <label for="motDePasse">Mot de Passe:</label>
    <input type="password" name="motDePasse" id="motDePasse" required><br>

    <label for="role">Role:</label>
    <input type="text" name="role" id="role" required><br>

    <label for="nom">Nom:</label>
    <input type="text" name="nom" id="nom"><br>

    <label for="prenom">Prenom:</label>
    <input type="text" name="prenom" id="prenom"><br>

    <label for="dateNaissance">Date de Naissance:</label>
    <input type="date" name="dateNaissance" id="dateNaissance"><br>

    <label for="email">Email:</label>
    <input type="email" name="email" id="email" required><br>

    <input type="submit" value="Créer">
</form>
<a href="listUsers">Retour à la liste des utilisateurs</a>
</body>
</html>
