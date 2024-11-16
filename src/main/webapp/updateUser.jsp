<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modifier Utilisateur</title>
</head>
<body>
<h1>Modifier Utilisateur</h1>
<form action="updateUser" method="post">
    <input type="hidden" name="email" value="${user.email}">

    <label for="pseudo">Pseudo:</label>
    <input type="text" name="pseudo" id="pseudo" value="${user.pseudo}" required><br>

    <label for="motDePasse">Mot de Passe:</label>
    <input type="password" name="motDePasse" id="motDePasse" value="${user.motDePasse}" required><br>

    <label for="role">Role:</label>
    <input type="text" name="role" id="role" value="${user.role}" required><br>

    <label for="nom">Nom:</label>
    <input type="text" name="nom" id="nom" value="${user.nom}"><br>

    <label for="prenom">Prenom:</label>
    <input type="text" name="prenom" id="prenom" value="${user.prenom}"><br>

    <label for="dateNaissance">Date de Naissance:</label>
    <input type="date" name="dateNaissance" id="dateNaissance" value="${user.dateNaissance}"><br>

    <input type="submit" value="Modifier">
</form>
<a href="listUsers">Retour à la liste des utilisateurs</a>
</body>
</html>
