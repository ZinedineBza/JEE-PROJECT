package org.example.spring_boot.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

    @GetMapping("/index")
    public String showIndex() {
        return "index"; // Correspond au fichier /WEB-INF/jsp/index.jsp
    }
}
