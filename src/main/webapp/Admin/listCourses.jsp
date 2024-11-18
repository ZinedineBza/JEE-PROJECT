<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
  <title>Liste des Cours</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
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
      <td>${cours.nom.nom}</td>
      <td>${cours.enseignant.nom}</td>
      <td>${cours.salle}</td>
      <td>${cours.id.date}</td>

      <td>
        <a href="<%= request.getContextPath() %>/updateCourse?id=${cours.id}">Modifier</a> |
        <a href="<%= request.getContextPath() %>/deleteCourse?id=${cours.id}">Supprimer</a>
      </td>
    </tr>
  </c:forEach>
  </tbody>
</table>
<br/>
<a href="<%= request.getContextPath() %>/createCourse">Ajouter un nouveau Cours</a>
</body>
</html>
