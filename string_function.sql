--1)Write a query to convert all customer names to uppercase.
--SELECT UPPER(Customer_Name) AS UPPER_NAME FROM ORDERS;

--2)Extract the first 5 characters from Product_Name.
--SELECT SUBSTR(product_name,1,5) AS product_prefix FROM ORDERS

--3)Find the length of each Customer_Name.
--SELECT length(customer_name) AS name_length FROM ORDERS

--4)Replace the word "Rice" with "Premium Rice" in Product_Name.
--SELECT REPLACE(Product_Name, 'rice','Premium Rice')AS product_name FROM ORDERS 

--5)Remove leading and trailing spaces from Customer_Name.
--SELECT TRIM(customer_name)from ORDERS

--6)Concatenate First_Name and Last_Name as Full_Name.
--select first_name|| ' ' ||last_name as full_name from orders

--7)Find customers whose names start with 'A'.
--SELECT CUSTOMER_NAME FROM ORDERS WHERE CUSTOMER_NAME LIKE 'A%'

--8)Extract the domain name from Email_ID.


--9)Find the position of '@' in Email_ID.
--SELECT instr(Email_ID,'@') AS @_POSITION FROM ORDERS

--10)Reverse the Product_Name.
--SELECT REVERSE(PRODUCT_NAME) AS reverse FROM ORDERS

--11)Convert the first letter of each word in Product_Name to uppercase.
-- select initcap(product_name) from orders;

--12) Extract the last 3 characters from Order_ID.
-- select substr(order_id,-3) from ORDERS;

--13)Count how many times letter 'a' appears in Customer_Name.
-- select count(customer_name,'a') from orders;

--14)Mask the last 4 digits of a phone number.
-- select substr(phone_number,1,length(phone_number)-4) ||'****' as masked_number from orders;

-- 15)Split Full_Name into First_Name and Last_Name.
-- SELECT SUBSTR(Full_Name, 1, INSTR(Full_Name, ' ') - 1) AS First_Name,SUBSTR(Full_Name, INSTR(Full_Name, ' ') + 1) AS Last_Name FROM orders;

--16)Remove all special characters from Product_Code.
-- select trim(product_code) from orders;

--17) Compare two columns ignoring case sensitivity.
-- select * from orders where upper(CUSTOMER_NAME)= UPPER(PRODUCT_NAME);

--18) Find customers whose name contains 'kumar'.
-- select * from orders where lower(CUSTOMER_NAME) like '%kumar%';

--19)Pad Order_ID with leading zeros to make it 6 digits.
--select lpad(order_id,6,'0') AS Orderr_ID from orders;

--20)Extract substring between two characters.