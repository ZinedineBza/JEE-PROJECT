<%@ page import="jeeprojet.application.Modele.Utilisateur" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
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
<head>
  <title>Liste des Cours</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<nav>
  <a href="<%= request.getContextPath() %>/logout">Se déconnecter</a>
</nav>
<h1>Liste des Cours</h1>

<div>
  <label for="matiere-select">Matière:</label>
  <select id="matiere-select">
    <option value="">Sélectionnez une matière</option>
    <c:forEach var="matiere" items="${matieres}">
      <option value="${matiere}">${matiere}</option>
    </c:forEach>
  </select>
</div>

<div id="classes-container" style="display: none;">
  <label for="classe-select">Classe:</label>
  <select id="classe-select">
    <option value="">Sélectionnez une classe</option>
    <c:forEach var="classe" items="${classes}">
      <option value="${classe}">${classe}</option>
    </c:forEach>
  </select>
</div>

<div id="eleves-container" style="display: none;">
  <h2>Élèves</h2>
  <table border="1" id="eleves-table">
    <thead>
    <tr>
      <th>Nom</th>
      <th>Prénom</th>
    </tr>
    </thead>
    <tbody>
    </tbody>
  </table>
</div>

<div id="courses-container" style="display: none;">
  <h2>Cours</h2>
  <table border="1" id="courses-table">
    <thead>
    <tr>
      <th>Nom du cours</th>
      <th>Professeur</th>
      <th>Emploi du temps</th>
    </tr>
    </thead>
    <tbody>
    </tbody>
  </table>
</div>

<script>
  $(document).ready(function () {
    // Quand la matière est sélectionnée
    $('#matiere-select').change(function () {
      var matiereId = $(this).val(); // Récupérer la matière sélectionnée

      if (matiereId) {
        // Requête AJAX pour récupérer les classes
        $.ajax({
          url: '<%= request.getContextPath() %>/getClasses', // URL de la servlet qui renvoie les classes
          method: 'GET',
          data: { matiereId: matiereId }, // Envoyer la matière sélectionnée
          success: function (response) {
            // Vider le select des classes et le réinitialiser
            $('#classe-select').empty().append(response); // Réponse contient des options HTML

            // Afficher la section des classes
            $('#classes-container').show();
          },
          error: function(xhr, status, error) {
            console.log("Erreur AJAX:", status, error);
          }
        });

        // Requête AJAX pour récupérer les cours
        $.ajax({
          url: '<%= request.getContextPath() %>/getCourses', // URL de la servlet qui renvoie les cours
          method: 'GET',
          data: { matiereId: matiereId }, // Envoyer la matière sélectionnée
          success: function (response) {
            var tbody = $('#courses-table tbody');
            tbody.empty(); // Vider la table des cours

            // Ajouter les cours reçus (attendons un tableau HTML ou un format similaire)
            tbody.append(response); // La réponse doit être une ligne de tableau HTML <tr><td>...</td></tr>
            $('#courses-container').show(); // Afficher la section des cours
          },
          error: function(xhr, status, error) {
            console.log("Erreur AJAX:", status, error);
          }
        });

      } else {
        // Cacher la section des classes, des élèves et des cours si aucune matière n'est sélectionnée
        $('#classes-container').hide();
        $('#eleves-container').hide();
        $('#courses-container').hide();
      }
    });

    // Quand la classe est sélectionnée
    $('#classe-select').change(function () {
      var classeId = $(this).val(); // Récupérer la classe sélectionnée
      var matiereId = $('#matiere-select').val(); // Récupérer la matière sélectionnée

      if (classeId && matiereId) {
        $.ajax({
          url: '<%= request.getContextPath() %>/getEleves', // URL de la servlet qui renvoie les élèves
          method: 'GET',
          data: { matiereId: matiereId, classeId: classeId }, // Envoyer matière et classe
          success: function (response) {
            var tbody = $('#eleves-table tbody');
            tbody.empty(); // Vider la table des élèves

            // Ajouter les élèves reçus (attendons un tableau HTML ou un format similaire)
            tbody.append(response); // La réponse doit être une ligne de tableau HTML <tr><td>...</td></tr>
            $('#eleves-container').show(); // Afficher la section des élèves
          },
          error: function(xhr, status, error) {
            console.log("Erreur AJAX:", status, error);
          }
        });
      } else {
        // Cacher la section des élèves si aucune classe n'est sélectionnée
        $('#eleves-container').hide();
      }

    });
    $('#courses-table').on('click', '.emploi-du-temps-btn', function () {
      var profEmail = $(this).data('email'); // Récupérer l'email du professeur
      if (profEmail) {
        window.location.href = '<%= request.getContextPath() %>/emploiDuTempsProf?email=' + profEmail;
      }
    });
  });

</script>


</body>
</html>
