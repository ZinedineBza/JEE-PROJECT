<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Liste des Utilisateurs</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
  <script>
    function filterUsers() {
      //var roleFilter = document.getElementById('roleFilter').value.toLowerCase();
      var nameFilter = document.getElementById('nameFilter').value.toLowerCase();
      var prenomFilter = document.getElementById('prenomFilter').value.toLowerCase();
      var emailFilter = document.getElementById('emailFilter').value.toLowerCase();
      //var rows = document.querySelectorAll('table tr.userRow');
      
      rows.forEach(row => {
        var name = row.querySelector('td.name').textContent.toLowerCase();
        var prenom = row.querySelector('td.prenom').textContent.toLowerCase();
        var email = row.querySelector('td.email').textContent.toLowerCase();

        if (
            name.includes(nameFilter) &&
            prenom.includes(prenomFilter) &&
            email.includes(emailFilter)
        ) {
            row.style.display = ''; // Afficher la ligne
        } else {
            row.style.display = 'none'; // Masquer la ligne
        }
      });
    }
  </script>
</head>
<body>

<!-- Filtres uniquement pour les enseignants -->
<c:if test="${recherche == 'enseignant'}">
  <h1>Liste des Enseignants</h1>

    <label for="nameFilter">Filtrer par nom:</label>
    <input type="text" id="nameFilter" onkeyup="filterUsers()">

    <label for="prenomFilter">Filtrer par prenom:</label>
    <input type="text" id="prenomFilter" onkeyup="filterUsers()">

    <label for="emailFilter">Filtrer par email:</label>
    <input type="text" id="emailFilter" onkeyup="filterUsers()">
</c:if>
<!-- Filtres uniquement pour les étudiants -->
<c:if test="${recherche == 'etudiant'}">
  <h1>Liste des Etudiants</h1>

    <label for="nameFilter">Filtrer par nom:</label>
    <input type="text" id="nameFilter" onkeyup="filterUsers()">

    <label for="prenomFilter">Filtrer par prenom:</label>
    <input type="text" id="prenomFilter" onkeyup="filterUsers()">

    <label for="emailFilter">Filtrer par email:</label>
    <input type="text" id="emailFilter" onkeyup="filterUsers()">
</c:if>

<table border="1">
  <tr>
    <th>Pseudo</th>
    <th>Nom</th>
    <th>Prenom</th>
    <th>Date de Naissance</th>
    <th>Email</th>
    <c:if test='${recherche == "etudiant"}'>
    <th>>Notes</th>
  </c:if>
    <th>Modification</th>
    <th>Suppression</th>
  </tr>
  <c:forEach var="user" items="${listUsers}">
    <tr class="userRow">
      <td>${user.pseudo}</td>
      <td class="name">${user.nom}</td>
      <td class="prenom">${user.prenom}</td>
      <td>${user.dateNaissance}</td>
      <td class="email">${user.email}</td>
      
      <!-- Afficher la colonne "Notes" uniquement pour les étudiants -->
      <c:if test="${recherche == 'etudiant'}">
          <td>
            <form action="${pageContext.request.contextPath}/studentResults" method="post" style="margin: 0;">
              <input type="hidden" name="email" value="${user.email}">
              <button type="submit" class="notes-button">Notes</button>
            </form>
          </td>
      </c:if>
      
      <td>
        <a href="<%= request.getContextPath() %>/updateUser?email=${user.email}">Modifier</a>
      </td>
      <td>
        <a href="<%= request.getContextPath() %>/deleteUser?email=${user.email}">Supprimer</a>
      </td>
    </tr>
  </c:forEach>
</table>
<a href="createUser">Créer un nouvel utilisateur</a>
</body>
</html>
