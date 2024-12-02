<%@ page import="jeeprojet.application.Modele.Utilisateur" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter un Résultat</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<header id = "headerleft">
    <a href="<%= request.getContextPath() %>/redirectionServlet">
        <img src="${pageContext.request.contextPath}/cyent.png" alt="Logo" class="animated-logo" style="height: 7em;">
    </a>
    <div id="deconnexion">
        <a href="<%= request.getContextPath() %>/logout">Se déconnecter</a>
    </div>
</header>

<h1>Ajouter un Résultat</h1>

<form action="<%= request.getContextPath() %>/addResultat" method="post">
    <div class="form-group">
        <label for="etudiant">Étudiant :</label>
        <select id="etudiant" name="etudiant" onchange="updateMatiereOptions()">
            <c:forEach var="etudiant" items="${etudiants}">
                <option value="${etudiant.email}">${etudiant.nom} ${etudiant.prenom}</option>
            </c:forEach>
        </select>
    </div>

    <div class="form-group">
        <label for="cours">Cours :</label>
        <select id="cours" name="cours">
            <!-- Les matières seront insérées ici via JavaScript -->
        </select>
    </div>

    <div class="form-group">
        <label for="note">Note :</label>
        <input type="text" id="note" name="note" required/>
    </div>

    <div class="form-group">
        <label for="commentaire">Commentaire :</label>
        <textarea id="commentaire" name="commentaire"></textarea>
    </div>

    <div class="form-group">
        <label for="date">Date :</label>
        <input type="date" id="date" name="date" required/>
    </div>

    <div class="form-group">
        <input type="submit" value="Ajouter"/>
    </div>
</form>


        <h1><a href="${pageContext.request.contextPath}/listResultatsEnseignant">Retour à la liste des Résultats</a></h1>
        <br>


<script type="text/javascript">
    function updateMatiereOptions() {
        var etudiantSelect = document.getElementById("etudiant");
        var matiereSelect = document.getElementById("cours");

        // Récupérer l'email de l'étudiant sélectionné
        var selectedEtudiantEmail = etudiantSelect.value;

        // Créer une requête AJAX pour récupérer les matières de l'étudiant
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "<%= request.getContextPath() %>/getMatieresEtudiant?etudiantEmail=" + selectedEtudiantEmail, true);

        xhr.onload = function() {
            if (xhr.status === 200) {
                // Réinitialiser les options de matières
                matiereSelect.innerHTML = '';

                // Ajouter les matières à la liste déroulante
                matiereSelect.innerHTML = xhr.responseText;
            } else {
                console.error("Erreur lors de la récupération des matières");
            }
        };

        xhr.send();
    }
</script>

</body>
</html>
