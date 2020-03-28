package com.book.store.api.services;

import com.book.store.api.models.Tag;
import com.book.store.api.repositories.TagRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TagService {

    @Autowired
    private TagRepository tagRepository;

    public List<Tag> list() {
        return tagRepository.findAll();
    }

    public void deleteById(long id) {
        tagRepository.deleteById(id);
    }

}