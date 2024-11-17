<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
    <th>Enseignant</th>
    <th>Salle</th>
    <th>Date de Début</th>
    <th>Date de Fin</th>
    <th>Actions</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="cours" items="${listCourses}">
    <tr>
      <td>${cours.id}</td>
      <td>${cours.nom.nom}</td> <!-- Affichage du nom de la matière -->
      <td>${cours.enseignant.nom}</td> <!-- Affichage du nom de l'enseignant -->
      <td>${cours.salle}</td>
      <td><fmt:formatDate value="${cours.date}" pattern="yyyy-MM-dd" /></td> <!-- Utilisation de cours.date -->

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
