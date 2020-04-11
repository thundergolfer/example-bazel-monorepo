package com.book.store.api.models;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;
import java.util.stream.Stream;

@Converter(autoApply = true)
public class TagConverter implements AttributeConverter<Tag, String> {
    @Override
    public String convertToDatabaseColumn(Tag tag) {
        if (tag == null) {
            return null;
        }
        return tag.getName();
    }

    @Override
    public Tag convertToEntityAttribute(String name) {
        if (name == null) {
            return null;
        }
        return Stream.of(Tag.values())
                .filter(t -> t.getName().equals(name))
                .findFirst()
                .orElseThrow(IllegalArgumentException::new);
    }
}
