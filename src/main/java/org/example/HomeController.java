package org.example;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api")
public class HomeController {

    @GetMapping("/hello")
    public String helloWorld() {
        return "Hello, World!";
    }

    // Add more endpoints based on your requirements
}