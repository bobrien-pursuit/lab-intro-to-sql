-- Getting started, do not update
DROP DATABASE IF EXISTS regifter;
CREATE DATABASE regifter;
\c regifter
-- End getting started code

--
-- Write your code below each prompt

--
\echo Create a table called gifts
-- with the following columns
-- id serial primary KEY
-- gift - string
-- giver - string
-- price - integer
-- previously_regifted boolean

CREATE TABLE gifts (id SERIAL PRIMARY KEY, gift VARCHAR(100), giver VARCHAR(50), price INT, previously_regifted BOOLEAN);


-- 
\echo See details of the table you created
-- 
SELECT * FROM gifts;

-- 
\echo Alter the table so that the column price is changed to value 
-- 
ALTER TABLE gifts RENAME price to value;

SELECT * FROM gifts;

-- 
\echo Insert a peach candle, given by 'Santa' thats value is 9 and has been previously regifted
-- 
INSERT INTO
gifts (gift, giver, value, previously_regifted)
VALUES
('peach candle', 'Santa', 9, TRUE);

--
\echo Query for all the columns in your gifts table
-- 
SELECT * FROM gifts;


--
\echo Uncomment below to insert 5 more gifts
-- 

INSERT INTO gifts (gift, giver, value, previously_regifted)
VALUES
('peach candle', 'Santa', '9', TRUE),
('cinnamon candle', 'Nick', '19', TRUE),
('soap on a rope', 'Rudolf', '29', FALSE),
('potpurri', 'Elf on the Shelf', '39', TRUE),
('mango candle', 'The Boss', '49', FALSE)
;

SELECT * FROM gifts;

-- 
\echo Insert 5 more gifts of your own choosing,  include 1 more candle
--

INSERT INTO gifts (gift, giver, value, previously_regifted)
VALUES
('pot-pouri', 'Daisy', 10, TRUE),
('lemons', 'Bruno', '2', FALSE),
('Bible', 'Joe', null, TRUE),
('Chicken', 'Harry', 0, FALSE),
('Crack', 'Jermain', 50, TRUE)
;

SELECT * FROM gifts;

--
\echo Query for gifts with a value greater than or equal to 20
--

SELECT gift FROM gifts WHERE value > 20;

--
\echo Query for every gift that has the word candle in it, only show the gift column
--

SELECT gift FROM gifts WHERE gift ILIKE '%candle%';

--
\echo Query for every gift whose giver is Santa OR value is greater than 30
--

SELECT gift FROM gifts WHERE giver = 'Santa' OR value > 30;

--
\echo Query for every gift whose giver is NOT Santa
--

SELECT gift FROM gifts WHERE giver != 'Santa';

--
\echo Update the second gift to have a value of 2999
-- 

UPDATE gifts SET value = 2999 WHERE id = 2 RETURNING *; 

--
\echo Query for the updated item
--

SELECT * FROM gifts WHERE id = 2;

--
\echo Delete all the gifts from Santa and return the 'value' and 'gift' of the gift you have deleted
--

-- DELETE FROM gifts RETURNING gift, value;

--
\echo Query for all the columns in your gifts table one more time
--

SELECT * FROM gifts;

-- BONUSES

--
 \echo Count the total number of gifts that have the word candle in it
-- 

SELECT COUNT(gift) FROM gifts WHERE gift ILIKE '%candle%';

--
\echo Get the AVEREAGE value from all the gifts
--

SELECT AVG(value) FROM gifts;

-- 
 \echo Limit to 3 gifts, offset by 2 and order by price descending
--

SELECT * FROM gifts ORDER BY value DESC LIMIT 3 OFFSET 2;

--
-- finish
--
DROP TABLE IF EXISTS gifts;
