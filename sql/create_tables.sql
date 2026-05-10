CREATE TABLE IF NOT EXISTS books (
    inventory_number SERIAL PRIMARY KEY,

    author VARCHAR(150) NOT NULL,

    title VARCHAR(200) NOT NULL,

    section VARCHAR(50) NOT NULL
    CHECK (section IN ('технічна', 'художня', 'економічна')),

    publication_year INTEGER
    CHECK (publication_year >= 1900),

    pages INTEGER
    CHECK (pages > 0),

    price NUMERIC(10,2)
    CHECK (price > 0),

    book_type VARCHAR(50) NOT NULL
    CHECK (book_type IN ('посібник', 'книга', 'періодичне видання')),

    copies INTEGER DEFAULT 1
    CHECK (copies >= 1),

    max_borrow_days INTEGER
    CHECK (max_borrow_days > 0)
);

CREATE TABLE IF NOT EXISTS readers (
    reader_ticket SERIAL PRIMARY KEY,

    last_name VARCHAR(100) NOT NULL,

    first_name VARCHAR(100) NOT NULL,

    phone VARCHAR(20) UNIQUE NOT NULL,

    address VARCHAR(255),

    course INTEGER
    CHECK (course BETWEEN 1 AND 4),

    student_group VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS book_issues (
    issue_id SERIAL PRIMARY KEY,

    issue_date DATE NOT NULL,

    reader_ticket INTEGER REFERENCES readers(reader_ticket)
    ON DELETE CASCADE,

    inventory_number INTEGER REFERENCES books(inventory_number)
    ON DELETE CASCADE
);