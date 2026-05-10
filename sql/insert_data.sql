INSERT INTO books
(author, title, section, publication_year, pages, price, book_type, copies, max_borrow_days)
VALUES
('Robert Martin', 'Clean Code', 'технічна', 2008, 464, 850.00, 'книга', 4, 30),

('Thomas Cormen', 'Algorithms', 'технічна', 2005, 1312, 1200.00, 'посібник', 3, 45),

('George Orwell', '1984', 'художня', 2003, 320, 300.00, 'книга', 5, 20),

('Taras Shevchenko', 'Кобзар', 'художня', 2001, 250, 280.00, 'книга', 6, 25),

('Stephen Hawking', 'Brief History of Time', 'технічна', 2010, 212, 500.00, 'посібник', 2, 30),

('Adam Smith', 'Economics Basics', 'економічна', 2015, 450, 650.00, 'книга', 4, 30),

('Financial Times', 'Business Weekly', 'економічна', 2022, 120, 150.00, 'періодичне видання', 10, 7),

('National Geographic', 'Science World', 'технічна', 2021, 90, 130.00, 'періодичне видання', 8, 7),

('J.K. Rowling', 'Harry Potter', 'художня', 2007, 500, 450.00, 'книга', 7, 25),

('Erich Gamma', 'Design Patterns', 'технічна', 2002, 395, 780.00, 'посібник', 3, 40),

('Paulo Coelho', 'Alchemist', 'художня', 2004, 180, 220.00, 'книга', 5, 15),

('John Keynes', 'Macro Economics', 'економічна', 2009, 600, 900.00, 'посібник', 2, 35),

('Forbes', 'Finance Today', 'економічна', 2020, 85, 110.00, 'періодичне видання', 12, 7),

('Andrew Tanenbaum', 'Computer Networks', 'технічна', 2018, 960, 1100.00, 'посібник', 4, 40);


INSERT INTO readers
(last_name, first_name, phone, address, course, student_group)
VALUES
('Bolokh', 'Andrii', '+380501111111', 'Kyiv', 3, 'IPZ-31'),

('Shevchenko', 'Ivan', '+380502222222', 'Lviv', 2, 'KN-21'),

('Petrenko', 'Olena', '+380503333333', 'Odesa', 1, 'IT-11'),

('Koval', 'Maksym', '+380504444444', 'Dnipro', 4, 'IPZ-41'),

('Tkachenko', 'Anna', '+380505555555', 'Kharkiv', 3, 'KN-32'),

('Bondarenko', 'Yulia', '+380506666666', 'Kyiv', 2, 'IT-22'),

('Melnyk', 'Dmytro', '+380507777777', 'Vinnytsia', 1, 'IPZ-12'),

('Sydorenko', 'Iryna', '+380508888888', 'Chernihiv', 4, 'KN-42'),

('Kravets', 'Oleh', '+380509999999', 'Poltava', 3, 'IT-31');


INSERT INTO book_issues
(issue_date, reader_ticket, inventory_number)
VALUES
('2025-01-10', 1, 2),
('2025-01-12', 2, 3),
('2025-01-15', 3, 5),
('2025-01-18', 4, 1),
('2025-01-20', 5, 10),
('2025-01-25', 6, 7),
('2025-02-01', 7, 4),
('2025-02-03', 8, 12),
('2025-02-05', 9, 14),
('2025-02-10', 1, 6),
('2025-02-12', 2, 8);