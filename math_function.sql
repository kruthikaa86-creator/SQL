-- Find sine value of an angle (angle in radians)
--SELECT sin(1) from dual

-- Find cosine value of an angle
--SELECT COS(1) FROM DUAL

-- Find tangent value
--SELECT TAN(1) FROM DUAL

--Convert degrees to radians.
SELECT RADIANS(90) FROM DUAL

--Convert radians to degrees.
SELECT degrees(99.65) FROM DUAL

-- Find logarithm (base 10) of a number
SELECT logarithm (10,100) FROM dual

--Find natural log of a number.
--SELECT LN(10) FROM DUAL

-- Find square of a number
--SELECT POWER(5,2) FROM dual

-- Find cube of a number
--SELECT POWER(5,3) FROM DUAL

-- Calculate factorial of a number (5!)
--SELECT EXP(SUM(LN(LEVEL))) FROM dual CONNECT BY LEVEL <=5;

-- Find greatest value among three numbers
--SELECT greatest(10,34,56) FROM DUAL

-- Find least value among three numbers
--SELECT LEAST(10,34,56) FROM DUAL

-- Calculate variance of sales
--SELECT variance(QUANTITY * UNIT_PRICE) FROM ORDERS

-- Calculate standard deviation of sales
--SELECT STDDEV(Quantity * Unit_Price) FROM Orders;

-- Find average deviation
--SELECT AVG(ABS(sales - avg_sales))
--FROM (
--  SELECT Quantity * Unit_Price AS sales,
--         AVG(Quantity * Unit_Price) OVER () AS avg_sales
--  FROM Orders
--);

-- Calculate geometric mean
--SELECT EXP(AVG(LN(Quantity * Unit_Price))) FROM Orders;

-- Calculate harmonic mean
--SELECT COUNT(*) / SUM(1 / (Quantity * Unit_Price)) FROM Orders;

-- Find sum of squares
--SELECT SUM(POWER(Quantity * Unit_Price, 2)) FROM Orders;

-- Calculate correlation between two columns
--SELECT CORR(Quantity, Unit_Price) FROM Orders;

-- Calculate regression slope
--SELECT REGR_SLOPE(Unit_Price, Quantity) FROM Orders;