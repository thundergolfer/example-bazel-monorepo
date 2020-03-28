package com.book.store.api.models;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.GeneratedValue;

@Entity
public class Tag {
    public static String CURRENTLY_READING = "CURRENTLY_READING";
    public static String READ = "READ";
    public static String WANT_TO_READ = "WANT_TO_READ";


    @Id
    @GeneratedValue
    private Long id;
    private String name;

    // standard constructors

    // standard getters and setters
    public String getName() {
        return this.name;
    }
}
