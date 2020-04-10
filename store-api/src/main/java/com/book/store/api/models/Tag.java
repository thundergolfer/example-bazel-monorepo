package com.book.store.api.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.GeneratedValue;

@Entity
public class Tag {
    public static final String CURRENTLY_READING = "CURRENTLY_READING";
    public static final String READ = "READ";
    public static final String WANT_TO_READ = "WANT_TO_READ";


    @Id
    @GeneratedValue
    private Long id;
    @Column(unique=true)
    private String name;

    private Tag() {}

    private Tag(String name) {
        this.name = name;
    }

    // standard getters and setters
    public String getName() {
        return this.name;
    }

    public static Tag fromString(String s) {
        switch (s) {
            case CURRENTLY_READING:
            case WANT_TO_READ:
            case READ:
                return new Tag(s);
            default: throw new IllegalArgumentException("Invalid Tag type");
        }
    }

}
