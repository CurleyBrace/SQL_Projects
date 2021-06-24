CREATE PROC bookLostTribeSharpstown
AS
BEGIN
	SELECT num_copies FROM book_copies
	INNER JOIN db_books ON db_books.book_id = book_copies.book_id
	INNER JOIN lib_branch ON lib_branch.branch_id = book_copies.branch_id
	WHERE branch_name = 'Sharpstown' AND title = 'The Lost Tribe'
END