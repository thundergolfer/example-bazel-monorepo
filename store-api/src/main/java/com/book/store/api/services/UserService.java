package com.book.store.api.services;

import com.book.store.api.models.*;
import com.book.store.api.repositories.BookRepository;
import com.book.store.api.repositories.ReviewRepository;
import com.book.store.api.repositories.UserBookTagRepository;
import com.book.store.api.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private UserBookTagRepository userBookTagRepository;
    @Autowired
    private ReviewRepository reviewRepository;

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
        Optional<UserBookTag> optCurrReadingTag = userBookTagRepository.findByUserIdAndBookIdAndTag(
                u.getId(),
                b.getId(),
                Tag.CURRENTLY_READING
        );
        if (optCurrReadingTag.isPresent()) {
            UserBookTag currReadingTag = optCurrReadingTag.get();
            u.removeBookTag(currReadingTag);
            userBookTagRepository.delete(currReadingTag);
        }
        userRepository.save(u);
    }

    public void markUnread(User u, Book b) {
        Optional<UserBookTag> optTag = userBookTagRepository.findByUserIdAndBookIdAndTag(u.getId(), b.getId(), Tag.READ);
        if (optTag.isPresent()) {
            UserBookTag t = optTag.get();
            u.removeBookTag(t);
            userRepository.save(u);
            userBookTagRepository.delete(t);
        }
    }

    public void markCurrentlyReading(User u, Book b) {
        UserBookTag t = new UserBookTag(
                u,
                b,
                Tag.CURRENTLY_READING
        );
        u.addBookTag(t);
        userRepository.save(u);
    }

    public void markNotCurrentlyReading(User u, Book b) {
        Optional<UserBookTag> optTag = userBookTagRepository.findByUserIdAndBookIdAndTag(u.getId(), b.getId(), Tag.CURRENTLY_READING);
        if (optTag.isPresent()) {
            UserBookTag t = optTag.get();
            u.removeBookTag(t);
            userRepository.save(u);
            userBookTagRepository.delete(t);
        }
    }

    public User getById(long id) {
        return userRepository.findById(id).get();
    }

    public Set<Review> listReviews(User u) {
        return u.getReviews();
    }

    public void addReview(User u, Book b, float rating) {
        Optional<Review> optReview = reviewRepository.findByUserIdAndBookId(u.getId(), b.getId());
        Review r;
        if (optReview.isPresent()) {
            r = optReview.get();
        } else {
            r = new Review();
            r.setUser(u);
            r.setBook(b);
            u.addReview(r);
        }
        r.setRating(rating);
        userRepository.save(u);
    }


    public void deleteById(long id) {
        userRepository.deleteById(id);
    }
}
