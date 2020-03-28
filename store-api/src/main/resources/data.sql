TRUNCATE TABLE book, author, user_, tag, user_book_tag;

INSERT INTO book (id, name, isbn, description, publish_date, rating) VALUES
    (1, 'The Wind in the Willows', '1984822179', 'ABCDEFG', date '2001-10-01', 4.5),
    (2, 'Gone Girl', '1984822179', 'ABCDEFG', date '2001-10-01', 4.5);

INSERT INTO author (id, name) VALUES
    (1, 'Sally Rooney'),
    (2, 'David Foster Wallace');

INSERT INTO user_ (id, username) VALUES
    (1, 'User1'),
    (2, 'User2'),
    (3, 'User3'),
    (4, 'User4');

INSERT INTO tag (id, name) VALUES
    (1, 'CURRENTLY_READING'),
    (2, 'READ'),
    (3, 'WANTS_TO_READ');

INSERT INTO user_book_tag (id, user_id, book_id, tag_id) VALUES
    (1, 2, 1, 1),
    (2, 2, 2, 3);