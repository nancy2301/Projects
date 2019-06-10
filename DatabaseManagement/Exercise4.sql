
USE Evergreen_Shipment;

# Analytical Query 1
Select s.SupplierID as SupplierID, s.SupplierCity as SupplierCity, p.ProductID as ProductID, 
count(o.OrderID) as NumberOfOrders, IFNULL(sum(o.Quantity),0) as QuantityOfProducts
from SuppliersInfo s left join ProductsInfo p on s.SupplierID = p. SupplierID
left join OrderDetailsInfo o on p.ProductID = o.ProductID
group by s.SupplierID, p.ProductID
order by NumberOfOrders desc, QuantityOfProducts desc;

# Analytical Query 2
Select c.CustomerRegion as CustomerRegion, 
count(c.CustomerID) as NumberofCustomers,count(o.OrderID) as NumberOfOrders
from CustomersInfo c left join OrdersInfo o on c.CustomerID = o.CustomerID
group by c.CustomerRegion
order by NumberofCustomers desc, NumberOfOrders desc;