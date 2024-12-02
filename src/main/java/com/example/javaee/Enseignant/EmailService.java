package com.example.javaee.Enseignant;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender mailSender;

    public void sendResultatEmail(String toEmail, String coursNom, Float note) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(toEmail);
        message.setSubject("Nouveau Résultat pour " + coursNom);
        message.setText("Bonjour,\n\nVotre note pour le cours " + coursNom + " est : " + note + ".\n\nCordialement,\nL'équipe pédagogique");
        mailSender.send(message);
        System.out.println("[EmailService] Email envoyé à: " + toEmail);
    }
}
