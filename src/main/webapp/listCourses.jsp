<!-- listCourses.jsp -->
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Liste des Cours</title>
</head>
<body>
<h1>Liste des Cours</h1>
<table border="1">
  <thead>
  <tr>
    <th>ID</th>
    <th>Nom</th>
    <th>Description</th>
    <th>Date de Début</th>
    <th>Date de Fin</th>
    <th>Actions</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="cours" items="${listCourses}">
    <tr>
      <td>${cours.id}</td>
      <td>${cours.nom}</td>
      <td>${cours.description}</td>
      <td>${cours.dateDebut}</td>
      <td>${cours.dateFin}</td>
      <td>
        <a href="updateCourse?id=${cours.id}">Modifier</a> |
        <a href="deleteCourse?id=${cours.id}">Supprimer</a>
      </td>
    </tr>
  </c:forEach>
  </tbody>
</table>
<br/>
<a href="createCourse">Ajouter un nouveau Cours</a>
</body>
</html>
