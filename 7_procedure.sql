use practice1;
-- Change Delimiter
DELIMITER //
-- Create Stored Procedure
CREATE PROCEDURE Greetings( GreetingWorld VARCHAR(100), FirstName VARCHAR(100))
BEGIN
    DECLARE FullGreeting VARCHAR(200);
    SET FullGreeting = CONCAT(GreetingWorld,' ',FirstName);
    SELECT FullGreeting;
END//
-- Change Delimiter again
-- Change Delimiter again
DELIMITER ;
-- Call Stored Procedure
CALL Greetings('Bonjour,', 'Dave');
CALL Greetings('Hola,', 'Dora');
CALL Greetings('Terve,', 'Elena');

use bakery;
SELECT *
FROM sweet;
-- Change Delimiter
DELIMITER //
-- Create Stored Procedure
CREATE PROCEDURE InsertValue(
IN id INT,
IN sweetItem VARCHAR(100),
IN price FLOAT)
BEGIN
INSERT INTO sweet(id,item_name, price)
VALUES (id,sweetItem, price);
END//
-- Change Delimiter again
DELIMITER ;
CALL InsertValue (11, 'cherry_cake', 5);

React

Reply

9:25
-- To drop procedures
DROP PROCEDURE InsertValue;
9:26
-- stored function example
use cfgbank;
DELIMITER //
CREATE FUNCTION is_eligible(
    balance INT
)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE customer_status VARCHAR(20);
    IF balance > 100 THEN
        SET customer_status = 'YES';
    ELSEIF (balance >= 50 AND
            balance <= 100) THEN
        SET customer_status = 'MAYBE';
    ELSEIF balance < 50 THEN
        SET customer_status = 'NO';
    END IF;
    RETURN (customer_status);
END//balance
DELIMITER ;
select * from bank.accounts;
SELECT
    account_holder_name,
    account_holder_surname,
    balance,
    is_eligible(balance)
FROM
    accounts;