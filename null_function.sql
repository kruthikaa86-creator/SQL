-- Replace NULL price with 0
--SELECT NVL(UNIT_PRICE,0) FROM ORDERS

-- Replace NULL Customer_Name with 'Unknown'
--SELECT NVL(CUSTOMER_NAME,'Unknown') FROM ORDERS

-- Count NULL values in Product_Name
--SELECT COUNT(*) FROM ORDERS WHERE PRODUCT_NAME IS NULL\

-- Find rows where Order_Date is NULL
--SELECT * FROM ORDERS WHERE Order_Date IS NULL

-- Use COALESCE to return first non-null value
--SELECT COALESCE(UNIT_PRICE,0) FROM ORDERS

--Use NVL to replace NULL values.
--SELECT NVL(UNIT_PRICE,0) from ORDERS

-- Use IFNULL function
--SELECT IFNULL(UNIT_PRICE,0) FROM ORDERS

-- Check if column is NULL
--SELECT * FROM Orders WHERE Unit_Price IS NULL;

-- Check if column is NOT NULL
--SELECT * FROM Orders WHERE Unit_Price IS NOT NULL;

-- Use NULLIF between two columns
--SELECT NULLIF(Unit_Price, Quantity) FROM Orders;

-- Replace blank values with NULL
--SELECT NULLIF(Customer_Name, '') FROM Orders;

-- Count non-null values
--SELECT COUNT(Unit_Price) FROM Orders;

-- Filter records where price is NULL or 0
--SELECT * FROM Orders WHERE Unit_Price IS NULL OR Unit_Price = 0;

-- Use CASE to handle NULL values
--SELECT CASE WHEN Unit_Price IS NULL THEN 0 ELSE Unit_Price END FROM Orders;

-- Compare NULL values properly
--SELECT * FROM Orders WHERE Unit_Price IS NULL;

-- Handle NULL in aggregation
--SELECT SUM(NVL(Unit_Price, 0)) FROM Orders;

-- Find average excluding NULL values
--SELECT AVG(Unit_Price) FROM Orders;

-- Find sum ignoring NULL values
--SELECT SUM(Unit_Price) FROM Orders;

-- Identify columns containing NULL using metadata
--SELECT column_name
--FROM user_tab_columns
--WHERE table_name = 'ORDERS';

-- Convert NULL to default system date
--SELECT NVL(Order_Date, SYSDATE) FROM Orders;