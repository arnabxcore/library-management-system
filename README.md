# 📚 Library Management System using MySQL

A beginner-friendly DBMS project built using MySQL to manage books, library members, borrowing records, and returns.

## 📌 About the Project

The Library Management System is a database project designed to organize library operations using relational database tables and SQL queries.

It helps manage book information, member details, borrowing history, and book availability.

## 🎯 Features

* 📖 Store and manage book records.
* 👥 Maintain library member information.
* 📥 Record book borrowing.
* 📤 Track book returns.
* 🔍 Search for books by title.
* 📊 Calculate total book copies.
* ⏰ Identify overdue books.
* 📈 Generate borrowing reports.

## 🛠️ Technologies Used

* **Database:** MySQL
* **Language:** SQL
* **Database Tool:** MySQL Workbench

## 🗄️ Database Tables

| Table Name       | Description                                                             |
| ---------------- | ----------------------------------------------------------------------- |
| `books`          | Stores book titles, authors, categories, and available copies.          |
| `members`        | Stores member names, email addresses, phone numbers, and joining dates. |
| `borrow_records` | Tracks borrowing dates, due dates, and return dates.                    |

## 📂 Project Structure

```text
library-management-system/
│
├── README.md
├── schema.sql
├── insert_data.sql
└── queries.sql
```

## 💻 SQL Concepts Practiced

* Database and table creation
* Primary keys and foreign keys
* INSERT, UPDATE, and DELETE
* SELECT and WHERE
* ORDER BY and GROUP BY
* Aggregate functions
* INNER JOIN and LEFT JOIN
* Date functions
* Database transactions

## ⚙️ How to Run the Project

### Prerequisites

* MySQL Server
* MySQL Workbench

### Installation Steps

1. Clone or download this repository.
2. Open MySQL Workbench and connect to your MySQL Server.
3. Open `schema.sql` and execute the script to create the database and tables.
4. Open `insert_data.sql` and execute it to insert sample data.
5. Open `queries.sql` and execute the queries individually.
6. Review the query results in MySQL Workbench.

## 🔍 Example SQL Query

Display all currently borrowed books:

```sql
SELECT
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
```

## 📈 Learning Outcomes

Through this project, I practised relational database design, SQL queries, table relationships, data retrieval, and report generation using MySQL.

## 👨‍💻 Author

**Arnab Paul**

GitHub: [@paularnab123](https://github.com/paularnab123)

## 📜 License

This project is intended for educational and learning purposes.

