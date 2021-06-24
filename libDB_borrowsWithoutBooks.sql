CREATE PROC borrowsWithoutBooks
AS
BEGIN
	SELECT lib_borrow.borr_name AS Borrowers_Without_Books
	FROM lib_borrow
	LEFT JOIN book_loans ON book_loans.card_num = lib_borrow.card_num
	WHERE lib_borrow.card_num NOT IN (SELECT card_num FROM book_loans)
END