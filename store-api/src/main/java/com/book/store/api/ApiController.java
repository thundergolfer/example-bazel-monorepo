package com.book.store.api;

import com.book.store.api.models.*;
import com.book.store.api.services.AuthorService;
import com.book.store.api.services.BookService;
import com.book.store.api.services.UserService;
import com.book.store.search.EditDistanceRanking;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.net.URI;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

@RestController
@RequestMapping(path = "v1")
public class ApiController {

    @Autowired
    BookService bookService;
    @Autowired
    AuthorService authorService;
    @Autowired
    UserService userService;

    EditDistanceRanking searchService = new EditDistanceRanking();


    @RequestMapping("/")
    public String index() {
        return "👋 Greetings from AntiLibrary! An online world of reading built with Bazel.";
    }

    /*
     * Search 🕵️‍♂️
     * A VERY, VERY basic search endpoint
     */
    @GetMapping("/search")
    List<Book> search(@RequestParam("query") String query) {
        // TODO(Jonathon): Only searches books right now. Should search authors and users also
        List<Book> books = bookService.list();
        int numResults = 5;
        return searchService.rankByTitle(query, books, numResults);
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
     * USER Routes
     */

    @GetMapping("/users")
    List<User> allUsers() {
        return userService.list();
    }

    @GetMapping("/users/{id}")
    User getUser(@PathVariable long id) {
        return userService.getById(id);
    }

    /**
     * POST
     * {
     * 	"username": "XX"
     * }
     */
    @PostMapping("/users")
    public ResponseEntity<Object> addUser(@RequestBody User u) {
        User savedUser = userService.add(u);

        URI location = ServletUriComponentsBuilder
                .fromCurrentRequest().path("/{id}")
                .buildAndExpand(savedUser.getId()).toUri();
        return ResponseEntity.created(location).build();
    }

    @GetMapping("/users/{id}/currently_reading")
    public ResponseEntity<Object> currentlyReading(@PathVariable long id) {
        Optional<Set<UserBookTag>> result = userService.userCurrentlyReading(id);
        if (result.isPresent()) {
            Set<Book> currentlyReading = result.get()
                    .stream()
                    .map(ubt -> ubt.getBook())
                    .collect(Collectors.toSet());
            return ResponseEntity.ok(currentlyReading);
        } else {
            return ResponseEntity
                    .status(HttpStatus.NOT_FOUND)
                    .body("ID DOES NOT EXIST"); // TODO(Jonathon): Improve err msg
        }
    }

    @PutMapping("/users/{id}/currently_reading/{bookId}")
    public ResponseEntity<Object> markCurrentlyReading(@PathVariable long id, @PathVariable long bookId) {
        User user = userService.getById(id);

        Optional<Book> bookResult = bookService.findById(bookId);
        if (!bookResult.isPresent()) {
            return ResponseEntity
                    .status(HttpStatus.NOT_FOUND)
                    .body("BOOK ID DOES NOT EXIST"); // TODO(Jonathon): Improve err msg
        }
        userService.markCurrentlyReading(user, bookResult.get());
        return ResponseEntity.ok().build();
    }

    @DeleteMapping("/users/{id}/currently_reading/{bookId}")
    public ResponseEntity<Object> markNotCurrentlyReading(@PathVariable long id, @PathVariable long bookId) {
        User user = userService.getById(id);
        Optional<Book> bookResult = bookService.findById(bookId);
        if (!bookResult.isPresent()) {
            return ResponseEntity
                    .status(HttpStatus.NOT_FOUND)
                    .body("BOOK ID DOES NOT EXIST"); // TODO(Jonathon): Improve err msg
        }
        userService.markNotCurrentlyReading(user, bookResult.get());
        return ResponseEntity.ok().build();
    }

    @GetMapping("/users/{id}/read")
    public ResponseEntity<Object> read(@PathVariable long id) {
        Optional<Set<UserBookTag>> result = userService.userRead(id);
        if (result.isPresent()) {
            Set<Book> currentlyReading = result.get()
                    .stream()
                    .map(ubt -> ubt.getBook())
                    .collect(Collectors.toSet());
            return ResponseEntity.ok(currentlyReading);
        } else {
            return ResponseEntity
                    .status(HttpStatus.NOT_FOUND)
                    .body("ID DOES NOT EXIST"); // TODO(Jonathon): Improve err msg
        }
    }

    @PutMapping("/users/{id}/read/{bookId}")
    public ResponseEntity<Object> markRead(@PathVariable long id, @PathVariable long bookId) {
        User user = userService.getById(id);

        Optional<Book> bookResult = bookService.findById(bookId);
        if (!bookResult.isPresent()) {
            return ResponseEntity
                    .status(HttpStatus.NOT_FOUND)
                    .body("BOOK ID DOES NOT EXIST"); // TODO(Jonathon): Improve err msg
        }
        userService.markRead(user, bookResult.get());
        return ResponseEntity.ok().build();
    }

    @DeleteMapping("/users/{id}/read/{bookId}")
    public ResponseEntity<Object> markUnread(@PathVariable long id, @PathVariable long bookId) {
        User user = userService.getById(id);
        Optional<Book> bookResult = bookService.findById(bookId);
        if (!bookResult.isPresent()) {
            return ResponseEntity
                    .status(HttpStatus.NOT_FOUND)
                    .body("BOOK ID DOES NOT EXIST"); // TODO(Jonathon): Improve err msg
        }
        userService.markUnread(user, bookResult.get());
        return ResponseEntity.ok().build();
    }

    @GetMapping("/users/{id}/reviews")
    public Set<Review> getReviews(@PathVariable long id) {
        User user = userService.getById(id);
        return userService.listReviews(user);
    }

    @PutMapping("/users/{id}/reviews/book/{bookId}/rating/{rating}")
    public ResponseEntity<Object> putReview(@PathVariable long id, @PathVariable long bookId, @PathVariable float rating) {
        User user = userService.getById(id);
        Book book = bookService.getById(bookId);
        if (rating < 0.0 || rating > 5.0) {
            return ResponseEntity
                    .status(HttpStatus.BAD_REQUEST)
                    .body("Invalid Rating. Value be between 0.0 and 5.0");
        }

        // TODO(Jonathon): Users should not be able to rate books they haven't readØ

        userService.addReview(user, book, round(rating, 1));
        return ResponseEntity.ok().build();
    }

    /*
     * AUTHOR Routes
     */

    @GetMapping("/authors")
    List<Author> allAuthors() {
        return authorService.list();
    }

    @GetMapping("/authors/{id}")
    Author getAuthorById(@PathVariable long id) {
        return authorService.getById(id);
    }

    private static float round(float value, int places) {
        if (places < 0) throw new IllegalArgumentException();

        BigDecimal bd = new BigDecimal(Float.toString(value));
        bd = bd.setScale(places, RoundingMode.HALF_UP);
        return bd.floatValue();
    }
}

