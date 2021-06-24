CREATE PROC findLostTribeCopies
AS
BEGIN
	SELECT book_copies.num_copies, db_books.title, lib_branch.branch_name
	FROM lib_branch
	INNER JOIN book_copies ON book_copies.branch_id = lib_branch.branch_id
	INNER JOIN db_books ON db_books.book_id = book_copies.book_id
	WHERE title = 'The Lost Tribe'
END