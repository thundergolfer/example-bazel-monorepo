TRUNCATE TABLE book;

INSERT INTO book (id, name, isbn, description, publish_date, rating) VALUES
    (1, 'The Wind in the Willows', '1984822179', 'ABCDEFG', date '2001-10-01', 4.5),
    (2, 'Gone Girl', '1984822179', 'ABCDEFG', date '2001-10-01', 4.5);

INSERT INTO author (id, name) VALUES
    (1, 'Sally Rooney'),
    (2, 'David Foster Wallace')