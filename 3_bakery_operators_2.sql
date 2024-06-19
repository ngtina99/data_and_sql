USE Bakery;

SELECT item_name
FROM sweet
WHERE item_name LIKE 'c%';

SELECT item_name, price
FROM savoury
WHERE price BETWEEN 1.01 and 2.99;
