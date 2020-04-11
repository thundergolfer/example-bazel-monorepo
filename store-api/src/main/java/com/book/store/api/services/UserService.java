package com.book.store.api.services;

import com.book.store.api.models.Book;
import com.book.store.api.models.Tag;
import com.book.store.api.models.User;
import com.book.store.api.models.UserBookTag;
import com.book.store.api.repositories.BookRepository;
import com.book.store.api.repositories.UserBookTagRepository;
import com.book.store.api.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.Set;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private UserBookTagRepository userBookTagRepository;
    @Autowired
    private BookRepository bookRepository;

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

    public void markRead(User u, Book b) {
        u.addBookTag(new UserBookTag(
                u,
                b,
                Tag.READ
        ));
        u.removeBookTag(new UserBookTag(
                u,
                b,
                Tag.CURRENTLY_READING
        ));
        userRepository.save(u);
    }

    public void markUnread(User u, Book b) {
        UserBookTag t = new UserBookTag(
                u,
                b,
                Tag.READ
        );
        u.removeBookTag(t);
        userRepository.save(u);
    }

    public void markCurrentlyReading(User u, Book b) {
        UserBookTag t = new UserBookTag(
                u,
                b,
                Tag.CURRENTLY_READING
        );
        u.addBookTag(t);
//        b.addBookTag(t);
        userRepository.save(u);
//        bookRepository.save(b);
    }

    public void markNotCurrentlyReading(User u, Book b) {
        UserBookTag t = userBookTagRepository.findByUserIdAndBookId(u.getId(), b.getId());
        u.removeBookTag(t);
        b.removeBookTag(t);
        userRepository.save(u);
        bookRepository.save(b);
        userBookTagRepository.delete(t);
    }

    public User getById(long id) {
        return userRepository.findById(id).get();
    }


    public void deleteById(long id) {
        userRepository.deleteById(id);
    }
}
