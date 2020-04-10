package com.book.store.api.models;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.io.Serializable;

@Entity
public class BookAuthor implements Serializable {
    @Id
    Long id;

    @ManyToOne
    @JoinColumn
    private Book book;

    @ManyToOne
    @JoinColumn
    private Author author;

    public Book getBook() {
        return book;
    }
    public Author getAuthor() {
        return author;
    }
}
