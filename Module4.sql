--1
SELECT CustomerId, FirstName, LastName, 
UPPER(City || ' ' || Country) AS `City Country`
FROM Customers

--2
SELECT LastName, FirstName,
LOWER(SUBSTR(FirstName,1,4) || SUBSTR(LastName, 1,2))
FROM Employees

--3
SELECT FirstName, LastName, HireDate,
(DATE('now')-HireDate)
FROM employees
ORDER BY LastName ASC

--4
SELECT FirstName, LastName, Company
FROM Customers
WHERE Company IS NULL

--5
SELECT City,COUNT(CustomerId)
FROM Customers
GROUP BY City
ORDER BY COUNT(CustomerId) DESC

--6
SELECT FirstName, LastName, InvoiceId,
(FirstName || LastName || InvoiceID) AS `ID`
FROM Customers
JOIN Invoices
ON Customers.CustomerId = Invoices.CustomerId
ORDER BY FirstName, LastName, InvoiceId

