--1
SELECT *
FROM Tracks
WHERE Milliseconds > 5000000

--2
SELECT *
FROM Invoices
WHERE Total BETWEEN 5 AND 15

--3
SELECT *
FROM customers
WHERE STATE IN ('RJ','DF,AB','BC','CA','WA','NY')

--4
SELECT *
FROM Invoices
WHERE (CustomerId = 56 OR CustomerId = 58) AND
(TOTAL BETWEEN 1 AND 5)

--5
SELECT *
FROM tracks
WHERE Name LIKE 'All%'

--6
SELECT *
FROM Customers
WHERE Email LIKE 'J%@gmail.com'

--7
SELECT *
FROM Invoices
WHERE BillingCity IN ('Brasília','Edmonton','Vancouver ')
ORDER BY InvoiceId DESC

--8
SELECT CustomerId,COUNT(InvoiceId)
FROM Invoices
GROUP BY CustomerId
ORDER BY COUNT(InvoiceId)

--9
SELECT COUNT(TrackId)
FROM Tracks
GROUP BY AlbumId
HAVING COUNT(TrackId) >= 12