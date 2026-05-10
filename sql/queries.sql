-- 1
SELECT title, publication_year
FROM books
WHERE publication_year > 2001
ORDER BY title;


-- 2
SELECT book_type, COUNT(*) AS total_books
FROM books
GROUP BY book_type;


-- 3
SELECT DISTINCT r.last_name, r.first_name
FROM readers r
JOIN book_issues bi
ON r.reader_ticket = bi.reader_ticket
JOIN books b
ON bi.inventory_number = b.inventory_number
WHERE b.book_type = 'посібник'
ORDER BY r.last_name;


-- 4
SELECT *
FROM books
WHERE section = 'технічна';


-- 5
SELECT
    b.title,
    bi.issue_date,
    bi.issue_date + (b.max_borrow_days || ' days')::INTERVAL AS return_deadline
FROM book_issues bi
JOIN books b
ON bi.inventory_number = b.inventory_number;


-- 6
SELECT
    section,

    COUNT(CASE WHEN book_type = 'посібник' THEN 1 END) AS tutorials,

    COUNT(CASE WHEN book_type = 'книга' THEN 1 END) AS books,

    COUNT(CASE WHEN book_type = 'періодичне видання' THEN 1 END) AS magazines

FROM books
GROUP BY section;