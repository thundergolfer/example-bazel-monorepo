package com.book.store.api.models;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.GeneratedValue;
import java.time.LocalDate;
import java.util.Optional;

@Entity
public class Author {
    @Id
    @GeneratedValue
    private Long id;
    private String name;

    // Helpful for author disambiguation
    private String nationality;
    private LocalDate dateOfBirth;

    // standard getters and setters
    public String getName() {
        return this.name;
    }
    public Optional<LocalDate> getDateOfBirth() { return Optional.ofNullable(this.dateOfBirth); }
}
