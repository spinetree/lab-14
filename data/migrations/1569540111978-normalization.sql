CREATE TABLE BOOKSHELVES (id SERIAL PRIMARY KEY, name VARCHAR(255));
-- create bookshelves table to hold our list of ids and names

INSERT INTO bookshelves(name) SELECT DISTINCT bookshelf FROM books;
-- populate with all the different bookshelves that exist in the table today

ALTER TABLE books ADD COLUMN bookshelf_id INT;
-- give each bookshelf a unique id

UPDATE books SET bookshelf_id=shelf.id FROM (SELECT * FROM bookshelves) AS shelf WHERE books.bookshelf = shelf.name;
-- update the books tabls so each row has the corresponding bookshelf ID for its bookshelf 

ALTER TABLE books DROP COLUMN bookshelf;
-- get rid of bookshelf names in books table, those live in bookshelf now

ALTER TABLE books ADD CONSTRAINT fk_bookshelves FOREIGN KEY (bookshelf_id) REFERENCES bookshelves(id);
-- give books table the link that indicates its bookshelf ids live in bookshelves table
