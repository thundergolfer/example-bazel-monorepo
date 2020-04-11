package com.book.store.api.models;

import javax.persistence.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import java.util.stream.Collectors;

// TODO(Jonathon): Move towards 'Tripartite Model' for users. Ref: http://habitatchronicles.com/2008/10/the-tripartite-identity-pattern/

@Entity(name = "user_")
public class User implements Serializable {
    @Id
    @GeneratedValue
    private Long id;
    @Column(unique=true)
    private String username;
    @Column(unique=true)
    private String email;


    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private Set<UserBookTag> bookTags = new HashSet<>();

    // standard getters and setters
    public String getUsername() {
        return this.username;
    }
    public String getEmail() {
        return this.email;
    }

    public Set<UserBookTag> getCurrentlyReadingList() {
        return this.bookTags
                .stream()
                .filter(ubt -> ubt.getTag().equals(Tag.CURRENTLY_READING))
                .collect(Collectors.toSet());
    }

    public Set<UserBookTag> getReadList() {
        return this.bookTags
                .stream()
                .filter(ubt -> ubt.getTag().equals(Tag.READ))
                .collect(Collectors.toSet());
    }

    public void addBookTag(UserBookTag t) {
        bookTags.add(t);
    }

    public void removeBookTag(UserBookTag t) {
        boolean removed = bookTags.remove(t);
        if (!removed) {
            // TODO(Jonathon): Remove this. Temp hack
            throw new IllegalArgumentException();
        }
    }

    public Long getId() {
        return this.id;
    }
}
