SELECT LENGTH("Code First Girls"), LENGTH("CodeFirstGirls_2024");
SELECT CONCAT('Anisa','       ', 'Elezi') AS ConcatenatedString ;
SELECT LCASE('coDEfIRSTgirls'), LOWER('coDEfIRSTgirls');
SELECT UCASE('coDEfIRSTgirls'), UPPER('coDEfIRSTgirls');
SELECT LEFT('Code First Girls', 6);
SELECT RIGHT('Code First Girls', 10);
SELECT LENGTH('      Code First Girls        ');
SELECT LTRIM('      Code First Girls        '),LENGTH(LTRIM('      Code First Girls        '));
SELECT RTRIM('      Code First Girls        '),LENGTH(RTRIM('      Code First Girls        '));
SELECT TRIM('      Code First Girls        '), LENGTH(TRIM('      Code First Girls        '));
SELECT STRCMP('mY CODE FIRST GIRLS', 'myCFG');
SELECT reverse('lucy');

-- round up
select ceiling(12.34);
-- round down
select floor(12.34);
select rand();
select abs(5), abs(-5);
select  pow(3,2), power(3,2);
select sqrt(4), sqrt(16);

set autocommit=0; -- turn off
set autocommit=1; -- tudn on