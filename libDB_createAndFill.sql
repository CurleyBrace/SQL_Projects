CREATE DATABASE db_lib

/*Creating Branch DB*/
CREATE TABLE lib_branch (
	branch_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	branch_name VARCHAR(50) NOT NULL,
	branch_address VARCHAR(100) NOT NULL
);

/*Creating Borrowers DB*/
CREATE TABLE lib_borrow (
	card_num INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	borr_name VARCHAR(50) NOT NULL,
	borr_address VARCHAR(100) NOT NULL,
	borr_phone VARCHAR(50) NOT NULL
);

/*Creating Publisher DB*/
CREATE TABLE db_pub (
	pub_name VARCHAR(50) NOT NULL PRIMARY KEY,
	pub_address VARCHAR (50) NOT NULL,
	pub_phone VARCHAR (50) NOT NULL
);

/*Creating Book DB*/
CREATE TABLE db_books (
	book_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	title VARCHAR(50) NOT NULL,
	pub_name VARCHAR(50) FOREIGN KEY REFERENCES db_pub(pub_name)
);

/*Creating Book Copy DB*/
CREATE TABLE book_copies (
	book_id INT NOT NULL FOREIGN KEY REFERENCES db_books(book_id),
	branch_id INT NOT NULL FOREIGN KEY REFERENCES lib_branch(branch_id),
	num_copies INT NOT NULL
);

/*Creating Author DB*/
CREATE TABLE db_auth (
	book_id INT NOT NULL FOREIGN KEY REFERENCES db_books(book_id),
	auth_name VARCHAR(50) NOT NULL
);

/*Creating Book Loan DB*/
CREATE TABLE book_loans (
	book_id INT NOT NULL FOREIGN KEY REFERENCES db_books(book_id),
	branch_id INT NOT NULL FOREIGN KEY REFERENCES lib_branch(branch_id),
	card_num INT NOT NULL FOREIGN KEY REFERENCES lib_borrow(card_num),
	date_out DATE NOT NULL,
	date_due DATE NOT NULL
);

/*Inserting Into Library Branch DB*/
INSERT INTO lib_branch(branch_name, branch_address)
VALUES
	('Sharpstown', '456 Wayward Drive'),
	('Johnsons Library', '1200 Avenue Prky'),
	('St. Johns Library', '294 St. Johns Parkway'),
	('Nicoleson Park', '294 Barkway Avenue'),
	('Zenith Library', '104 Sickamore Street'),
	('ABC Library', '123 Fourth Street')
;

/*Inserting into Library Borrowers DB*/
INSERT INTO lib_borrow(borr_name, borr_address, borr_phone)
VALUES
	('Michael Johnson', '4640 Turcotte Key', '434-986-7512'),
	('Jaylene Hathway', '071 Hettinger Harbors', '302-307-9506'), 
	('Boyce Mullins', '0983 Leopold Loaf', '321-493-3542'),
	('Bevis Macey', '7595 Sanford Circles', '217-980-3523'),
	('Elise Traviss', '045 Wiegand Plain', '351-389-1645'),
	('Ariya Wolfe', '1321 Schoen Canyon', '509-632-2492'),
	('Wesley Yong', '044 Braun Garden', '307-338-8519'),
	('Galen Maddison', '2764 Makayla Walk', '914-741-2071'),
	('Timothy Jackson', '6932 Hecksher Blvd.', '923-120-3044')
;

/*Inserting into Publisher DB*/
INSERT INTO db_pub(pub_name, pub_address, pub_phone)
VALUES
	('Kymani Turman','9078 Kuphal Ridge', '423-529-8968'),
	('Kaidon Abate','3719 Bechtelar Garden', '339-234-3311'),
	('Josh Massie','0492 Sauer Cape', '207-978-5285'),
	('Farhan Moniz','23779 Homenick Pine', '301-348-7128'),
	('Canaan Trent','0486 Rowena Ports', '412-902-8040' ),
	('Titan Becerra','3389 Kirsten Divide', '209-430-4954'),
	('Janyah Nair','7843 Cummerata Path', '620-891-8678'),
	('Gonzalo Askew','9327 Collins Mall', '325-221-3178'),
	('Kasey Currie','94156 McCullough Spurs', '443-599-8306'),
	('Meena Blumberg','56987 Ansley Rapid', '202-802-7520')
;

/*Inserting Into Book Database*/
INSERT INTO db_books(title, pub_name)
VALUES
	('The Lost Tribe', 'Kymani Turman'),
	('Ferdydurke', 'Kasey Currie'),
	('More Than Love, A Husbands Tale', 'Janyah Nair'),
	('Wind from the Abyss', 'Gonzalo Askew'),
	('False Step', 'Meena Blumberg'),
	('Murder on the Orient Express', 'Gonzalo Askew'),
	('The Day of the Triffids', 'Kaidon Abate'),
	('The Jewel in the Crown', 'Kasey Currie'),
	('The Waste Lands', 'Farhan Moniz'),
	('The Book of Illusions', 'Titan Becerra'),
	('The Tales of Beedle the Bard', 'Kaidon Abate'),
	('Firestarter', 'Josh Massie'),
	('The Wise Mans Fear', 'Meena Blumberg'),
	('We the Living', 'Canaan Trent'),
	('High Couch of Silistra', 'Titan Becerra'),
	('V.', 'Farhan Moniz'),
	('Throne of Glass', 'Josh Massie'),
	('Interpreter of Maladies', 'Canaan Trent'),
	('The Silence of the Lambs', 'Janyah Nair'),
	('Night', 'Kymani Turman')
;

/*Inserting into Author Database*/
INSERT INTO db_auth(book_id, auth_name)
VALUES
	('1', 'Millie Levine'),
	('2', 'Eleana Carothers'),
	('3', 'Romell Pizano'),
	('4', 'Una Matz'),
	('5', 'Adah Vue'),
	('6', 'Salwa Mcinerney'),
	('7', 'Adah Vue'),
	('8', 'Alexis Dyer'),
	('9', 'Eleana Carothers'),
	('10', 'Allana Ehrlich'),
	('11', 'Cheyanne Lockett'),
	('12', 'Brianna Cunningham'),
	('13', 'Ayah Churchill'),
	('14', 'Kendyll Sauls'),
	('15', 'Cheyanne Lockett'),
	('16', 'Cheyanne Lockett'),
	('17', 'Maja Parsley'),
	('18', 'Eleana Carothers'),
	('19', 'Roan Saxton'),
	('20', 'Allana Ehrlich')
;

/*Inserting into Book Copy Database*/
INSERT INTO book_copies(book_id, branch_id, num_copies)
VALUES
	('1', '1', '3'),
	('2', '3', '5'),
	('3', '4', '6'),
	('4', '3', '1'),
	('5', '1', '2'),
	('6', '5', '6'),
	('7', '6', '1'),
	('8', '5', '7'),
	('9', '6', '5'),
	('10', '1', '4'),
	('11', '2', '2'),
	('12', '3', '8'),
	('13', '4', '9'),
	('14', '1', '6'),
	('15', '1', '5'),
	('16', '6', '8'),
	('17', '5', '8'),
	('18', '5', '3'),
	('19', '3', '2'),
	('20', '2', '9')
;

/*Insert into book loans*/
INSERT INTO book_loans(book_id, branch_id, card_num, date_out, date_due)
VALUES
	('11', '1', '1', '2021-05-29', '2021-06-30'),
	('14', '2', '2', '2021-06-11', '2021-08-10'),
	('3', '3', '3', '2021-05-15', '2021-08-12'),
	('6', '5', '4', '2021-05-30', '2021-07-06'),
	('7', '3', '5', '2021-06-13', '2021-11-23'),
	('2', '4', '6', '2021-06-18', '2021-10-13'),
	('4', '3', '7', '2021-06-23', '2021-07-26'),
	('5', '6', '8', '2021-05-02', '2021-07-14'),
	('7', '4', '1', '2021-05-07', '2021-09-21'),
	('1', '1', '3', '2021-05-21', '2021-08-29')
;

/*Full outer join statement*/
SELECT * FROM ((book_loans FULL OUTER JOIN lib_borrow on book_loans.card_num = lib_borrow.card_num) FULL OUTER JOIN db_books ON book_loans.book_id = db_books.book_id)

/*All titles and authors*/
SELECT db_books.title, db_auth.auth_name
FROM db_books 
INNER JOIN db_auth ON db_books.book_id = db_auth.book_id

