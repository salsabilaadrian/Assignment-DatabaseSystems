--1
CREATE TABLE MsSeller(
	SellerID CHAR(5) PRIMARY Key CHECK (SellerID LIKE 'SE[0-9][0-9][0-9]')
  	SellerUsername VARCHAR(50) CHECK (SellerUsername LIKE '_____%') NOT NULL
  	SellerAddress VARCHAR(100) NOT NULL
)

--2
BEGIN TRAN
ALTER TABLE MsUser 
ADD UserDOB Date

BEGIN TRAN
ALTER TABLE MsUser
ADD cONSTRAINT User_DOB CHECK ([YEAR] => 2000) 

--3
BEGIN TRAN
INSERT INTO MsProduct VALUES
('PR011','PC003','Sensatia Botanical C Serum', CAST(1200000 AS VARCHAR), CAST(100 AS VARCHAR))
ROLLBACK

--4
select ProductName = LOWER(ProductName), [ProductPrice], [ProductStock]
FROM MsProduct
WHERE ProductPrice > 280000

--5
BEGIN TRAN
DELETE MsProduct 
FROM TransactionHeader
WHERE MsProduct.ProductID = TransactionDetail.ProductID AND TransactionDetail.TransactionID = TransactionHeader.TransactionID AND CHECK (ProductName LIKE '%bag%')
ROLLBACK

