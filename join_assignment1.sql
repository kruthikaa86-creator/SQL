CREATE TABLE customers(
    CUSTOMER_ID NUMBER PRIMARY KEY,
    FIRST_NAME VARCHAR2(50),
    LAST_NAME VARCHAR2(50),
    CITY VARCHAR2(50),
    PHONE_NUMBER VARCHAR2(20),
    LOYALTY_POINTS NUMBER
);
CREATE TABLE ORDERS(
    ORDER_ID NUMBER PRIMARY KEY,
    CUSTOMER_ID NUMBER,
    ORDER_DATE DATE,
    TOTAL_AMOUNT NUMBER(10, 2),
    DISCOUNT_AMT NUMBER(10, 2), 
    SHIPPING_DATE DATE 
);

INSERT INTO CUSTOMERS VALUES (101, 'John', 'Doe', 'New York', '555-0100', 500);
INSERT INTO CUSTOMERS VALUES (102, 'Jane', 'Smith', NULL, '555-0101', 120);
INSERT INTO CUSTOMERS VALUES (103, 'Robert', 'Brown', 'Chicago', NULL, 0);
INSERT INTO CUSTOMERS VALUES (104, 'Emily', 'Davis', NULL, NULL, NULL); -- Lots of NULLs
INSERT INTO CUSTOMERS VALUES (105, 'Michael', 'Wilson', 'Miami', '555-0105', NULL);

INSERT INTO ORDERS VALUES (5001, 101, DATE '2023-10-01', 150.00, 10.00, DATE '2023-10-03');
INSERT INTO ORDERS VALUES (5002, 102, DATE '2023-10-02', 200.50, NULL, DATE '2023-10-05'); -- No discount
INSERT INTO ORDERS VALUES (5003, 101, DATE '2023-10-05', 75.00, 5.00, NULL); -- Not shipped
INSERT INTO ORDERS VALUES (5004, 104, DATE '2023-10-06', 300.00, NULL, NULL); -- No discount, Not shipped
INSERT INTO ORDERS VALUES (5005, 105, DATE '2023-10-07', 50.00, 0.00, DATE '2023-10-08');
INSERT INTO ORDERS VALUES (5006, NULL, DATE '2023-10-08', 20.00, NULL, DATE '2023-10-09'); -- Orphan order

COMMIT;

select * from orders;

select * from CUSTOMERS;
-- 1. (Inner Join) Retrieve a list of customers who have placed at least one order. Display Name and Order ID. Note: This excludes customers with no orders and orders with NULL Customer IDs.
SELECT C.FIRST_NAME, C.LAST_NAME, O.ORDER_ID
FROM orders o
INNER JOIN CUSTOMERS C 
ON o.CUSTOMER_ID = c.CUSTOMER_ID;

-- 2. (Left Join) List all customers and their Order IDs. Include customers who have not placed any orders. Note: Returns NULL in the Order column for customers like 'Robert' or 'Emily'.
SELECT c.FIRST_NAME, o.ORDER_ID
from CUSTOMERS C
left join ORDERS o 
ON C.CUSTOMER_ID = O.CUSTOMER_ID

--3. (Left Join - Finding Non-Matches) Find customers who have NEVER placed an order. Note: We join, then filter for where the "Right" table is NULL.
SELECT C.FIRST_NAME, C.LAST_NAME
FROM CUSTOMERS C
LEFT JOIN ORDERS O 
ON C.CUSTOMER_ID = O.CUSTOMER_ID

--4. (Right Join) List all orders and the associated customer name. Include orders that do not have a linked Customer ID. Note: This will show Order 5006, which has a NULL Customer_ID.
SELECT C.FIRST_NAME, O.ORDER_ID, O.TOTAL_AMOUNT
FROM CUSTOMERS C
RIGHT JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID

--5. (Full Outer Join) List ALL customers and ALL orders. If a customer has no order, show NULLs for order info. If an order has no customer, show NULLs for customer info.
SELECT C.FIRST_NAME, O.ORDER_ID
FROM CUSTOMERS C
FULL OUTER JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID

--6. (Left Join with NVL) Calculate the total amount spent by each customer. If they haven't bought anything, display 0 instead of NULL.
SELECT C.FIRST_NAME, NVL(SUM(O.TOTAL_AMOUNT), 0) AS TOTAL_SPENT
FROM CUSTOMERS C
LEFT JOIN ORDERS O 
ON C.CUSTOMER_ID = O.CUSTOMER_ID
GROUP BY C.FIRST_NAME;

--7. (Self Join) Find pairs of customers who live in the same City. Note: We must exclude NULL cities and ensure we don't match a customer to themselves.
SELECT A.FIRST_NAME AS GRP_1, B.FIRST_NAME AS GRP_2, A.CITY
FROM CUSTOMERS A
JOIN CUSTOMERS B 
ON A.CITY = B.CITY
WHERE A.CUSTOMER_ID < B.CUSTOMER_ID
AND A.CITY IS NOT NULL

--8. (Cross Join) Generate a theoretical list of every customer buying every order (Cartesian Product).
SELECT C.FIRST_NAME,O.ORDER_ID
FROM CUSTOMERS C 
CROSS JOIN ORDERS O

--9. (Natural Join) Join Customers and Orders automatically based on the common column (CUSTOMER_ID). Note: Oracle does not require table aliases on the common column in a Natural Join.
SELECT FIRST_NAME,ORDER_ID
FROM CUSTOMERS
NATURAL JOIN ORDERS

--10. (Left Join & Filtering) List all Customers and their Order Dates, but only for orders placed after October 5th. Keep customers with NO orders in the list. Note: The condition must be in the ON clause, not WHERE, to preserve the Left Join behavior for non-matching rows.
SELECT C.FIRST_NAME,O.ORDER_ID
FROM Customers C
LEFT JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID
AND O.ORDER_DATE >DATE '2023-10-05'
