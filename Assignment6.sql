SELECT noOfCopies FROM tbl_book_copies
WHERE branchId = (SELECT branchId FROM tbl_library_branch WHERE branchName = "Sharpstown")
AND bookId = (SELECT bookId FROM tbl_book WHERE title = "The Lost Tribe");

SELECT noOfCopies, branchId FROM tbl_book_copies
WHERE bookId = (SELECT bookId FROM tbl_book WHERE title = "The Lost Tribe") GROUP BY branchId;

SELECT name FROM tbl_borrower AS a
LEFT JOIN tbl_book_loans AS b
ON a.cardNo = b.cardNo
WHERE bookId IS NULL;

SELECT title, name, COUNT(tbl_borrower.cardNo) FROM tbl_library_branch
INNER JOIN tbl_book_loans ON tbl_book_loans.branchID = tbl_library_branch.branchId
INNER JOIN tbl_book ON tbl_book_loans.bookId = tbl_book.bookId
INNER JOIN tbl_borrower ON tbl_book_loans.cardNo = tbl_borrower.cardNo
WHERE tbl_library_branch.branchName = "Sharpstown"
AND dueDate = '2021-09-15'
GROUP BY tbl_borrower.cardNo;

SELECT branchName, COUNT(dueDate) FROM tbl_library_branch
INNER JOIN tbl_book_loans ON tbl_library_branch.branchId = tbl_book_loans.branchId
GROUP BY branchName;

SELECT name, address, COUNT(bookId) FROM tbl_borrower
INNER JOIN tbl_book_loans ON tbl_borrower.cardNo = tbl_book_loans.cardNo
GROUP BY tbl_borrower.cardNo
HAVING COUNT(bookId) > 5
ORDER BY tbl_borrower.cardNo;

SELECT title, COUNT(tbl_book_loans.bookId) FROM tbl_author
INNER JOIN tbl_book ON tbl_author.authorId = tbl_book.authId
INNER JOIN tbl_book_loans ON tbl_book.bookId = tbl_book_loans.bookId
RIGHT JOIN tbl_library_branch ON tbl_book_loans.branchId = tbl_library_branch.branchId
WHERE branchName = "Central" AND authorName = "Stephen King"
GROUP BY tbl_book_loans.bookId;