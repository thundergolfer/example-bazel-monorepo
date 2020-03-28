package com.book.store.api.services;

import com.book.store.api.models.User;
import com.book.store.api.models.UserBookTag;
import com.book.store.api.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

    public void deleteById(long id) {
        userRepository.deleteById(id);
    }
}