<!-- DeleteCours.jsp -->
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Confirmer la Suppression</title>
    <link rel="stylesheet" type="text/css" href="../css/styles.css">
</head>
<body>
<h1>Êtes-vous sûr de vouloir supprimer ce Cours ?</h1>
<form action="<%= request.getContextPath() %>/deleteCourse" method="get">
    <input type="hidden" name="id" value="${course.id}"/>
    <button type="submit">Oui, supprimer ce Cours</button>
    <a href="listCourses">Annuler</a>
</form>
</body>
</html>
