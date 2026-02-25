--1)Round Unit_Price to 2 decimal places.
--SELECT ROUND(unit_price,2) FROM ORDERS

--2)Find total sales per order.
--SELECT SUM(UNIT_PRICE) FROM ORDERS

--3)Calculate average order value.
--SELECT AVG(QUANTITY * UNIT_PRICE) FROM ORDERS

--4)Find highest product price.
--SELECT MAX(UNIT_PRICE) FROM ORDERS

--5)Find lowest product price.
--SELECT MIN(UNIT_PRICE) FROM ORDERS

--6)Calculate percentage discount applied.


--7)Find modulus of Quantity divided by 2.
--SELECT MOD(QUANTITY, 2) FROM ORDERS

--8)Convert negative values to positive.
--SELECT ABS(QUANTITY,UNIT_PRICE) FROM ORDERS

--9)Truncate price without rounding.
--SELECT TRUNC(UNIT_PRICE,0) AS Truncated_price FROM ORDERS

--10)Find square root of total sales.
--SELECT SQRT(SUM(QUANTITY * UNIT_PRICE))AS SQRT_TOTAL_SALES FROM ORDERS

--11)Calculate exponential value of a number.
--SELECT EXP(quantity) FROM orders

--12)Calculate power of 2^5.
--SELECT POWER(2,5) FROM DUAL

--13)Find absolute difference between two prices.


--14)Calculate sales growth percentage.


--15)Find random number between 1 and 100.
--SELECT TRUNC(DBMS_RANDOM.value(1,101)) AS random FROM DUAL

--16)Divide total sales by number of orders.
--SELECT (SUM(UNIT_PRICE * QUANTITY) / COUNT(ORDER_ID))AS SALES_PER_ORDER FROM ORDERS

--17)Find ceiling value of price.
--SELECT CEIL(UNIT_PRICE) AS CEILING_PRICE FROM ORDERS

--18)Find floor value of price.
--SELECT floor(UNIT_PRICE)FROM ORDERS

--19)Convert decimal to integer.
--SELECT TRUNC(UNIT_PRICE) FROM ORDERS

--20)Calculate compound interest.
--SELECT P * POWER((1 + R/100), N) - P FROM DUAL