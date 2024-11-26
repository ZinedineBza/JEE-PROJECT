<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter un Résultat</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>

    <h1>Ajouter un Résultat</h1>        

    <form action="<%= request.getContextPath() %>/addResultat" method="post">
        <div class="form-group">
            <label for="etudiant">Étudiant :</label>
            <select id="etudiant" name="etudiant">
                <c:forEach var="etudiant" items="${etudiants}">
                    <option value="${etudiant.email}">${etudiant.nom} ${etudiant.prenom}</option>
                </c:forEach>
            </select>
        </div>
        
        <div class="form-group">
            <label for="cours">Cours :</label>
            <select id="cours" name="cours">
                <c:forEach var="matiere" items="${matieres}">
                    <option value="${matiere.nom}">${matiere.nom}</option>
                </c:forEach>
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


        <h1><a href="${pageContext.request.contextPath}/listResultats">Retour à la liste des Résultats</a></h1>
        <br>
        <h1><a href="${pageContext.request.contextPath}/redirectionServlet">Retour Accueil</a></h1>

</body>
</html>
