<!-- updateCourse.jsp -->
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Modifier le Cours</title>
  <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<h1>Modifier le Cours</h1>
<form action="updateCourse" method="post">
  <input type="hidden" name="id" value="${course.id}"/>

  <label for="nom">Nom du Cours:</label>
  <input type="text" name="nom" id="nom" value="${course.nom}" required/><br/><br/>

  <label for="description">Description:</label>
  <textarea name="description" id="description" required>${course.description}</textarea><br/><br/>

  <label for="dateDebut">Date de Début:</label>
  <input type="date" name="dateDebut" id="dateDebut" value="${course.dateDebut}" required/><br/><br/>

  <label for="dateFin">Date de Fin:</label>
  <input type="date" name="dateFin" id="dateFin" value="${course.dateFin}" required/><br/><br/>

  <button type="submit">Mettre à jour le Cours</button>
</form>
</body>
</html>
