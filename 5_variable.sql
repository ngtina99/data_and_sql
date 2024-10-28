-- declare and initialise variable Var 
SET @Var=5;
-- control flow with Case Operator
SELECT 
	CASE @Var
		WHEN 1 THEN 'ONE'
        WHEN 2 THEN 'TWO'
        ELSE 'HIGHER THAN 2'
	END AS 'TheNumberIs';
    
    SET @Var1=11;
    SET @Var2=12;
    
    SELECT 
		CASE 
			WHEN (@Var1=11 AND @Var2=13) then 'one'
            WHEN @Var2=12 then 'two'
			ELSE '2+'
		END AS theNumberIS;