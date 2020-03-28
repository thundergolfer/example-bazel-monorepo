package com.book.store.api.models;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Objects;

// TODO(Jonathon): A (user_id, book_id) combo should have be unique. ie. A user cannot be both reading and want-to-read a single book.

@Entity
public class UserBookTag implements Serializable {

    @Id
    Long id;

    @ManyToOne
    @JoinColumn
    private Book book;

    @ManyToOne
    @JoinColumn
    private User user;

    @ManyToOne
    @JoinColumn
    private Tag tag;

    public UserBookTag() {}

    public Book getBook() {
        return book;
    }

    public String getTag() {
        return tag.getName();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof UserBookTag)) return false;
        UserBookTag that = (UserBookTag) o;
        return Objects.equals(book.getName(), that.book.getName()) &&
                Objects.equals(user.getUsername(), that.user.getUsername()) &&
                Objects.equals(tag, that.tag);
    }

    @Override
    public int hashCode() {
        return Objects.hash(book.getName(), user.getUsername(), tag);
    }
}
