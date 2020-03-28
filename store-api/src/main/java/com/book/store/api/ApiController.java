package com.book.store.api;

import com.book.store.api.models.Author;
import com.book.store.api.models.Book;
import com.book.store.api.services.AuthorService;
import com.book.store.api.services.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;
import java.util.List;

@RestController
public class ApiController {

    @Autowired
    BookService bookService;
    @Autowired
    AuthorService authorService;


    @RequestMapping("/")
    public String index() {
        return "👋 Greetings from AntiLibrary! An online world of reading built with Bazel.";
    }

    /*
     * BOOK Routes
     */

    @GetMapping("/books")
    List<Book> allBooks() {
        return bookService.list();
    }

    @DeleteMapping("/books/{id}")
    public void deleteStudent(@PathVariable long id) {
        bookService.deleteById(id);
    }

    /**
     * POST
     * {
     * 	"name": "XX YY XX - Part 4",
     * 	"isbn": "123",
     * 	"description": "A description",
     * 	"publishDate": "2020-01-01",
     * 	"rating": 4.5
     * }
     */
    @PostMapping("/books")
    public ResponseEntity<Object> addBook(@RequestBody Book b) {
        Book savedBook = bookService.add(b);

        URI location = ServletUriComponentsBuilder
                .fromCurrentRequest().path("/{id}")
                .buildAndExpand(savedBook.getId()).toUri();

        return ResponseEntity.created(location).build();
    }

    /*
     * AUTHOR Routes
     */

    @GetMapping("/authors")
    List<Author> allAuthors() {
        return authorService.list();
    }
}

