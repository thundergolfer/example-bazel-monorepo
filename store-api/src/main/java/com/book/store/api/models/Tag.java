package com.book.store.api.models;

public enum Tag {
    CURRENTLY_READING("CURRENTLY_READING"), READ("READ");

    private String name;

    private Tag(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}
