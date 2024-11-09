REM   Script: Customer -Order
REM   Queries of Question 2

CREATE TABLE CUSTOMER ( 
    CustID INT PRIMARY KEY, 
    Last_Name VARCHAR(50), 
    First_Name VARCHAR(50) 
);

CREATE TABLE ORDERS ( 
    Order_ID INT PRIMARY KEY, 
    Order_Date DATE, 
    Customer_SID INT, 
    Amount DECIMAL(10, 2) CHECK (Amount > 20000), 
    FOREIGN KEY (Customer_SID) REFERENCES CUSTOMER(CustID) 
);

INSERT INTO CUSTOMER (CustID, Last_Name, First_Name) VALUES (1, 'Jones', 'Alice');

INSERT INTO CUSTOMER (CustID, Last_Name, First_Name) VALUES (2, 'Williams', 'John');

INSERT INTO CUSTOMER (CustID, Last_Name, First_Name) VALUES (3, 'Davis', 'Chris');

INSERT INTO CUSTOMER (CustID, Last_Name, First_Name) VALUES (4, 'Smith', 'Eve');

INSERT INTO CUSTOMER (CustID, Last_Name, First_Name) VALUES (5, 'Andrews', 'Paul');

INSERT INTO ORDERS (Order_ID, Order_Date, Customer_SID, Amount) VALUES (101, TO_DATE('2024-01-10', 'YYYY-MM-DD'), 1, 25000);

INSERT INTO ORDERS (Order_ID, Order_Date, Customer_SID, Amount) VALUES (102, TO_DATE('2024-01-15', 'YYYY-MM-DD'), 2, 22000);

INSERT INTO ORDERS (Order_ID, Order_Date, Customer_SID, Amount) VALUES (103, TO_DATE('2024-02-20', 'YYYY-MM-DD'), 3, 29000);

INSERT INTO ORDERS (Order_ID, Order_Date, Customer_SID, Amount) VALUES (104, TO_DATE('2024-03-05', 'YYYY-MM-DD'), 4, 33000);

INSERT INTO ORDERS (Order_ID, Order_Date, Customer_SID, Amount) VALUES (105, TO_DATE('2024-03-12', 'YYYY-MM-DD'), 5, 27000);

SELECT CUSTOMER.CustID, CUSTOMER.Last_Name, CUSTOMER.First_Name, ORDERS.Amount 
FROM CUSTOMER 
JOIN ORDERS ON CUSTOMER.CustID = ORDERS.Customer_SID;

SELECT * FROM CUSTOMER 
WHERE Last_Name LIKE '%s';

SELECT * FROM ORDERS 
WHERE Amount BETWEEN 21000 AND 30000;

SELECT Order_ID, Amount + 500 AS "new amount" 
FROM ORDERS;

SELECT Order_ID, SUM(Amount) OVER () AS Total_Amount 
FROM ORDERS;

SELECT SUM(Amount) AS Total_Amount 
FROM ORDERS 
WHERE Amount > 15000;

