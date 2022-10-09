INSERT INTO genres (name)
VALUES ('Economics'),
    ('Computer science');
INSERT INTO authors (name, surname)
VALUES ('Randall', 'Holcombe'),
    ('Frederic', 'Bastiat'),
    ('Henry', 'Hazlitt'),
    ('John', 'Keynes'),
    ('Robert', 'Martin');
INSERT INTO books (title, published_at, author_id, genre_id)
VALUES (
        'Advanced Introduction to the Austrian School of Economics',
        '2014-01-01',
        (
            SELECT a.id
            FROM authors as a
            WHERE a.name = 'Randall'
                AND a.surname = 'Holcombe'
        ),
        (
            SELECT g.id
            FROM genres as g
            WHERE g.name = 'Economics'
        )
    ),
    (
        'What is seen and what is not seen',
        '1850-01-01',
        (
            SELECT a.id
            FROM authors as a
            WHERE a.name = 'Frederic'
                AND a.surname = 'Bastiat'
        ),
        (
            SELECT g.id
            FROM genres as g
            WHERE g.name = 'Economics'
        )
    ),
    (
        'Economics in One Lesson',
        '1946-01-01',
        (
            SELECT a.id
            FROM authors as a
            WHERE a.name = 'Henry'
                AND a.surname = 'Hazlitt'
        ),
        (
            SELECT g.id
            FROM genres as g
            WHERE g.name = 'Economics'
        )
    ),
    (
        'The General Theory of Employment, Interest, and Money',
        '1936-01-01',
        (
            SELECT a.id
            FROM authors as a
            WHERE a.name = 'John'
                AND a.surname = 'Keynes'
        ),
        (
            SELECT g.id
            FROM genres as g
            WHERE g.name = 'Economics'
        )
    ),
    (
        'Clean Code',
        '2008-01-08',
        (
            SELECT a.id
            FROM authors as a
            WHERE a.name = 'Robert'
                AND a.surname = 'Martin'
        ),
        (
            SELECT g.id
            FROM genres as g
            WHERE g.name = 'Computer science'
        )
    ),
    (
        'Clean Architecture',
        '2017-01-01',
        (
            SELECT a.id
            FROM authors as a
            WHERE a.name = 'Robert'
                AND a.surname = 'Martin'
        ),
        (
            SELECT g.id
            FROM genres as g
            WHERE g.name = 'Computer science'
        )
    );