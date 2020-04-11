-- noinspection SqlNoDataSourceInspectionForFile

TRUNCATE TABLE book, author, user_, review, user_book_tag, book_author;

INSERT INTO book (id, name, isbn, description, publish_date, rating) VALUES
    (1, 'The Wind in the Willows', '1984822179', 'ABCDEFG', date '1908-04-01', 4.5), -- Kenneth Grahame
    (2, 'Gone Girl', '1984822179', 'ABCDEFG', date '2001-10-01', 4.5),
    (3, 'The Road to Serfdom', '9780226320618', 'TODO', '1944-10-15', 3.4), -- Friedrich A. Hayek
    (4, 'Creating a Learning Society: A New Approach to Growth, Development, and Social Progress', '9780231152143', 'TODO', '2014-06-24', 3.9), -- Joseph E. Stiglitz
    (5, 'Normal People', '9781984822178', 'TODO', '2018-08-28', 3.4), -- Sally Rooney
    (6, 'Cat''s Cradle', '9780140285604', 'TODO', '1963-01-01', 4.4), -- Kurt Vonnegut
    (7, 'Things Hidden Since the Foundation of the World', '9780804722155', 'TODO', '1987-06-01', 4.0), -- René Girard,
    (8, 'Zero to One: Notes on Startups, or How to Build the Future', '9780804139298', 'TODO', '2014-09-16', 3.5), -- Peter Theil, Blake Masters
    (9, 'Why We''re Polarized', '9781797107653', 'TODO', '2020-01-28', 4.1), -- Ezra Klein
    (10, 'The Sirens of Titan', '9781857988840', 'TODO', '1959-01-01', 4.9), -- Kurt Vonnegut
    (11, 'The Soul of Man Under Socialism', '9781419183041', 'In _The Soul of Man under Socialism_ Oscar Wilde expounds on an anarchist world view. Wilde argues that under capitalism the majority of people spoil their lives by an unhealthy and exaggerated altruism-are forced, indeed, so to spoil them: instead of realizing their true talents, they waste their time solving the social problems caused by capitalism, without taking their common cause away. Thus, caring people seriously and very sentimentally set themselves to the task of remedying the evils that they see in poverty, but their remedies do not cure the disease: they merely prolong it because, the proper aim is to try and reconstruct society on such a basis that poverty will be impossible.', '1891-03-15', 4.5), -- Oscar Wilde
    (12, 'Liar''s Poker', '9780393338690', 'Michael Lewis was fresh out of Princeton and the London School of Economics when he landed a job at Salomon Brothers, one of Wall Street’s premier investment firms. During the next three years, Lewis rose from callow trainee to bond salesman, raking in millions for the firm and cashing in on a modern-day gold rush. Liar’s Poker is the culmination of those heady, frenzied years—a behind-the-scenes look at a unique and turbulent time in American business.', '1989-01-01', 3.2), -- Michael Lewis
    (13, 'Animal Farm', '9780451526342', 'A farm is taken over by its overworked, mistreated animals. With flaming idealism and stirring slogans, they set out to create a paradise of progress, justice, and equality. Thus the stage is set for one of the most telling satiric fables ever penned –a razor-edged fairy tale for grown-ups that records the evolution from revolution against tyranny to a totalitarianism just as terrible.', '1945-08-17', 4.8), -- George Orwell
    (14, 'Notes on Nationalism', '9780241339565', 'In this essay, Orwell discusses the notion of nationalism, and argues that it causes people to disregard common sense and become more ignorant towards factuality. Orwell shows his concern for the social state of Europe, and in a broader sense, the entire world, due to an increasing amount of influence of nationalistic sentiment occurring throughout a large number of countries.', '2012-05-23', 3.5), -- George Orwell
    (15, 'Debt: The First 5,000 Years', '9781933633862', 'Every economics textbook says the same thing: Money was invented to replace onerous and complicated barter systems—to relieve ancient people from having to haul their goods to market. The problem with this version of history? There’s not a shred of evidence to support it. Here anthropologist David Graeber presents a stunning reversal of conventional wisdom. He shows that for more than 5,000 years, since the beginnings of the first agrarian empires, humans have used elaborate credit systems to buy and sell goods—that is, long before the invention of coins or cash. It is in this era, Graeber argues, that we also first encounter a society divided into debtors and creditors. Graeber shows that arguments about debt and debt forgiveness have been at the center of political debates from Italy to China, as well as sparking innumerable insurrections. He also brilliantly demonstrates that the language of the ancient works of law and religion (words like “guilt,” “sin,” and “redemption”) derive in large part from ancient debates about debt, and shape even our most basic ideas of right and wrong. We are still fighting these battles today without knowing it. Debt: The First 5,000 Years is a fascinating chronicle of this little known history—as well as how it has defined human history, and what it means for the credit crisis of the present day and the future of our economy. ', '2011-09-16', 4.4), -- David Graeber
    (16, 'New Dark Age: Technology and the End of the Future', '9781786635488', 'In his brilliant new work, leading artist and writer James Bridle surveys the history of art, technology, and information systems, and reveals the dark clouds that gather over our dreams of the digital sublime.', '2018-07-18', 3.2), -- James Bridle
    (17, 'Friday Black', '9781328911247', 'TODO', '2018-10-23', 3.0), -- Nana Kwame Adjei-Brenyah
    (18, 'The Warmth of Other Suns: The Epic Story of America''s Great Migration', '9780679444329', 'TODO', '2010-09-07', 3.9), -- Isabel Wilkerson
    (19, 'The Sciences of the Artificial', '9780262691918', 'Continuing his exploration of the organization of complexity and the science of design, this new edition of Herbert Simon''s classic work on artificial intelligence adds a chapter that sorts out the current themes and tools -- chaos, adaptive systems, genetic algorithms -- for analyzing complexity and complex systems. There are updates throughout the book as well. These take into account important advances in cognitive psychology and the science of design while confirming and extending the book''s basic thesis: that a physical symbol system has the necessary and sufficient means for intelligent action. The chapter "Economic Reality" has also been revised to reflect a change in emphasis in Simon''s thinking about the respective roles of organizations and markets in economic systems.', '1970-02-28', 3.2), -- Herbert A. Simon
    (20, 'V for Vendetta', '9781401207922', 'Remember, remember the fifth of November...', '1990-01-01', 5.0); -- Alan Moore


INSERT INTO author (id, name, nationality, date_of_birth) VALUES
    (1, 'Sally Rooney', 'Irish', '1991-02-20'),
    (2, 'David Foster Wallace', 'American', '1962-02-21'),
    (3, 'Alan Moore', 'English', '1953-11-18'),
    (4, 'Gillian Flynn', 'American', '1971-02-24'),
    (5, 'Friedrich A. Hayek', 'Austrian-British', '1899-05-8'),
    (6, 'Joseph E. Stiglitz', 'American', '1943-02-9'),
    (7, 'Kurt Vonnegut', 'American', '1922-11-11,'),
    (8, 'René Girard', 'French', '1923-12-25'),
    (9, 'Peter Theil', 'American', '1967-10-11'),
    (10, 'Blake Masters', 'American', '1986-01-01'),
    (11, 'Ezra Klein', 'American', '1984-05-09'),
    (12, 'Oscar Wilde', 'British', '1854-10-16'),
    (13, 'Michael Lewis', 'American', '1960-10-15'),
    (14, 'George Orwell', 'British', '1903-06-25'),
    (15, 'David Graeber', 'American', '1961-02-12'),
    (16, 'Nana Kwame Adjei-Brenyah', 'American', null),
    (17, 'James Bridle', 'British', null), -- born 1980
    (18, 'Herbert A. Simon', 'American', '1916-06-15'),
    (19, 'Isabel Wilkerson', 'American', null), -- born 1961
    (20, 'Kenneth Grahame', 'Scottish', '1859-03-08');

INSERT INTO user_ (id, username, email) VALUES
    (1, 'User1', 'user1@gmail.com'),
    (2, 'User2', 'user2@example.com'),
    (3, 'User3', 'user-the-third@example.com'),
    (4, 'User4', 'us3r_4@hotmail.com');

INSERT INTO user_book_tag (id, user_id, book_id, tag) VALUES
    (1, 2, 1, 'CURRENTLY_READING'),
    (2, 2, 2, 'READ');

INSERT INTO book_author (id, book_id, author_id) VALUES
    (1, 1, 20),
    (2, 2, 4),
    (3, 3, 5),
    (4, 4, 6),
    (5, 5, 1),
    (6, 6, 7),
    (7, 7, 8),
    (8, 8, 9),
    (9, 9, 11),
    (10, 10, 7),
    (11, 11, 12),
    (12, 12, 13),
    (13, 13, 14),
    (14, 14, 14),
    (15, 15, 15),
    (16, 16, 17),
    (17, 17, 16),
    (18, 18, 19),
    (19, 19, 18),
    (20, 20, 3),
    (21, 8, 10);

INSERT INTO review (id, user_id, book_id, rating) VALUES
    (1, 1, 20, 2.5),
    (2, 1, 19, 2.5);
