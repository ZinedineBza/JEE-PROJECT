package com.example.javaee;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.mail.javamail.JavaMailSender;

@SpringBootApplication
public class JavaeeApplication {

	public static void main(String[] args) {
		SpringApplication.run(JavaeeApplication.class, args);
	}
	@Bean
	public CommandLineRunner testMailSender(JavaMailSender mailSender) {
		return args -> {
			if (mailSender != null) {
				System.out.println("JavaMailSender bean is available");
			} else {
				System.out.println("JavaMailSender bean is NOT available");
			}
		};
	}
}
