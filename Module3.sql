--1

SELECT Name
FROM Tracks
JOIN Albums
ON Tracks.AlbumId = Albums.AlbumId
WHERE Title = 'Californication'

--2
SELECT COUNT(InvoiceId), FirstName, LastName, City, Email
FROM Customers AS c
JOIN Invoices AS i
ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId

--3
SELECT Name, Title, ArtistId, TrackId
FROM Tracks AS t
JOIN Albums AS a
ON a.AlbumId = t.AlbumId

--4
SELECT A.LastName AS Manager,
B.LastName AS Employee
FROM Employees A
JOIN Employees B
ON B.ReportsTo = A.EmployeeId

--5
SELECT Artists.ArtistID, Name, Title
FROM Artists 
LEFT JOIN Albums
ON Artists.ArtistId = Albums.ArtistID
WHERE Title IS  NULL

--6
SELECT FirstName, LastName
FROM Employees
UNION
SELECT FirstName, LastName
FROM Customers
ORDER BY LastName DESC

n