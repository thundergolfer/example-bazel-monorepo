package com.book.store.api.services;

import com.book.store.api.models.Author;
import com.book.store.api.repositories.AuthorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AuthorService {

    @Autowired
    private AuthorRepository authorRepository;

    public List<Author> list() {
        return authorRepository.findAll();
    }

    public Author getById(long id) {
        return authorRepository.findById(id).get();
    }
}
