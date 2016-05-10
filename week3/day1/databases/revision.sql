-- Section 1
--
-- Revision of concepts that we've learnt in SQL today
--
-- Select the names of all users.

SELECT name FROM users;

-- Select the names of all shows that cost less than £15.

SELECT name FROM shows WHERE price < 15;

-- Insert a user with the name "Val Gibson" into the users table.

INSERT INTO users (name) VALUES ('Val Gibson');

-- Select the id of the user with your name.

SELECT id FROM users WHERE name = 'Harry Swan';

-- Insert a record that Val Gibson wants to attend the show "Two girls, one cup of comedy".

INSERT INTO shows_users (show_id, user_id) VALUES ((SELECT id FROM shows WHERE name = 'Two girls, one cup of comedy'), (SELECT id FROM users WHERE name = 'Val Gibson'));

-- Updates the name of the "Val Gibson" user to be "Valerie Gibson".

UPDATE users SET name = 'Valerie Gibson' WHERE name = 'Val Gibson';

-- Deletes the user with the name 'Valerie Gibson'.

DELETE FROM users WHERE name = 'Valerie Gibson';

-- Deletes the shows for the user you just deleted.

DELETE FROM shows_users WHERE user_id = 4;
--or if added a new Valerie Gibson user_id = 23

-- Section 2
--
-- This section involves more complex queries. You will need to go and find out about aggregate funcions in SQL to answer some of the next questions.

-- Select the names and prices of all shows, ordered by price in ascending order.

SELECT name, price FROM shows ORDER BY price ASC;

-- Select the average price of all shows.

SELECT AVG(price) FROM shows;

-- Select the price of the least expensive show.

SELECT MIN(price) FROM shows;

-- Select the sum of the price of all shows.

SELECT SUM(price) FROM shows;

-- Select the sum of the price of all shows whose prices is less than £20.

SELECT SUM(price) FROM shows WHERE price < 20;

-- Select the name and price of the most expensive show.

SELECT name, price FROM shows WHERE price IN(SELECT MAX(price) FROM shows);

-- Select the name and price of the second from cheapest show.

SELECT name, price FROM shows ORDER BY price ASC LIMIT 1 OFFSET 1;
    -- both work, ^^^ that is better \/\/\/ that is more fun
SELECT name, price FROM shows WHERE price IN (SELECT MIN(price) FROM shows WHERE price != (SELECT MIN(price) FROM shows));

-- Select the names of all users whose names start with the letter "A".

SELECT name FROM users WHERE name LIKE 'A%';

-- Select the names of users whose names contain "el".

SELECT name FROM users WHERE name LIKE '%el%';

--
-- Section 3
--
-- The following questions can be answered by using nested SQL statements but ideally you should learn about JOIN clauses to answer them.
--
-- Select the time for the Edinburgh Royal Tattoo.

SELECT times.time FROM times INNER JOIN shows ON times.show_id = shows.id WHERE shows.name = 'Edinburgh Royal Tattoo';

-- Select the number of users who want to see "Le Haggis".

SELECT COUNT(*) FROM shows_users INNER JOIN shows ON shows_users.show_id = shows.id WHERE shows.name = 'Le Haggis';

-- Select all of the user names and the count of shows they're going to see.

SELECT users.name, count(shows_users.show_id) FROM users INNER JOIN shows_users ON users.id = shows_users.user_id GROUP BY users.name;

-- SELECT all users who are going to a show at 13:30.

SELECT users.name FROM users LEFT JOIN shows_users ON users.id = shows_users.user_id LEFT JOIN times ON shows_users.show_id = times.show_id WHERE times.time = '13:30';
