# SQL_Projects

## Introduction
During my time at The Tech Academy, and outside I've worked with several different types of queries and databases. While working with SQL is far more straight forward than most programming languages there is plenty to learn and demonstrate still, including creating and inserting data into the database, specific types of SELECT and JOIN statements, setting up an efficient layout for the database using relational methods, and plenty more.

Below are the descriptions of projects I've worked on along with code snippets and navigation links for those that I am able to display using Github. Some of these projects will be linked for multiple programming examples.


## Database Examples
* Zoo Database
  * [Creating the Framework and Inserting Data](#creating-the-zoo-database)
  * [Selecting specific queries and JOIN Examples](#zoo-database-queries)
* Library Database
  * [Creating the Framework and Inserting Data](#creating-the-library-database)
  * [Selecting specific queries and JOIN Examples](#library-database-queries)


### [Creating The Zoo Database](https://github.com/CurleyT/SQL_Projects/blob/main/zooDB_createAndFill.sql)
This table was created to hold general information about a number of different types of animals, those listed currently in the Insert statements below. 

```
CREATE TABLE tbl_specialist (
	specialist_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	specialist_fname VARCHAR(50) NOT NULL,
	specialist_lname VARCHAR(50) NOT NULL,
	specialist_contact VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_species (
species_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	species_name VARCHAR(50) NOT NULL,
	species_animalia VARCHAR(50) NOT NULL,
	species_class INT NOT NULL,
	species_order INT NOT NULL,
	species_habitat INT NOT NULL,
	species_nutrition INT NOT NULL,
	species_care VARCHAR(50) NOT NULL
);
```

### [Zoo Database Queries](https://github.com/CurleyT/SQL_Projects/blob/main/zooDB_zooDBProjects.sql)
Throughout utilization of this database there were a number of times certain data needed to be pulled that contained information from either one or multiple tables that exist within this structure. These are a few examples of those.

```
CREATE PROC getANIMAL_INFOs

@animalName varchar(50)
AS
BEGIN
	SELECT 
		a1.species_name, a2.animalia_type,
		a3.class_type, a4.order_type, a5.habitat_type,
		a6.nutrition_type, a7.care_type
		FROM tbl_species a1
		INNER JOIN tbl_animalia a2 ON a2.animalia_id = a1.species_animalia
		INNER JOIN tbl_class a3 ON a3.class_id = a1.species_class
		INNER JOIN tbl_order a4 ON a4.order_id = a1.species_order
		INNER JOIN tbl_habitat a5 ON a5.habitat_id = a1.species_habitat
		INNER JOIN tbl_nutrition a6 ON a6.nutrition_id = a1.species_nutrition
		INNER JOIN tbl_care a7 ON a7.care_id = a1.species_care
		WHERE species_name = @animalName
END
```


### [Creating The Library Database](https://github.com/CurleyT/SQL_Projects/blob/main/libDB_createAndFill.sql)
This is a snippet from a much larger query created to store information regarding several types of libraries and information regarding their books and borrowers who've checked out books at each.

```
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
```

### [Library Database Queries](https://github.com/CurleyT/SQL_Projects/blob/main/libDB_borrowsWithoutBooks.sql)
There were a few main queries I created while working with this database, and actually made them procedures by the end of the process, making running them and utilizing them later on from other sources much easier. Below are just two examples of them.

``` 
CREATE PROC borrowsWithoutBooks
AS
BEGIN
	SELECT lib_borrow.borr_name AS Borrowers_Without_Books
	FROM lib_borrow
	LEFT JOIN book_loans ON book_loans.card_num = lib_borrow.card_num
	WHERE lib_borrow.card_num NOT IN (SELECT card_num FROM book_loans)
END
```
```
CREATE PROC bookLostTribeSharpstown
AS
BEGIN
	SELECT num_copies FROM book_copies
	INNER JOIN db_books ON db_books.book_id = book_copies.book_id
	INNER JOIN lib_branch ON lib_branch.branch_id = book_copies.branch_id
	WHERE branch_name = 'Sharpstown' AND title = 'The Lost Tribe'
END
```
