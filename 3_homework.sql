USE shop;

SELECT * 
FROM sales1;

SELECT week, COUNT(week)
FROM sales1
GROUP BY week;

SELECT week, COUNT(week)
FROM sales1
GROUP BY week
ORDER BY week DESC;

