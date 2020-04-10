package com.book.store.api.services;

import com.book.store.api.models.Book;
import com.book.store.api.models.User;
import com.book.store.api.models.UserBookTag;
import com.book.store.api.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.swing.text.html.Option;
import java.util.List;
import java.util.Optional;
import java.util.Set;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public List<User> list() {
        return userRepository.findAll();
    }

    public Optional<Set<UserBookTag>> userCurrentlyReading(long id) {
        Optional<User> userOpt = userRepository.findById(id);

        if (userOpt.isPresent()) {
            User u = userOpt.get();
            return Optional.of(u.getCurrentlyReadingList());
        } else {
            return Optional.empty();
        }
    }

    public Optional<Set<UserBookTag>> userRead(long id) {
        Optional<User> userOpt = userRepository.findById(id);
        if (userOpt.isPresent()) {
            User u = userOpt.get();
            return Optional.of(u.getReadList());
        } else {
            return Optional.empty();
        }
    }

    public User add(User u) {
        Optional<User> x = userRepository.findByUsername(u.getUsername());
        if (x.isPresent()) {
            // TODO(Jonathon): Throw a proper exception that should be caught by a RestExceptionHandler
            // Ref: https://www.toptal.com/java/spring-boot-rest-api-error-handling
            throw new RuntimeException("Username already exists");
        }
        User savedBook = userRepository.save(u);
        return savedBook;
    }


    public void deleteById(long id) {
        userRepository.deleteById(id);
    }
}