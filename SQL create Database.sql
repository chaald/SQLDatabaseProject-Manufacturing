CREATE DATABASE manufacturing;

USE manufacturing;

CREATE TABLE Product (
	ProductID varchar(10),
    ProductName varchar(100),
    ProductPrice int,
    MFG_Date Date,
    PRIMARY KEY(ProductID)
);

INSERT INTO Product
VALUE ('37300', 'Nendoroid Traveler-Lumine', 1300000, '2021-05-16'),
('37301', 'Nendoroid Traveler-Aether', 820000, '2021-07-17'),
('37302', 'Pop Up Parade Figure-Gawr Gura', 590000, '2021-09-18'),
('37303', 'Pop Up Parade Figure-Kobo Kanaeru', 690000, '2021-11-19'),
('37304', 'Plushy-Taka Radjiman', 230000, '2022-01-20'),
('37305', 'Plushy-Zea Cornelia', 230000, '2022-03-21'),
('37306', 'Keychain-Siska Leontyne', 120000, '2022-05-22'),
('37307', 'Keychain-Amicia Michella', 120000, '2022-07-23'),
('37308', 'Keycaps-Jett', 200000, '2022-09-24'),
('37309', 'Keycaps-Sage', 200000, '2022-11-25');

CREATE TABLE Employee (
	EmployeeID varchar(10),
    ProductID varchar(10),
    EmployeeName varchar(100),
    EmployeeSalary int,
    EmployeeAddress varchar(100),
    EmployeeContact varchar(20),
    PRIMARY KEY(EmployeeID),
    FOREIGN KEY(ProfductID) REFERENCES Product(ProductID)
);

INSERT INTO Employee
VALUE ('2232000000', '37300', 'Luca Kaneshiro', 6500000, 'Jl. Luxiem No.1', '087710191817'),
('2232000001', '37301', 'Shu Yamino', 6500000, 'Jl. Luxiem No.2', '082101020304'),
('2232000002', '37302', 'Ike Eveland', 12000000, 'Jl. Luxiem No.3', '082182838485'),
('2232000003', '37303', 'Mysta Rias', 6000000, 'Jl. Luxiem No.4', '087710293847'),
('2232000004', '37304', 'Vox Akuma', 6500000, 'Jl. Luxiem No.5', '087751525354'),
('2232000005', '37305', 'Sonny Brisko', 7000000, 'Jl. Noctyx No.1', '081512131415'),
('2232000006', '37306', 'Uki Violeta', 6000000, 'Jl.Noctyx No.2', '081521232425'),
('2232000007', '37307', 'Alban Knox', 6500000, 'Jl. Noctyx No.3', '081531323435'),
('2232000008', '37308', 'Fulgur Ovid', 7000000, 'Jl.Noctyx No.4', '081541424345'),
('2232000009', '37309', 'Kyo Kaneko', 6500000, 'Jl.Iluna No.1', '081561626364');

SELECT employee.EmployeeName, product.ProductName
FROM employee
LEFT JOIN product
ON employee.ProductID = product.ProductID;

CREATE TABLE Manager (
	ManagerID varchar(10),
    EmployeeID varchar(10),
    ManagerName varchar(100),
    ManagerSalary int,
    ManagerAddress varchar(100),
    ManagerContact varchar(20),
    PRIMARY KEY(ManagerID),
    FOREIGN KEY(EmployeeID) REFERENCES Employee(ID)
);

INSERT INTO Manager
VALUE ('12345', '2232000002', 'Ike Eveland', 12000000, 'Jl.Luxiem No.3', '082182838485');

CREATE TABLE Manufactur_Company (
	CompanyID varchar(10),
    ManagerID varchar(10),
    CompanyName varchar(100),
    CompanyAddress varchar(100),
    CompanyContact varchar(20),
    PRIMARY KEY(CompanyID),
    FOREIGN KEY(ManagerID) REFERENCES Manager(ManagerID)
);


INSERT INTO Manufactur_Company
VALUE ('1928374650', '12345', 'GOOD SMILE Corp.', 'Jl. ILUNA No.7', '021-192837');

CREATE TABLE Customer (
	CustomerID varchar(10),
    CustomerName varchar(100),
    CustomerAddress varchar(100),
    CustomerContact varchar(20),
    PRIMARY KEY(CustomerID)
);

INSERT INTO Customer
VALUE ('2434000000', 'Pomu Rainpuff', 'Jl. Lazulight No.1', '081212131415'),
('2434000001', 'Elira Pendora', 'Jl. Lazulight No.2', '081221232425'),
('2434000002', 'Finana Ryugu', 'Jl. Lazulight No.3', '081231323435'),
('2434000003', 'Rosemi Lovelock', 'Jl. Obsydia No.1', '081241424345'),
('2434000004', 'Petra Gurin', 'Jl. Obsydia No.2', '081251525354'),
('2434000005', 'Selen Tatsuki', 'Jl.Obsydia No.3', '081261626364'),
('2434000006', 'Nina Kosaka', 'Jl. Ethyria No.1', '081271727374'),
('2434000007', 'Millie Parfait', 'Jl. Ethyria No.2', '081281828384'),
('2434000008', 'Enna Alouette', 'Jl. Ethyria No.3', '081291929394'),
('2434000009', 'Reimu Endou', 'Jl. Ethyria No.4', '081201020304');

CREATE TABLE Shipment (
	ShipmentID varchar(10),
    ProductID varchar(10),
    CostumerID varchar(10),
    ShipmentDate Date,
    DistributorContact varchar(20),
    PRIMARY KEY(ShipmentID),
    FOREIGN KEY(ProductID) REFERENCES Product(ProductID),
	FOREIGN KEY(CustomerID) REFERENCES Product(CustomerID)
);

INSERT INTO Shipment
VALUE ('10900', '37304', '2434000008','2023-01-16', '081998979695'),
('10901', '37305', '2434000003', '2023-01-27', '081998979695'),
('10902', '37306', '2434000002', '2023-01-27', '081998979695'),
('10903', '37307', '2434000001', '2023-01-28', '081998979695'),
('10904', '37301', '2434000000', '2023-01-29', '081987868584'),
('10905', '37309', '2434000004', '2023-01-30', '081987868584'),
('10906', '37302', '2434000006', '2023-01-31', '081987868584'),
('10907', '37303', '2434000007', '2023-01-31', '081976757473'),
('10908', '37308', '2434000005', '2023-02-01', '081976757473'),
('10909', '37300', '2434000009', '2023-02-01', '081976757473');

CREATE TABLE Orderr (
	OrderID varchar(10),
    CustomerID varchar(10),
    ManagerID varchar(10),
    Item_Name varchar(100),
    Item_Price int,
    Quantity int,
    Order_Date date,
    PRIMARY KEY(OrderID),
	FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID),
	FOREIGN KEY(ManagerID) REFERENCES Manager(ManagerID)
);

INSERT INTO  Orderr
VALUE ('1', '2434000008', '12345', 'Plushy-Taka Radjiman', 230000, 1, '2023-01-28'),
('2', '2434000003', '12345', 'Plushy-Zea Cornelia', 230000, 1, '2023-01-26'),
('3', '2434000002', '12345', 'Keychain-Siska Leontyne', 120000, 1, '2023-01-26'),
('4', '2434000001', '12345', 'Keychain-Amicia Michella', 120000, 1, '2023-01-27'),
('5', '2434000000', '12345', 'Nendoroid Traveler-Aether', 820000, 1, '2023-01-28'),
('6', '2434000004', '12345', 'Keycaps-Sage', 200000, 1, '2023-01-29'),
('7', '2434000006', '12345', 'Pop Up Parade Figure-Gawr Gura', 590000, 1, '2023-01-30'),
('8', '2434000007', '12345', 'Pop Up Parade Figure-Kobo Kanaeru', 690000, 1, '2023-01-30'),
('9', '2434000005', '12345', 'Keycaps-Jett', 200000, 1, '2023-02-01'),
('10', '2434000009', '12345', 'Nendoroid Traveler-Lumine', 1300000, 1, '2023-02-01');

CREATE TABLE Supplier (
	SupplierID varchar(10),
    SupplierName varchar(100),
    SupplierAddress varchar(100),
    SupplierContact varchar(20),
    PRIMARY KEY(SupplierID)
);

INSERT INTO Supplier
VALUE ('1423000000','PT. Maria', 'Jl. Iluna No.2', '021-112233'),
('1423000001', 'PT. Aia', 'Jl. Iluna No.3', '021-890098'),
('1423000002', 'PT. Aster', 'Jl. Iluna No.4', '021-567765'),
('1423000003', 'PT. Scarle', 'Jl. Iluna No.5', '021-456654'),
('1423000004', 'PT.Ren', 'Jl. Iluna No.6', '021-000345'),
('3645220000', 'PT. Doppio', 'Jl. Xsoleil No.1', '021-002211'),
('3645220001', 'PT. Meloco', 'Jl. Xsoleil No.2', '021-135790'),
('3645220002', 'PT. Haywire', 'Jl. Xsoleil No.3', '021-152637'),
('3645220003', 'PT. Kotoka', 'Jl. Xsoleil No.4', '021-293046'),
('3645220004', 'PT. Vermillion', 'Jl.Xsoleil No.5', '021-708090');

CREATE TABLE Componentt (
	ComponentID varchar(10),
    SupplierID varchar(10),
    ComponentName varchar(100),
    Price int,
    ProductionDate date,
    PRIMARY KEY(ComponentID),
    FOREIGN KEY(SupplierID) REFERENCES Supplier(SupplierID)
);

INSERT INTO Component
VALUE ('2804040000', '1423000000', 'Kain Rasfur', 1000000, '2022-12-20'),
('2804040001', '1423000001', 'Kain Nylex', 1000000, '2022-12-22'),
('2804040002', '1423000002', 'Acrylonitrile Butadiene Styrene', 2000000, '2022-12-24'),
('2804040003', '1423000003', 'Vinyl PVC', 1000000, '2022-12-25'),
('2804040004', '1423000004', 'Resin', 1000000, '2022-12-25'),
('2804040005', '3645220000', 'Polypropylene', 1000000, '2022-12-26'),
('2804040006', '3645220001', 'Die Cast Metal', 2000000, '2022-12-26'),
('2804040007', '3645220002', 'Akrilik', 1000000, '2022-12-26'),
('2804040008', '3645220003', 'Metal', 1500000, '2022-12-27'),
('2804040009', '3645220004', 'Kertas', 1000000, '2022-12-30');

CREATE TABLE Inventory (
	InventoryID varchar(10),
    ComponentID varchar(10),
    CompanyID varchar(10),
    Quantity int,
    PRIMARY KEY(InventoryID),
    FOREIGN KEY(ComponentID) REFERENCES Componentt(ComponentID)
);

INSERT INTO Inventory
VALUE ('1136000000', '2804040000', '1928374650', 1000),
('1136000001', '2804040001', '1928374650', 1000),
('1136000002', '2804040002', '1928374650', 500),
('1136000003', '2804040003', '1928374650', 500),
('1136000004', '2804040004', '1928374650', 100),
('1136000005', '2804040005', '1928374650', 1000),
('1136000006', '2804040006', '1928374650', 100),
('1136000007', '2804040007', '1928374650', 1000),
('1136000008', '2804040008', '1928374650', 1000),
('1136000009', '2804040009', '1928374650', 10000);

CREATE TABLE Restock (
	InventoryID varchar(10),
    ComponentID varchar(10),
    Quantity int,
    StockOrderDate date,
    PRIMARY KEY (InventoryID, ComponentID),
    FOREIGN KEY (InventoryID) REFERENCES Inventory(InventoryID),
    FOREIGN KEY (ComponentID) REFERENCES Componentt(ComponentID)
);

INSERT INTO Restock
VALUE ('1136000000', '2804040000', 100, '2022-12-20'),
('1136000001', '2804040001', 100, '2022-12-22'),
('1136000002', '2804040002', 50, '2022-12-24'),
('1136000003', '2804040003', 50, '2022-12-25'),
('1136000004', '2804040004', 10, '2022-12-25'),
('1136000005', '2804040005', 100, '2022-12-26'),
('1136000006', '2804040006', 10, '2022-12-26'),
('1136000007', '2804040007', 100, '2022-12-26'),
('1136000008', '2804040008', 100, '2022-12-27'),
('1136000009', '2804040009', 1000, '2022-12-30');