-- Extract year from Order_Date
--SELECT EXTRACT(YEAR FROM Order_Date) FROM Orders;

-- Extract month from Order_Date
--SELECT EXTRACT(MONTH FROM Order_Date) FROM Orders;

-- Extract day from Order_Date
--SELECT EXTRACT(DAY FROM Order_Date) FROM Orders;

-- Find current date
--SELECT SYSDATE FROM DUAL;

-- Find current timestamp
--SELECT SYSTIMESTAMP FROM DUAL;

-- Add 7 days to Order_Date
--SELECT Order_Date + 7 FROM Orders;

-- Subtract 30 days from Order_Date
--SELECT Order_Date - 30 FROM Orders;

-- Find difference between two dates
--SELECT end_date - start_date FROM DUAL;

-- Find number of months between two dates
--SELECT MONTHS_BETWEEN(END_DATE, START_DATE) FROM DUAL

-- Find last day of the month
--SELECT LAST_DAY(ORDER_DATE) FROM ORDERS

-- Get first day of the year
--SELECT TRUNC(ORDER_DATE, 'YYYY') AS FIRST_DATE_OF_YEAR FROM ORDERS

-- Format date as 'DD-MM-YYYY'
--SELECT TO_CHAR(ORDER_DATE,'DD-MM-YYYY') FROM ORDERS

-- Convert string to date
--SELECT TO_DATE('10-02-2026', 'DD-MM-YYYY') FROM ORDERS

--Convert date to string.
--SELECT TO_CHAR(SYS_DATE,'DD-MM-YYYY') FROM DUAL

-- Find week number of the year
--SELECT TO_CHAR(ORDER_DATE,'WW') FROM ORDERS

-- Find day name from date
--SELECT TO_CHAR(ORDER_DATE,'DAY')FROM ORDERS

-- Find quarter of the year
--SELECT TO_CHAR(ORDER_DATE,'Q') FROM ORDERS

-- Calculate age from DOB
--SELECT TRUNC(MONTHS_BETWEEN(SYSDATE,DOB)/12) FROM PERSON

-- Check if date is weekend


-- Find next Monday after a given date
--SELECT NEXT_DAY(ORDER_DATE,'MONDAY')FROM ORDERS