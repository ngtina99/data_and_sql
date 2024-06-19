USE parts;

select * from part; -- give you all of the columns

select colour, weight from part;

select distinct colour from part;

select * from part
where colour = 'red';

select p.colour, p.weight
from part as p
-- you can use without as too, use one letter for simplicity
where p.colour = 'red';

-- unique
select distinct pname
from part;

select distinct pname, p_id
from part;

select * from project;

select * from project
where city = 'london'
