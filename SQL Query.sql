-- tugas penerapan sql

-- select
SELECT ProductName, ProductPrice FROM product;
SELECT ProductID, ShipmentDate FROM shipment;

-- Arithmetic Expression
SELECT ComponentName, Price, Price + (Price * 0.1) AS Diskon10Persen
FROM componentt;
SELECT ComponentID, Quantity + 100 
FROM inventory;

-- Functions
SELECT avg(ProductPrice) as averagePrice
FROM product;
SELECT count(Quantity)
FROM restock
WHERE Quantity = 100;
SELECT sum(Quantity)
FROM restock;

-- Wildcard
SELECT *
FROM customer
WHERE CustomerName LIKE '_o%';
SELECT *
FROM product
WHERE ProductName LIKE 'Pop%';

-- Comparison Operators
SELECT ProductName, ProductPrice
FROM product
WHERE ProductPrice >= 230000;
SELECT ComponentName, Price
FROM componentt
WHERE Price < 2000000;

-- NULL Values
SELECT *
FROM product
WHERE ProductID IS NULL;
SELECT *
FROM product
WHERE ProductID IS NOT NULL;

-- Boolean Operators
SELECT *
FROM product
WHERE ProductName LIKE 'Plushy%' OR ProductPrice > 590000;
SELECT *
FROM supplier
WHERE SupplierAddress LIKE 'Jl. Iluna%' AND SupplierID = '1423000000';

-- Range
SELECT ProductName
FROM product
WHERE ProductPrice BETWEEN 200000 AND 700000;
SELECT ComponentID
FROM restock
WHERE Quantity NOT BETWEEN 50 AND 100;

-- Distinct
SELECT DISTINCT ShipmentDate
FROM shipment;
SELECT DISTINCT SupplierAddress
FROM supplier;

-- IN
SELECT *
FROM shipment
WHERE ShipmentDate NOT IN ('2023-01-31', '2023-02-01');
SELECT *
FROM restock
WHERE Quantity IN (50, 100);

-- Order By
SELECT CustomerID, CustomerName
FROM customer
Order by CustomerName;
SELECT CustomerID, CustomerName, CustomerAddress
FROM customer
Order by CustomerAddress ASC, CustomerName DESC;

-- GROUP BY
SELECT count(InventoryID), Quantity
FROM inventory
GROUP BY Quantity;
SELECT count(ComponentID), Price
FROM componentt
GROUP BY Price;

-- having
SELECT count(InventoryID), Quantity
FROM inventory
GROUP BY Quantity
HAVING count(InventoryID) >  2;
SELECT count(ComponentID), Price
FROM componentt
GROUP BY Price
HAVING count(ComponentID) > 1;

-- equil join
SELECT componentt.ProductionDate, componentt.ComponentName, inventory.Quantity
FROM componentt, inventory
WHERE componentt.ComponentID = inventory.ComponentID
ORDER BY inventory.Quantity;
SELECT A.CustomerName, B.OrderID, B.Item_Name
FROM customer A, orderr B
WHERE A.CustomerID = B.CustomerID
ORDER BY B.Quantity;

-- inner join
SELECT componentt.ProductionDate, componentt.ComponentName, inventory.Quantity
FROM componentt
INNER JOIN inventory
ON componentt.ComponentID = inventory.ComponentID;
SELECT customer.CustomerName, orderr.OrderID, orderr.Item_Name
FROM customer
INNER JOIN orderr
ON customer.CustomerID = orderr.CustomerID;

-- Natural join
SELECT customer.CustomerName, shipment.ShipmentDate, shipment.DistributorContact
FROM customer NATURAL JOIN shipment;
SELECT employee.EmployeeName, employee.EmployeeSalary, manufactur_company.CompanyName
FROM employee NATURAL JOIN manufactur_company;

-- Outer join
SELECT customer.CustomerName, orderr.Item_Name
FROM customer LEFT JOIN orderr
ON customer.CustomerID = orderr.CustomerID;
SELECT product.ProductName, shipment.DistributorContact, product.ProductPrice
FROM shipment RIGHT JOIN product
ON shipment.ProductID = product.ProductID;

-- self join
SELECT A.ComponentID AS ID1, B.ComponentID AS ID2, A.Quantity
FROM Inventory A, Inventory B
WHERE A.ComponentID <> B.ComponentID
AND A.Quantity = B.Quantity
ORDER BY A.Quantity;
SELECT A.InventoryID AS ID_Inventory1, B.InventoryID AS ID_Inventory2, A.Quantity
FROM Restock A, Restock B
WHERE A.InventoryID <> B.InventoryID
AND A.Quantity = B.Quantity
ORDER BY A.Quantity;

-- subquery where
SELECT componentName, Price
FROM componentt
WHERE Price > (SELECT avg(Price) FROM componentt);
SELECT InventoryID, Quantity
FROM inventory
WHERE Quantity > (Select avg(Quantity) From inventory); 

-- subquery select
SELECT *, 
(SELECT COUNT(*) FROM orderr WHERE orderr.CustomerID = customer.CustomerID) AS banyak
FROM customer;
SELECT *, 
(SELECT COUNT(*) FROM inventory WHERE inventory.ComponentID = componentt.ComponentID) AS banyak
FROM componentt;

-- subquery from
SELECT *
FROM (SELECT OrderID FROM orderr WHERE ManagerID = '12345') AS Orrder
JOIN orderr
WHERE Orrder.OrderID = orderr.OrderID;
SELECT *
FROM (SELECT ProductPrice FROM product WHERE ProductPrice > 200000) AS HargaBarang
JOIN product
WHERE HargaBarang.ProductPrice = product.ProductPrice;

-- correlated subqueries
SELECT *
FROM product AS product1
WHERE ProductPrice > (SELECT AVG(product2.ProductPrice) FROM product AS product1, product AS product2 WHERE product2.ProductID = product1.ProductID);
SELECT *
FROM employee AS employee1
WHERE EmployeeSalary > (SELECT AVG(employee2.EmployeeSalary) FROM employee AS employee1, employee AS employee2 WHERE employee2.EmployeeID = employee1.EmployeeID);

-- Combining queries
SELECT Item_Name FROM orderr
UNION
SELECT ProductName FROM product;
SELECT * FROM product
WHERE ProductPrice > 200000
INTERSECT
SELECT * FROM inventory
WHERE quantity > 500;

SELECT count(componentt.ComponentName) AS banyakKomponen, inventory.Quantity
FROM componentt JOIN inventory
ON componentt.ComponentID = inventory.ComponentID
GROUP BY inventory.Quantity;

SELECT componentt.ComponentName, count(inventory.Quantity)
FROM componentt JOIN inventory
ON componentt.ComponentID = inventory.ComponentID
GROUP BY ComponentName;

SELECT componentt.ComponentName, inventory.Quantity, restock.StockOrderDate
FROM componentt JOIN inventory JOIN restock
ON componentt.ComponentID = inventory.ComponentID;

SELECT componentt.ComponentName, inventory.Quantity, manufactur_company.CompanyName
FROM componentt Join inventory
ON componentt.ComponentID = inventory.ComponentID
Join manufactur_company
ON inventory.CompanyID = manufactur_company.CompanyID;

SELECT A.CustomerName, B.Item_Name, C.ManagerID
FROM customer A JOIN orderr B
ON A.CustomerID = B.CustomerID
JOIN manager C
ON B.ManagerID = C.ManagerID;

SELECT A.Item_Name, A.Item_Price, B.ProductID, C.ManagerID
FROM product B Join orderr A
ON B.ProductName = A.Item_Name
JOIN manager C
ON C.ManagerID = A.ManagerID;

SELECT count(product.ProductName), orderr.Item_Price
FROM product, orderr
WHERE product.ProductName = orderr.Item_Name
group by orderr.Item_Price;