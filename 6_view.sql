use shop;
select *
from sales1;
-- create a view
 CREATE VIEW vw_salesmen
 AS
 select salesPerson, salesAmount
 from sales1;
 
 select *
 from vw_salesmen;
 
 
 select distinct salesPerson, max(salesAmount)
 from vw_salesmen
 where salesAmount > 70
group by salesPerson;

