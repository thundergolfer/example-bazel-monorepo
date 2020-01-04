package com.book.store.api;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;

@RestController
public class ApiController {

    @RequestMapping("/")
    public String index() {
        return "Greetings from Spring Boot!";
    }
}

