-- ============================================
-- Library Management System
-- File: insert_data.sql
-- Author: Arnab Paul
-- ============================================

USE library_management;

-- ============================================
-- Insert Sample Books
-- ============================================

INSERT INTO books
(title, author, category, total_copies, available_copies)
VALUES
('Python Programming', 'John Smith', 'Programming', 5, 4),
('Database Management Systems', 'Raghu Ramakrishnan', 'Database', 4, 3),
('Clean Code', 'Robert C. Martin', 'Programming', 3, 3),
('Computer Networks', 'Andrew Tanenbaum', 'Networking', 2, 2),
('Artificial Intelligence', 'Stuart Russell', 'AI', 4, 4),
('Introduction to Algorithms', 'Thomas H. Cormen', 'Algorithms', 3, 3),
('Operating System Concepts', 'Abraham Silberschatz', 'Operating Systems', 4, 4),
('Java Programming', 'Herbert Schildt', 'Programming', 5, 5);

-- ============================================
-- Insert Sample Members
-- ============================================

INSERT INTO members
(name, email, phone, join_date)
VALUES
('Rahul Sharma', '[rahul@example.com](mailto:rahul@example.com)', '9876543210', '2026-01-10'),
('Priya Das', '[priya@example.com](mailto:priya@example.com)', '9876543211', '2026-02-15'),
('Amit Roy', '[amit@example.com](mailto:amit@example.com)', '9876543212', '2026-03-20'),
('Sneha Paul', '[sneha@example.com](mailto:sneha@example.com)', '9876543213', '2026-04-05'),
('Arjun Sen', '[arjun@example.com](mailto:arjun@example.com)', '9876543214', '2026-05-12');

-- ============================================
-- Insert Sample Borrow Records
-- ============================================

INSERT INTO borrow_records
(book_id, member_id, borrow_date, due_date, return_date)
VALUES
(1, 1, '2026-10-01', '2026-10-15', NULL),
(2, 2, '2026-10-03', '2026-10-17', NULL),
(3, 1, '2026-09-01', '2026-09-15', '2026-09-12'),
(4, 3, '2026-10-05', '2026-10-19', NULL),
(5, 4, '2026-09-10', '2026-09-24', '2026-09-20'),
(6, 5, '2026-10-06', '2026-10-20', NULL);

-- ============================================
-- End of insert_data.sql
-- ============================================

-- Verify Inserted Data
SELECT * FROM books;
SELECT * FROM members;
SELECT * FROM borrow_records;
