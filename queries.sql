-- ============================================
-- Library Management System
-- File: queries.sql
-- Author: Arnab Paul
-- ============================================

USE library_management;

-- ============================================
-- 1. Display All Books
-- ============================================

SELECT *
FROM books;

-- ============================================
-- 2. Display All Library Members
-- ============================================

SELECT *
FROM members;

-- ============================================
-- 3. Find Available Books
-- ============================================

SELECT
title,
author,
category,
available_copies
FROM books
WHERE available_copies > 0;

-- ============================================
-- 4. Search for Books by Title
-- ============================================

SELECT *
FROM books
WHERE title LIKE '%Python%';

-- ============================================
-- 5. Display Currently Borrowed Books
-- ============================================

SELECT
br.borrow_id,
b.title AS book_title,
m.name AS member_name,
br.borrow_date,
br.due_date
FROM borrow_records br
JOIN books b
ON br.book_id = b.book_id
JOIN members m
ON br.member_id = m.member_id
WHERE br.return_date IS NULL;

-- ============================================
-- 6. Display Complete Borrowing History
-- ============================================

SELECT
m.name AS member_name,
b.title AS book_title,
br.borrow_date,
br.due_date,
br.return_date
FROM borrow_records br
JOIN members m
ON br.member_id = m.member_id
JOIN books b
ON br.book_id = b.book_id
ORDER BY br.borrow_date DESC;

-- ============================================
-- 7. Count Total Book Copies
-- ============================================

SELECT
SUM(total_copies) AS total_book_copies,
SUM(available_copies) AS available_book_copies,
SUM(total_copies - available_copies) AS borrowed_book_copies
FROM books;

-- ============================================
-- 8. Find Overdue Books
-- ============================================

SELECT
m.name AS member_name,
b.title AS book_title,
br.borrow_date,
br.due_date
FROM borrow_records br
JOIN members m
ON br.member_id = m.member_id
JOIN books b
ON br.book_id = b.book_id
WHERE br.return_date IS NULL
AND br.due_date < CURRENT_DATE;

-- ============================================
-- 9. Count Borrowing Records per Member
-- ============================================

SELECT
m.member_id,
m.name,
COUNT(br.borrow_id) AS total_borrowing_records
FROM members m
LEFT JOIN borrow_records br
ON m.member_id = br.member_id
GROUP BY m.member_id, m.name
ORDER BY total_borrowing_records DESC;

-- ============================================
-- 10. Find the Most Borrowed Books
-- ============================================

SELECT
b.book_id,
b.title,
COUNT(br.borrow_id) AS borrow_count
FROM books b
LEFT JOIN borrow_records br
ON b.book_id = br.book_id
GROUP BY b.book_id, b.title
ORDER BY borrow_count DESC, b.title;

-- ============================================
-- 11. Find Members Who Have Never Borrowed a Book
-- ============================================

SELECT
m.member_id,
m.name,
m.email
FROM members m
LEFT JOIN borrow_records br
ON m.member_id = br.member_id
WHERE br.borrow_id IS NULL;

-- ============================================
-- 12. Find Books by Category
-- ============================================

SELECT
category,
COUNT(*) AS different_titles,
SUM(total_copies) AS total_copies
FROM books
GROUP BY category
ORDER BY total_copies DESC;

-- ============================================
-- End of queries.sql
-- ============================================
