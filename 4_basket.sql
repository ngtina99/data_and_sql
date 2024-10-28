CREATE DATABASE JOINS_PRACTICE;
USE JOINS_PRACTICE;
-- Create table 1
CREATE TABLE Table1_fruit_basket (
	ID INT, 
	Fruit VARCHAR(50)
 );

INSERT INTO Table1_fruit_basket
(ID, Fruit)
VALUES
(1, 'pear'),
(2, 'apple'),
(3, 'kiwi'),
(4, 'orange'),
(5, 'banana');

-- Create table 2
CREATE TABLE Table2_fruit_basket
(ID INT, Fruit VARCHAR(50));
INSERT INTO Table2_fruit_basket
(ID, Fruit)
VALUES
(1, 'pear'),
(2, 'apple'),
(3, 'kiwi'),
(6, 'melon'),
(7, 'peach'),
(8, 'plum');

use joins_practice;

SELECT * 
FROM table1_fruit_basket;

SELECT * 
FROM table2_fruit_basket;

SELECT *
FROM table1_fruit_basket t1
INNER JOIN table2_fruit_basket t2
ON t1.id = t2.id;

select *
from table1_fruit_basket t1
left join table2_fruit_basket t2
on t1.id = t2.id;

select *
from table1_fruit_basket t1
right join table2_fruit_basket t2
on t1.id = t2.id;

select *
from table1_fruit_basket t1
left join table2_fruit_basket t2
on t1.id = t2.id
UNION
select *
from table1_fruit_basket t1
right join table2_fruit_basket t2
on t1.id = t2.id;

select t1.*, t2.fruit
from table1_fruit_basket t1
right join table2_fruit_basket t2
on t1.id = t2.id
where t1.id is null;