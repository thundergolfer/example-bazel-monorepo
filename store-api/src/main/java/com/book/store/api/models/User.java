package com.book.store.api.models;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

// TODO(Jonathon): Move towards 'Tripartite Model' for users. Ref: http://habitatchronicles.com/2008/10/the-tripartite-identity-pattern/

@Entity(name = "user_")
public class User {
    @Id
    @GeneratedValue
    private Long id;
    private String username;

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private Set<UserBookTag> bookTags = new HashSet<>();

    // standard getters and setters
    public String getUsername() {
        return this.username;
    }

    public Set<UserBookTag> getCurrentlyReadingList() {
        // TODO(Jonathon): Should filter to the 'CURRENTLY_READING' tag only
        return this.bookTags;
    }
}
