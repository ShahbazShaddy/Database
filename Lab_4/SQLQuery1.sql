select ProductName
from Products
where UnitPrice >  (select avg(UnitPrice) from Products)

select *
from Orders
order by ShippedDate

select Country
from Suppliers
group by Country
having count(CompanyName)>1

select month(RequiredDate) as [Month Number], count(OrderID) as [Order Delayed]
from Orders
where RequiredDate<ShippedDate
group by month(RequiredDate)
having count(OrderID)>=1

select [Order Details].OrderID, [Order Details].Discount
from Products
join [Order Details] on Products.ProductID=[Order Details].ProductID
where Discontinued=1

select ShipCity,count(OrderID) as [Number of orders]
from Orders
where ShipCountry='USA' and Year(ShippedDate)=1997
group by ShipCity

select ShipCountry as Country, count(OrderID) as [Orders Delayed]
from Orders
where RequiredDate<ShippedDate
group by ShipCountry
having count(OrderID)>=1

select OrderID, Discount, ([Order Details].UnitPrice*[Order Details].Quantity) as [Total Price]
from Products
join [Order Details] on Products.ProductID = [Order Details].ProductID
where Discontinued=1

select ShipRegion, ShipCity, count(OrderID) as Orders
from Orders
where Year(ShippedDate)=1997
group by ShipRegion, ShipCity