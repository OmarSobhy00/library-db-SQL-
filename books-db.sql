CREATE DATABASE LibraryDB;
USE LibraryDB;
CREATE TABLE Books (
    Book_id INT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Author varchar(100),
    ISBN varchar(13) unique,
    PublishedYear INT,
    CopiesAvilable INT default 0
);
insert into Books(book_id, Title, Author, PublishedYear) values
(1, 'HarryPotter', 'omar', 2000),
(2, 'TheHobbit', 'ahmed', 2001),
(3, 'LordOfTheRings', 'mohamed', 1999),
(4, 'Titanic', 'mostafa', 2005),
(5, 'Hello', 'khaled', 2025);



create table Members (
MemberID INT primary key,
FirstName varchar(50),
LastName varchar(50),
MembershipDate Date
);

INSERT INTO Members (MemberID, FirstName, LastName, MembershipDate) VALUES
(1, 'Ahmed', 'Tarek', '2020-01-01'),
(2, 'Mohamed', 'Mostafa', '2021-01-01'),
(3, 'Ali', 'Hassan', '2022-02-02');

create table Loans(
	LoanID INT Primary KEY,
	MemberID INT not null,
	BookID INT not null,
	LoanDate date ,
	RetuenData date,
	FOREIGN KEY (BookID) REFERENCES Books(Book_id),
	FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

SELECT * FROM Books;

SELECT * FROM Members
WHERE MembershipDate > '2022-01-01';

SELECT * FROM Books
WHERE CopiesAvilable > 5;


UPDATE Books
SET CopiesAvilable = CopiesAvilable - 1
WHERE Book_id = 2;


UPDATE Books
SET CopiesAvilable = CopiesAvilable - 1
WHERE book_id = 1 AND CopiesAvilable > 0;

DELETE FROM Members
WHERE MemberID NOT IN (
    SELECT DISTINCT MemberID FROM Loans
);


SELECT 
    Members.FirstName,
    Members.LastName,
    COUNT(Loans.LoanID) AS TotalBorrowed
FROM 
    Members
LEFT JOIN Loans ON Members.MemberID = Loans.MemberID
GROUP BY 
    Members.MemberID, Members.FirstName, Members.LastName;


SELECT 
    Members.FirstName,
    Members.LastName,
    Books.Title
FROM 
    Loans
JOIN Members ON Loans.MemberID = Members.MemberID
JOIN Books ON Loans.BookID = Book_id;

