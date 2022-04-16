--Select
--1. Write a query to calculate the payments each sales agent is responsible for. Display the agent name and the total payments.
SELECT SUM(o.ord_amount) AS total, a.agent_name
FROM orders o, agents a
WHERE o.agent_code = a.agent_code
GROUP BY a.agent_name;
--2. Write a query to calculate payments for each sales agent by country of the sales agent. Display the agent country and total payments.
SELECT SUM(o.ord_amount) AS total, a.COUNTRY
FROM orders o, agents a
WHERE o.agent_code = a.agent_code
GROUP BY a.COUNTRY;
--3. Calculate the commission for each order. Display order id, customer name, agent name, and commission amount.
SELECT o.ord_num, c.cust_name, a.agent_name, a.commission
FROM agents a, orders o, customer c
WHERE o.agent_code = a.agent_code = c.agent_code
GROUP BY o.ord_num;

--Update
--In the customers table, for customers from New York update the CUST_CITY value to change it from “New York” to “NY”.
UPDATE customer
SET CUST_CITY = 'NY'
WHERE CUST_CITY = 'NEW YORK';

--A. Now write an query to select all customers from New York City.
SELECT cust_name, CUST_CITY
FROM customer
WHERE cust_city = 'NY';

--Increase the commission for sales agents from London by 20%.
UPDATE agents
SET COMMISSION = COMMISSION + .20
WHERE COUNTRY = 'LONDON';
--B. Calculate the commission for each order where the agent is from London. Display order id, customer name, agent name, and commission amount.
SELECT o.ord_num, c.cust_name, a.agent_name, a.commission
FROM orders o, agents a, customer c
WHERE o.agent_code = a.agent_code = c.agent_code AND a.country= 'London'
GROUP BY o.ord_num;

--Update customers with grade 2 to grade 3.
UPDATE customer
SET GRADE = '3'
WHERE GRADE = '2';
--C. Select all customers names and customer codes with grade 3.
SELECT cust_name, cust_code
FROM customer
WHERE GRADE = 3; 

--Delete
--1.Delete sales agents from Bangalore.
DELETE FROM agents
WHERE working_area = 'Bangalore';
--E. Write a query to select all columns for all sales agents
SELECT *
FROM agents;

--2.Delete customers whose name begins with the letter “S”.
DELETE FROM customer
WHERE cust_name LIKE 'S%';
--F. Select all columns for all customers.
SELECT *
FROM customer;