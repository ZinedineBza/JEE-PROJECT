package jeeprojet.application.Util;

import jeeprojet.application.Modele.DAO.UtilisateurDAO;
import org.mindrot.jbcrypt.BCrypt;

import java.security.SecureRandom;

public class GenerateUser {
    private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    private static final String SPECIAL_CHARACTERS = "!@#$%^&*()_-+=<>?/{}~|";
    private static final int PSEUDO_LENGTH = 8;
    private static final int PASSWORD_LENGTH = 12;

    private UtilisateurDAO utilisateurDAO = new UtilisateurDAO();
    public String generatePseudo(String prenom, String nom) {
        String basePseudo = prenom.substring(0, 1) + nom.substring(0, Math.min(5, nom.length())).toLowerCase();
        String pseudo = basePseudo;
        int count = 1;

        while (utilisateurDAO.pseudoExists(pseudo)) {
            pseudo = basePseudo + count;
            count++;
        }

        return pseudo;
    }

    public String generateSecurePassword(String pseudo, String email) throws Exception {
        String password = generateRandomString(PASSWORD_LENGTH - 2);
        password += SPECIAL_CHARACTERS.charAt(new SecureRandom().nextInt(SPECIAL_CHARACTERS.length()));
        password += SPECIAL_CHARACTERS.charAt(new SecureRandom().nextInt(SPECIAL_CHARACTERS.length()));
        GMailer mail = new GMailer();
        mail.sendMail("Votre compte a été créé","Votre compte vient d'être créé voici les informations vous permettant d'y acceder : \nidentifiant : " + pseudo +"\nmot de passe : "+password,email);

        // Hash du mot de passe
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
        return hashedPassword;
    }

    private String generateRandomString(int length) {
        SecureRandom random = new SecureRandom();
        StringBuilder sb = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            sb.append(CHARACTERS.charAt(random.nextInt(CHARACTERS.length())));
        }
        return sb.toString();
    }

    public String generateSecurePassword(String email) throws Exception {String password = generateRandomString(PASSWORD_LENGTH - 2);
        password += SPECIAL_CHARACTERS.charAt(new SecureRandom().nextInt(SPECIAL_CHARACTERS.length()));
        password += SPECIAL_CHARACTERS.charAt(new SecureRandom().nextInt(SPECIAL_CHARACTERS.length()));
        GMailer mail = new GMailer();
        mail.sendMail("Nouveau mot de passe","Voici votre nouveau mot de passe : "+password,email);

        // Hash du mot de passe
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
        return hashedPassword;
    }
}
