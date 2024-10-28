CREATE DATABASE CFGbank;

USE CFGbank;

CREATE TABLE accounts(
	account_number int(5),
	account_holder_name varchar(55),
	account_holder_surname varchar(55),
	balance int,
	overdraft boolean
);

INSERT INTO accounts
(account_number,account_holder_name,account_holder_surname,balance,overdraft)
VALUES
(11111, 'ANA', 'Gomes', 250, false),
(11112, 'Lea', 'Nu', 70, True),
(11113, 'Olive', 'Wa', 1308, false),
(11114, 'Dora', 'Kanasi', 20, false);

truncate table accounts;

select * from accounts;

-- start transaction
START TRANSACTION;
-- CHECK FIRST ACCOUNT IF THEY HAVE ENOUGH MONEY
SELECT
	@moneyAvalibale:=IF(balance > 0, balance, 0) AS MonyAvaliable
FROM
	cfgbank.accounts
WHERE
	account_number=11113 AND account_holder_surname='Wa';
SET @TransfereAmount=50;
Set sql_safe_updates=0;
-- reduce the first account balance
UPDATE accounts
SET
	balance= balance - @TransfereAmount
WHERE
	account_number=11113 AND account_holder_surname='Wa';
select * from accounts;
-- Increase the second account balance
UPDATE accounts
SET
	balance= balance + @TransfereAmount
WHERE
	account_number=11114 AND account_holder_surname='Kanasi';
select * from accounts;
commit;