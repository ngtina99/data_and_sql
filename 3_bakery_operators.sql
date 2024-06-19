USE Bakery;

SELECT s.item_name
FROM savoury s
WHERE s.main_ingredient = 'pork'
OR s.main_ingredient ='beef';

SELECT sw.item_name, sw.price
FROM sweet sw
WHERE price <= 0.50;

SELECT sw.item_name, sw.price 
FROM sweet sw
WHERE item_name != 'cannoli'; -- it coul be <> instead of !=