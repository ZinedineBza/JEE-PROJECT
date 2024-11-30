<%@ page import="jeeprojet.application.Modele.Utilisateur" %>
<!-- updateCourse.jsp -->
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%
  // Récupérer l'utilisateur de la session
  Utilisateur utilisateur = (Utilisateur) session.getAttribute("user");
  String role = "";

  if (utilisateur == null) {
    response.sendRedirect( request.getContextPath() + "/redirectionServlet");
  } else {
    role = utilisateur.getRole();
  }
%>
<html>
<head>
  <title>Modifier le Cours</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<nav>
  <a href="<%= request.getContextPath() %>/logout">Se déconnecter</a>
</nav>
<h1>Modifier le Cours</h1>
<form action="<%= request.getContextPath() %>/updateCourse" method="post">
  <div class="form-group">
  <label for="matiere">Nom du Cours:</label>
  <input type="text" name="matiere" id="matiere2" value="${cours.nom}" disabled/><br/>
    <input type="text" name="matiere" id="matiere" value="${cours.nom}" hidden/>
  </div>

  <div class="form-group">
  <label for="enseignant">enseignant:</label>
  <input name="enseignant" id="enseignant2" value="${cours.id.enseignant}"disabled><br/>
    <input name="enseignant" id="enseignant" value="${cours.id.enseignant}" hidden/>
  </div>

  <div class="form-group">
  <label for="date">Date:</label>
  <input type="date" name="date" id="date" value="${cours.id.date}" required/><br/>
    <input type="date" name="dateancienne" id="dateancienne" value="${cours.id.date}" hidden/>
  </div>

  <div class="form-group">
  <label for="horaire">Horaire:</label>
  <input type="time" name="horaire" id="horaire" value="${cours.id.horaire}" required/><br/>
    <input type="time" name="horaireancienne" id="horaireancienne" value="${cours.id.horaire}" hidden/>
  </div>

  <div class="form-group">
    <label for="salle">Salle:</label>
    <input type="text" name="salle" id="salle" value="${cours.salle}" required>
  </div>

  <div class="form-group">
  <button type="submit">Mettre à jour le Cours</button>
  </div>
</form>
<div style="float: right">
    <form action="deleteCourse" method="post">
      <input type="hidden" name="enseignantEmail" value="${cours.id.enseignant}">
      <input type="hidden" name="date" value="${cours.id.date}">
      <input type="hidden" name="horaire" value="${cours.id.horaire}">
      <div class="form-group">
      <button type="submit">Supprimer le cours</button>
      </div>
    </form>

</div>

</body>
</html>
