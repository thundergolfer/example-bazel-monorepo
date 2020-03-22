package com.book.store.api.models;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.GeneratedValue;
import java.time.LocalDate;

@Entity
public class Book {

    @Id
    @GeneratedValue
    private Long id;
    private String name;
    private String description;
    private String isbn;
    private LocalDate publishDate;
    private float rating;

    // standard constructors

    // standard getters and setters
    public String getName() {
        return this.name;
    }
    public String getDescription() {
        return this.description;
    }
    public String getIsbn() { return this.isbn; }
    public LocalDate getPublishDate() { return this.publishDate; }
    public float getRating() { return this.rating; }
}