<!-- createCourse.jsp -->
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Créer un Cours</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<h1>Ajouter un nouveau Cours</h1>
<form action="<%= request.getContextPath() %>/createCourse" method="post">
    <div class="form-group">
    <label for="emailProf">Email du Professeur:</label>
    <input type="email" name="emailProf" id="emailProf" required/>
    </div>

    <div class="form-group">
    <label for="nom">Nom de la Matière:</label>
    <input type="text" name="nom" id="nom" required/>
    </div>

    <div class="form-group">
    <label for="salle">Salle:</label>
    <input type="text" name="salle" id="salle" required/>
    </div>

    <div class="form-group">
    <label for="date">Date:</label>
    <input type="date" name="date" id="date" required/>
    </div>

    <div class="form-group">
    <label for="horaire">Horaire:</label>
    <input type="time" name="horaire" id="horaire" required/>
    </div>

    <div class="form-group">
    <button type="submit">Ajouter le Cours</button>
    </div>
</form>
</body>
</html>
