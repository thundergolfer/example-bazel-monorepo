package com.book.store.api.models;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;
import java.util.stream.Collectors;

@Entity
public class Book {

    @Id
    @GeneratedValue
    private Long id;
    private String name;
    @Column(length = 8192)
    private String description;
    private String isbn;
    private LocalDate publishDate;
    private float rating;

    @OneToMany(mappedBy = "book", cascade = CascadeType.ALL)
    private Set<BookAuthor> authors = new HashSet<>();

    @OneToMany(mappedBy = "book", cascade = CascadeType.ALL)
    private Set<UserBookTag> bookTags = new HashSet<>();

    // standard getters and setters
    public Long getId() { return this.id; }
    public String getName() {
        return this.name;
    }
    public String getDescription() {
        return this.description;
    }
    public String getIsbn() { return this.isbn; }
    public LocalDate getPublishDate() { return this.publishDate; }
    public float getRating() { return this.rating; }

    public Set<Author> getAuthors() { return this.authors.stream().map(BookAuthor::getAuthor).collect(Collectors.toSet()); }
}
