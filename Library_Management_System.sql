-- Library Management System Database Schema

-- Table: Books - stores book details
CREATE TABLE Books (
  BookID INT AUTO_INCREMENT PRIMARY KEY,                    -- Unique identifier for each book
  Title VARCHAR(255) NOT NULL,                              -- Book title, mandatory
  Author VARCHAR(255) NOT NULL,                             -- Book author(s), mandatory
  ISBN VARCHAR(20) UNIQUE NOT NULL,                         -- Unique ISBN number for each book
  PublishedYear YEAR,                                       -- Year of publication
  CopiesAvailable INT DEFAULT 0                             -- Available copies count
);

-- Table: Members - stores library members information
CREATE TABLE Members (
  MemberID INT AUTO_INCREMENT PRIMARY KEY,                  -- Unique identifier for each member
  FullName VARCHAR(255) NOT NULL,                           -- Member's full name
  Email VARCHAR(255) UNIQUE NOT NULL,                       -- Unique email for login/contact
  Phone VARCHAR(20),                                        -- Optional phone number
  MembershipDate DATE NOT NULL                              -- Date the membership started
);

-- Table: Loans - tracks which member borrowed which book and when
CREATE TABLE Loans (
  LoanID INT AUTO_INCREMENT PRIMARY KEY,                    -- Unique loan record identifier
  BookID INT NOT NULL,                                      -- Foreign key referencing Books
  MemberID INT NOT NULL,                                    -- Foreign key referencing Members
  LoanDate DATE NOT NULL,                                   -- Date when book was loaned out
  ReturnDate DATE,                                          -- Date when book was returned (nullable)
  CONSTRAINT FK_Book FOREIGN KEY (BookID)                   -- Enforce referential integrity
    REFERENCES Books(BookID) ON DELETE CASCADE,
  CONSTRAINT FK_Member FOREIGN KEY (MemberID)
    REFERENCES Members(MemberID) ON DELETE CASCADE
);

-- Index for faster search by book title
CREATE INDEX idx_BookTitle ON Books(Title);

-- Index for faster search by member's full name
CREATE INDEX idx_MemberName ON Members(FullName);

-- Additional notes:
-- 1. CopiesAvailable tracks the number of copies available for lending.
-- 2. The Loans table creates a many-to-many relationship between Books and Members via loan records.
