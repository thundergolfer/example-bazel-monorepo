package com.book.store.api.repositories;

import com.book.store.api.models.Tag;
import com.book.store.api.models.UserBookTag;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserBookTagRepository extends JpaRepository<UserBookTag, Long> {
    Optional<UserBookTag> findByUserIdAndBookIdAndTag(long userId, long bookId, Tag t);
}
