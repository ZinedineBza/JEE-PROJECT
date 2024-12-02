package jeeprojet.application.Util;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.SQLException;
import java.sql.DatabaseMetaData;

@WebServlet("/init")
public class ExecuteSQLFile extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String url = "jdbc:mysql://localhost:3306/";
        String dbName = "javaee"; // Votre base de données cible
        String username = "root"; // Utilisateur MySQL
        String password = ""; // Mot de passe MySQL
        String sqlFilePath = getServletContext().getRealPath("/WEB-INF/javaee.sql"); // Utilisation du chemin relatif
        String triggersFilePath = getServletContext().getRealPath("/WEB-INF/triggers.sql"); // Script des triggers
        System.out.println("Tentative de création et initialisation de la base de données");

        try {
            // Charger le driver JDBC pour MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Se connecter à la base de données
            Connection connection = DriverManager.getConnection(url, username, password);

            // Vérifier si la base de données existe déjà
            if (databaseExists(connection, dbName)) {
                System.out.println("La base de données existe déjà.");
                response.getWriter().write("La base de données existe déjà.");
            } else {
                // Créer la base de données si elle n'existe pas
                Statement statement = connection.createStatement();
                statement.execute("CREATE DATABASE " + dbName);
                System.out.println("Base de données créée avec succès.");

                // Sélectionner la base de données nouvellement créée
                statement.execute("USE " + dbName);

                // Lire et exécuter le fichier SQL principal
                executeSQLScript(statement, sqlFilePath);

                // Lire et exécuter le script des triggers
                executeSQLScriptWithDelimiters(statement, triggersFilePath);

                // Fermer la connexion
                statement.close();
                System.out.println("Base de données initialisée avec succès.");
                response.getWriter().write("La base de données a été créée et initialisée avec succès.");
            }

            connection.close();
        } catch (ClassNotFoundException | SQLException | IOException e) {
            e.printStackTrace();
            System.out.println("Erreur lors de l'exécution du script SQL");
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erreur lors de l'exécution du script SQL");
        }
    }

    // Méthode pour vérifier si la base de données existe déjà
    private boolean databaseExists(Connection connection, String dbName) throws SQLException {
        DatabaseMetaData metaData = connection.getMetaData();
        try (var rs = metaData.getCatalogs()) {
            while (rs.next()) {
                if (dbName.equals(rs.getString(1))) {
                    return true; // La base de données existe
                }
            }
        }
        return false; // La base de données n'existe pas
    }

    // Méthode pour exécuter un script SQL depuis un fichier
    private void executeSQLScript(Statement statement, String filePath) throws IOException, SQLException {
        BufferedReader reader = new BufferedReader(new FileReader(filePath));
        StringBuilder sqlScript = new StringBuilder();
        String line;

        // Lire le fichier SQL et construire le script complet
        while ((line = reader.readLine()) != null) {
            sqlScript.append(line).append("\n");

            // Exécuter le script lorsque le délimiteur standard est atteint
            if (line.trim().endsWith(";")) {
                String sqlStatement = sqlScript.toString().trim();
                if (!sqlStatement.isEmpty()) {
                    statement.execute(sqlStatement);
                }
                sqlScript.setLength(0); // Réinitialiser le script pour la prochaine instruction
            }
        }

        // Exécuter tout restant du script (au cas où il n'y aurait pas de point-virgule à la fin)
        String remainingSQL = sqlScript.toString().trim();
        if (!remainingSQL.isEmpty()) {
            statement.execute(remainingSQL);
        }

        reader.close();
    }

    // Méthode pour exécuter un script SQL avec délimiteurs
    private void executeSQLScriptWithDelimiters(Statement statement, String filePath) throws IOException, SQLException {
        BufferedReader reader = new BufferedReader(new FileReader(filePath));
        StringBuilder sqlScript = new StringBuilder();
        String line;
        String delimiter = "$$";  // Délimiteur par défaut

        // Lire le fichier SQL et gérer les délimiteurs
        while ((line = reader.readLine()) != null) {
            if (line.trim().equalsIgnoreCase("DELIMITER $$")) {
                continue; // Ignorer les lignes contenant uniquement "DELIMITER $$"
            }if (line.trim().equals("$$")) {
                String sqlStatement = sqlScript.toString().trim();
                if (!sqlStatement.isEmpty()) {
                    statement.execute(sqlStatement);
                }
                sqlScript.setLength(0); // Réinitialiser le script pour la prochaine instruction
            }else {
                sqlScript.append(line).append("\n");
            }

        }

        // Exécuter tout restant du script (au cas où il n'y aurait pas de point-virgule à la fin)
        String remainingSQL = sqlScript.toString().trim();
        if (!remainingSQL.isEmpty()) {
            statement.execute(remainingSQL);
        }

        reader.close();
    }
}
