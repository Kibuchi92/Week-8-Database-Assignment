# Library Management System - MySQL Database

## Project Description
This project implements a relational database schema for a Library Management System using MySQL. It manages books, library members, and loans of books to members. The design enforces data integrity through primary and foreign keys and optimizes searches using indexes.

## Features
- Stores detailed book information including unique ISBNs and inventory counts.
- Maintains member contact information and membership dates.
- Tracks loan history with loan and return dates.
- Establishes proper relationships with referential integrity constraints.
- Indexed search on book titles and member names for performance.

## How to Setup and Run
1. Install MySQL server if not already installed.
2. Import the SQL file into MySQL:
mysql -u your_username -p your_database < Library_Management_System.sql

3. The tables and constraints will be created automatically.
4. Use your preferred MySQL GUI or CLI to manipulate the data.
