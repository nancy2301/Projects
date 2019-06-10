USE Evergreen_Shipment;

# ---------------------------------------------------------------------- #
# Add View "Order Sales"                                             #
# ---------------------------------------------------------------------- #

DROP VIEW IF EXISTS vw_Order_Sales;

CREATE VIEW vw_Order_Sales AS
SELECT OrderDetailsInfo.OrderID, 
Sum(OrderDetailsInfo.UnitPrice*Quantity) AS Sales
FROM OrderDetailsInfo
GROUP BY OrderDetailsInfo.OrderID;

# ---------------------------------------------------------------------- #
# Add View "vw_Invoices"                                             #
# ---------------------------------------------------------------------- #

DROP VIEW IF EXISTS vw_Invoices;

-- All information (order, customer, shipper)
-- for each `Order Details` line.
-- An invoice is supposed to be per order?!
CREATE VIEW vw_Invoices
AS
SELECT 
   Orders.ShipName AS ShipName,
   Orders.ShipAddress AS ShipAddress,
   Orders.ShipCity AS ShipCity,
   Orders.ShipRegion AS ShipRegion, 
   Orders.ShipPostalCode AS ShipPostalCode,
   Orders.ShipCountry AS ShipCountry,
   Orders.CustomerID AS CustomerID,
   Customers.FirstName AS FirstName,
   Customers.LastName AS LastName,
   Customers.CustomerAddress AS CustomerAddress,
   Customers.CustomerCity AS CustomerCity,
   Customers.CustomerRegion AS CustomerRegion,
   Customers.CustomerPostalCode AS CustomerPostalCode,
   Customers.CustomerCountry AS CustomerCountry,
   (Employees.FirstName + ' ' + Employees.LastName) AS Salesperson, 
   Orders.OrderID AS OrderID,
   Orders.OrderDate AS OrderDate,
   Orders.ExpectedArrivalDate AS ExpectedArrivalDate,
   Orders.ShippedDate AS ShippedDate, 
   Shippers.CompanyName As ShipperName,
   `Order Details`.ProductID AS ProductID,
   Products.ProductName AS ProductName, 
   `Order Details`.UnitPrice AS UnitPrice,
   `Order Details`.Quantity AS Quantity,
   FLOOR(`Order Details`.UnitPrice*Quantity) AS ExtendedPrice,
         -- truncate to nearest dollars
   Orders.FreightAmount AS FreightAmount
FROM CustomersInfo as Customers
   LEFT JOIN OrdersInfo as Orders ON Customers.CustomerID = Orders.CustomerID  
   LEFT JOIN EmployeesInfo as Employees ON Employees.EmployeeID = Orders.EmployeeID    
   LEFT JOIN OrderDetailsInfo as `Order Details` ON Orders.OrderID = `Order Details`.OrderID     
   LEFT JOIN ProductsInfo as Products ON Products.ProductID = `Order Details`.ProductID      
   LEFT JOIN ShippersInfo as Shippers ON Shippers.ShipperID = Orders.ShipperID;



# ---------------------------------------------------------------------- #
# Add View "vw_Products_Above_Average_Price"                                             #
# ---------------------------------------------------------------------- #

DROP VIEW IF EXISTS vw_Products_Above_Average_Price;

CREATE VIEW vw_Products_Above_Average_Price
AS
SELECT ProductName, UnitPrice
FROM ProductsInfo
WHERE UnitPrice > (SELECT AVG(UnitPrice) From ProductsInfo);  -- subquery


# ---------------------------------------------------------------------- #
# Add View "vw_Alphabetical_list_of_products"                                             #
# ---------------------------------------------------------------------- #

-- List products (with category) order by ProductID
-- which is arranged alphabetically in ProductName
DROP VIEW IF EXISTS vw_Alphabetical_list_of_products;

CREATE VIEW vw_Alphabetical_list_of_products
AS
SELECT Products.*, Categories.CategoryName
FROM CategoriesInfo Categories 
   LEFT JOIN ProductsInfo Products ON Categories.CategoryID = Products.CategoryID
ORDER BY Products.ProductName;  -- FALSE

# ---------------------------------------------------------------------- #
# Add Procedure "CustOrdersTracking"                                       #
# Add Procedure "sp_CustOrdersOrders"                                       #
# ---------------------------------------------------------------------- #

DROP PROCEDURE IF EXISTS sp_CustOrdersTracking;

DELIMITER $$

CREATE PROCEDURE sp_CustOrdersTracking(in AtCustomerID varchar(5))
BEGIN
      SELECT OrderID,
	OrderDate,
	ExpectedArrivalDate,
	ShippedDate,
    TrackingID
FROM OrdersInfo
WHERE CustomerID = AtCustomerID
ORDER BY OrderID;

END $$

DELIMITER ;

# CALL sp_CustOrdersTracking('C101')

# ---------------------------------------------------------------------- #
# Add Procedure "sp_Sales by Month", Join and Subquery                         #
# ---------------------------------------------------------------------- #
DROP PROCEDURE IF EXISTS sp_Sales_by_Month;

DELIMITER $$

CREATE PROCEDURE sp_Sales_by_Month(in AtBeginning_Date Datetime,in AtEnding_Date Datetime)
BEGIN

    SELECT OrdersInfo.ShippedDate,
	   OrdersInfo.OrderID,
	  vw_Order_Sales.Sales,
	  ShippedDate AS Month
FROM OrdersInfo  LEFT JOIN vw_Order_Sales ON OrdersInfo.OrderID = vw_Order_Sales.OrderID
WHERE ShippedDate in (Select ShippedDate from OrdersInfo 
						where OrdersInfo.ShippedDate Between AtBeginning_Date And AtEnding_Date);

END $$
DELIMITER ;

# CALL sp_Sales_by_Month('2018-07-06 00:00:00.000', '2018-07-12 00:00:00.000')

# ---------------------------------------------------------------------- #
# Add Procedure "sp_AddModify_OrderDetailsAndProducts"    , Insert and update                                   #
# ---------------------------------------------------------------------- #
DROP PROCEDURE IF EXISTS sp_AddModify_OrderDetailsAndProducts; 

DELIMITER $$

CREATE PROCEDURE sp_AddModify_OrderDetailsAndProducts(
IN order_ID NVARCHAR(10),
IN product_ID NVARCHAR(10),
IN quantity_bought INT(2))

BEGIN

IF quantity_bought > (SELECT UnitsInStock FROM ProductsInfo WHERE ProductID = product_id) THEN

signal sqlstate '45000' set message_text = 'Quantity of product ordered is larger than instock quantity.';

ELSE

INSERT INTO OrderDetailsInfo VALUES
(order_ID,
product_ID,
(SELECT UnitPrice FROM ProductsInfo WHERE ProductID = product_id),
quantity);

UPDATE ProductsInfo
SET UnitsInStock = UnitsInStock - quantity_bought 
WHERE ProductID = product_id;

END IF;

END $$

DELIMITER ;

# --------------------------------------------------------------------------------------- #
# SampleUpdate
# CALL sp_AddModify_OrderDetailsAndProducts('O111', 'P110', 1000); #       
# Running this query will raise following error, since quantity 32 is greater than instock quantity of product 'P110' 
# Error : 'Quantity of product ordered is larger than instock quantity.'

# CALL sp_AddModify_OrderDetailsAndProducts('O122', 'P101', 10); #       
# ---------------------------------------------------------------------- -----------------#


# ---------------------------------------------------------------------- #
# Add Procedure "sp_AddModify_Products"    , Insert and update                                   #
# ---------------------------------------------------------------------- #
DROP PROCEDURE IF EXISTS sp_AddModify_Products; 

DELIMITER $$

CREATE PROCEDURE sp_AddModify_Products(
IN product_id NVARCHAR(10),
IN product_name NVARCHAR(40),
IN supplier_id NVARCHAR(10),
IN category_id NVARCHAR(10),
IN qty_perunit NVARCHAR(20),
IN unit_price FLOAT(10,4),
IN units_toinsert INT(2),
IN unitson_order INT(2))

BEGIN

IF NOT EXISTS  (SELECT * FROM ProductsInfo WHERE ProductID = product_id ) THEN

INSERT INTO ProductsInfo VALUES
(product_id,
product_name,
supplier_id,
category_id,
qty_perunit,
unit_price,
units_toinsert,
unitson_order);

ELSE

UPDATE ProductsInfo
SET
UnitsInStock = UnitsInStock + units_toinsert 
WHERE ProductID = product_id;

END IF;

END $$

DELIMITER ;

# --------------------------------------------------------------------------------------- #
# SampleUpdate
#CALL sp_AddModify_Products('P110', 'Ball Pen', 'S105', 'C104', '10 pens per packet', 11, 10, 0); #                                     #
# ---------------------------------------------------------------------- -----------------#

