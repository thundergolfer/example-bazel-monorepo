package com.book.store.api.repositories;

import com.book.store.api.models.Tag;
import com.book.store.api.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface TagRepository extends JpaRepository<Tag, Long> {
    public Tag findByName(String name);
}
