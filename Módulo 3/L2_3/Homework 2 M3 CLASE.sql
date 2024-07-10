SELECT 
	distinct concat(c.firstName, ' ', c.LastName) AS nameContact
FROM
	contact c
INNER JOIN
	salesorderheader soh
ON c.ContactID = soh.ContactID
INNER JOIN
	salesorderdetail sod
ON soh.SalesOrderID = soh.SalesOrderID
INNER JOIN
	product p
ON p.ProductID = sod.ProductID
INNER JOIN
	productsubcategory psc
ON p.ProductSubcategoryID = psc.ProductSubcategoryID
INNER JOIN
	shipmethod sm
ON sm.ShipMethodID = soh.ShipMethodID
WHERE YEAR(soh.OrderDate) BETWEEN 2000 AND 2003
AND psc.Name = 'Mountain Bikes'
AND sm.Name = 'CARGO TRANSPORT 5';

SELECT 
	distinct concat(c.firstName, ' ', c.LastName) AS nameContact
FROM
	contact c
INNER JOIN
	salesorderheader soh
ON c.ContactID = soh.ContactID
INNER JOIN
	salesorderdetail sod
ON soh.SalesOrderID = soh.SalesOrderID
INNER JOIN
	product p
ON p.ProductID = sod.ProductID
INNER JOIN
	productsubcategory psc
ON p.ProductSubcategoryID = psc.ProductSubcategoryID
INNER JOIN
	shipmethod sm
ON sm.ShipMethodID = soh.ShipMethodID
WHERE YEAR(soh.OrderDate) BETWEEN 2000 AND 2003
AND psc.Name = 'Mountain Bikes'
AND sm.Name = 'CARGO TRANSPORT 5';