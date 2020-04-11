package com.book.store.api.models;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.Optional;

@Entity
public class Review {
    @Id
    @GeneratedValue
    private Long id;

    // TODO(Jonathon): DB should enforce user's book reviews are unique
    @ManyToOne(fetch = FetchType.LAZY)
    private User user;
    @ManyToOne
    private Book book;
    private float rating;

    public long getId() { return this.id; }
    public float getRating() {
        return this.rating;
    }

    public Book getBook() {
        return this.book;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public void setRating(float rating) {
        this.rating = rating;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Review )) return false;
        return id != null && id.equals(((Review) o).getId());
    }

    @Override
    public int hashCode() {
        // Ref: https://vladmihalcea.com/the-best-way-to-map-a-onetomany-association-with-jpa-and-hibernate/
        return 31;
    }
}
