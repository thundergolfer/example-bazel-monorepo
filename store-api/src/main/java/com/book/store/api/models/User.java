package com.book.store.api.models;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;
import java.util.stream.Collectors;

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

    public Long getId() {
        return this.id;
    }
}
