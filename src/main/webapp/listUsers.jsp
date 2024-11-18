<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Liste des Utilisateurs</title>
  <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<h1>Liste des Utilisateurs</h1>
<table border="1">
  <tr>
    <th>Pseudo</th>
    <th>Mot de Passe</th>
    <th>Role</th>
    <th>Nom</th>
    <th>Prenom</th>
    <th>Date de Naissance</th>
    <th>Email</th>
    <th>Modification</th>
    <th>Suppression</th>
  </tr>
  <c:forEach var="user" items="${listUsers}">
    <tr>
      <td>${user.pseudo}</td>
      <td>${user.motDePasse}</td>
      <td>${user.role}</td>
      <td>${user.nom}</td>
      <td>${user.prenom}</td>
      <td>${user.dateNaissance}</td>
      <td>${user.email}</td>
      <td>
        <a href="updateUser?email=${user.email}">Modifier</a>
      </td>
      <td>
        <a href="deleteUser?email=${user.email}">Supprimer</a>
      </td>
    </tr>
  </c:forEach>
</table>
<a href="createUser">Créer un nouvel utilisateur</a>
</body>
</html>
