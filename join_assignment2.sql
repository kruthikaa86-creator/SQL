--1)(Inner Join) List the FIRST_NAME of the customer and the TOTAL_AMOUNT for all orders that have a Discount (DISCOUNT_AMT is not null).
SELECT C.FIRST_NAME, O.TOTAL_AMOUNT
FROM CUSTOMERS C
INNER JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID
WHERE O.DISCOUNT_AMT IS NOT NULL

--2)(Left Join) List all Customers. If they have an order, display the ORDER_DATE. If not, ensure the row still appears with a NULL date.
SELECT C.FIRST_NAME, O.ORDER_DATE
FROM CUSTOMERS C
LEFT JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID

--3)(Right Join) Display ORDER_ID and FIRST_NAME. We want to see all orders, including the one with CUSTOMER_ID NULL (Order 5006).
SELECT o.ORDER_ID, c.FIRST_NAME
from Customers C
RIGHT JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID

--4)(Full Outer Join) Find the count of rows returned when you Full Outer Join Customers and Orders. (Try to predict the number before running it).
SELECT COUNT(*)
FROM CUSTOMERS C
FULL OUTER JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID

--5)(Left Join - Anti Join) Find the CUSTOMER_IDs that exist in the CUSTOMERS table but do NOT exist in the ORDERS table.
SELECT C.CUSTOMER_ID
FROM CUSTOMERS c
LEFT JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID
WHERE O.CUSTOMER_ID IS NULL;

--6)(Self Join) Find pairs of Orders (O1, O2) that were placed on the exact same ORDER_DATE.
SELECT O1.ORDER_ID AS ORDER1, O2.ORDER_ID AS ORDER2, O1.ORDER_DATE
FROM ORDERS O1
JOIN ORDERS O2
ON O1.ORDER_DATE = O2.ORDER_DATE
WHERE O1.ORDER_ID < O2.ORDER_ID;

--7)(Cross Join) Create a list showing every Customer paired with every unique CITY found in the Customer table.
SELECT C.FIRST_NAME, CI.CITY
FROM CUSTOMERS C
CROSS JOIN (SELECT DISTINCT CITY FROM CUSTOMERS) CI;

--8)(Inner Join + Aggregates) Calculate the total DISCOUNT_AMT given to customers living in 'New York'.
SELECT SUM(O.DISCOUNT_AMT)
FROM CUSTOMERS C
INNER JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID
WHERE C.CITY = 'New York'

--9)(Left Join + NVL) Select FIRST_NAME and the SHIPPING_DATE. If the shipping date is NULL (either because the order isn't shipped OR the customer has no order), display 'Not Shipped'.
SELECT C.FIRST_NAME, NVL(TO_CHAR(O.SHIPPING_DATE), 'Not Shipped') AS SHIPPING_DATE
FROM CUSTOMERS C
LEFT JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID;

--10)(Right Join) Find the sum of TOTAL_AMOUNT for orders that do not have a linked Customer (Orphan orders).
SELECT SUM(O.TOTAL_AMOUNT)
FROM CUSTOMERS C
RIGHT JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID
WHERE C.CUSTOMER_ID IS NULL;

--11)(Natural Join) Use a Natural Join to display LAST_NAME and TOTAL_AMOUNT. (Be careful: does LOYALTY_POINTS exist in both tables? No? Then it uses CUSTOMER_ID).
SELECT LAST_NAME, TOTAL_AMOUNT
FROM CUSTOMERS
NATURAL JOIN ORDERS;

--12)(Left Join with Multiple Conditions) Join Customers to Orders, but ONLY link orders where the TOTAL_AMOUNT is greater than 100.
SELECT *
FROM CUSTOMERS C
LEFT JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID
AND O.TOTAL_AMOUNT > 100;

--13)(Inner Join) List FIRST_NAME and ORDER_ID for customers who have a Phone Number (IS NOT NULL).
SELECT C.FIRST_NAME,O.ORDER_ID
FROM CUSTOMERS C
INNER JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID
WHERE C.PHONE_NUMBER IS NOT NULL

--14)(Full Join + Coalesce) Display a list of IDs. If it's a Customer without an order, show Customer ID. If it's an Order without a Customer, show Order ID. Use COALESCE.
SELECT COALESCE(C.CUSTOMER_ID, O.ORDER_ID) AS ID
FROM CUSTOMERS C
FULL OUTER JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID;

--15)(Self Join) Find customers who have the same LOYALTY_POINTS value as another customer.
SELECT C1.FIRST_NAME, C2.FIRST_NAME, C1.LOYALTY_POINTS
FROM CUSTOMERS C1
JOIN CUSTOMERS C2
ON C1.LOYALTY_POINTS = C2.LOYALTY_POINTS
WHERE C1.CUSTOMER_ID < C2.CUSTOMER_ID;

--16)(Inner Join) Display FIRST_NAME, CITY, and ORDER_DATE for orders that have actually been shipped (SHIPPING_DATE is not null).
SELECT C.FIRST_NAME, C.CITY, O.ORDER_DATE
FROM CUSTOMERS C
INNER JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID
WHERE O.SHIPPING_DATE IS NOT NULL;

--17)(Left Join) Calculate the Average TOTAL_AMOUNT per Customer. Ensure customers with no orders show up (likely as NULL or 0 depending on how you write the Average).
SELECT C.CUSTOMER_ID, C.FIRST_NAME, AVG(O.TOTAL_AMOUNT,0) AS AVG_AMOUNT
FROM CUSTOMERS C
LEFT JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID
GROUP BY C.CUSTOMER_ID, C.FIRST_NAME;

--18)(Cartesian/Cross) Count how many rows are generated if you Cross Join CUSTOMERS (5 rows) and ORDERS (6 rows).
SELECT COUNT(*)
FROM CUSTOMERS
CROSS JOIN ORDERS;

--19)(Join with Date Comparison) Find Customers who placed an order on the same day their account was created? (Wait, we don't have account creation date. Instead: Find Orders placed after the shipping date? This checks for data errors).
SELECT ORDER_ID, ORDER_DATE, SHIPPING_DATE
FROM ORDERS
WHERE ORDER_DATE > SHIPPING_DATE;

--20)(Three-way Simulation) Advanced Challenge: Perform a Left Join from Customers to Orders, and then Self Join that result to find Customers who have placed more than one order.
SELECT C.FIRST_NAME, O1.ORDER_ID, O2.ORDER_ID
FROM CUSTOMERS C
LEFT JOIN ORDERS O1
ON C.CUSTOMER_ID = O1.CUSTOMER_ID
JOIN ORDERS O2
ON O1.CUSTOMER_ID = O2.CUSTOMER_ID
AND O1.ORDER_ID < O2.ORDER_ID;
