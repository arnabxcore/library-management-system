-- ============================================
-- Library Management System
-- File: schema.sql
-- Database: MySQL
-- Author: Arnab Paul
-- ============================================

-- Create Database
CREATE DATABASE IF NOT EXISTS library_management;

USE library_management;

-- ============================================
-- Table 1: Books
-- ============================================

CREATE TABLE IF NOT EXISTS books (
book_id INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(150) NOT NULL,
author VARCHAR(100) NOT NULL,
category VARCHAR(50),
total_copies INT NOT NULL DEFAULT 1,
available_copies INT NOT NULL DEFAULT 1,

```
CONSTRAINT chk_total_copies
    CHECK (total_copies >= 0),

CONSTRAINT chk_available_copies
    CHECK (
        available_copies >= 0
        AND available_copies <= total_copies
    )
```

);

-- ============================================
-- Table 2: Members
-- ============================================

CREATE TABLE IF NOT EXISTS members (
member_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE,
phone VARCHAR(15),
join_date DATE NOT NULL
);

-- ============================================
-- Table 3: Borrow Records
-- ============================================

CREATE TABLE IF NOT EXISTS borrow_records (
borrow_id INT PRIMARY KEY AUTO_INCREMENT,
book_id INT NOT NULL,
member_id INT NOT NULL,
borrow_date DATE NOT NULL,
due_date DATE NOT NULL,
return_date DATE DEFAULT NULL,

```
CONSTRAINT fk_borrow_book
    FOREIGN KEY (book_id)
    REFERENCES books(book_id),

CONSTRAINT fk_borrow_member
    FOREIGN KEY (member_id)
    REFERENCES members(member_id),

CONSTRAINT chk_due_date
    CHECK (due_date >= borrow_date),

CONSTRAINT chk_return_date
    CHECK (
        return_date IS NULL
        OR return_date >= borrow_date
    )
```

);

-- ============================================
-- End of schema.sql
-- ============================================

-- Verify Tables
SHOW TABLES;
