package com.book.store.api;

import com.book.store.api.models.Book;
import com.book.store.api.services.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@RestController
public class ApiController {

    @Autowired
    BookService bookService;

    @RequestMapping("/")
    public String index() {
        return "Greetings from Spring Boot!";
    }

    @GetMapping("/books")
    List<Book> all() {
        return bookService.list();
    }
}

