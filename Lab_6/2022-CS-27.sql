-- Return customers and their orders, including customers who placed no orders (CustomerID, OrderID, 
--OrderDate)

select Customers.CustomerID, Orders.OrderID, OrderDate
from Customers
left join Orders on Customers.CustomerID=Orders.CustomerID


--Report only those customer IDs who never placed any order. (CustomerID, OrderID, OrderDate)

select Customers.CustomerID, Orders.OrderID, OrderDate
from Customers
left join Orders on Customers.CustomerID=Orders.CustomerID
where OrderID is null


 --Report those customers who placed orders on July,1997. (CustomerID, OrderID, OrderDate)
select Customers.CustomerID, Orders.OrderID, OrderDate
from Customers
left join Orders on Customers.CustomerID=Orders.CustomerID
where OrderDate between '1996-07-01' AND '1996-07-31'

--Report the total orders of each customer. (customerID, totalorders)
select Customers.CustomerID, count(OrderID) as totalorders
from Customers
left join Orders on Customers.CustomerID=Orders.CustomerID
group by Customers.CustomerID


--Write a query to generate a five copies of each employee. (EmployeeID, FirstName, LastName)
select EmployeeID, FirstName, LastName
from Employees
union all
select EmployeeID, FirstName, LastName
from Employees
union all
select EmployeeID, FirstName, LastName
from Employees
union all
select EmployeeID, FirstName, LastName
from Employees
union all
select EmployeeID, FirstName, LastName
from Employees


 --List all the products whose price is more than average price.
select *
from Products
where UnitPrice > (select avg(UnitPrice) from Products)


 --Find the second highest price of product. 
select max(UnitPrice) as secondHighest
from Products
where UnitPrice < (select max(UnitPrice) from Products)


-- Write a query that returns a row for each employee and day in the range 04-07-1996 through 04-08-
--1997. (EmployeeID, Date)
select EmployeeID, BirthDate
from Employees
where BirthDate between '1996-07-04' and '1997-08-04'


-- Return US customers, and for each customer return the total number of orders and total quantities. 
--(CustomerID, Totalorders, totalquantity)
select Customers.CustomerID, count(Orders.OrderID) as Totalorders, sum(Quantity) as totalquantity
from Customers
left join Orders on Customers.CustomerID=Orders.CustomerID
join [Order Details] on Orders.OrderID=[Order Details].OrderID
where Country='USA'
group by Customers.CustomerID


-- Write a query that returns all customers in the output, but matches them with their respective orders 
--only if they were placed on July 04,1997. (CustomerID, CompanyName, OrderID, Orderdate)
select Customers.CustomerID, CompanyName, OrderID, OrderDate
from Customers
left join Orders on Customers.CustomerID=Orders.CustomerID
where OrderDate='1997-07-04'


 --List the names of products which were ordered on 8th August 1997. (ProductName, OrderDate)
select ProductName, OrderDate
from Products
join [Order Details] on Products.ProductID=[Order Details].ProductID
join Orders on [Order Details].OrderID=Orders.OrderID
where OrderDate='1997-08-08'


-- List the addresses, cities, countries of all orders which were serviced by Anne and were shipped late. 
--(Address, City, Country)
select ShipAddress, ShipCity, ShipCountry
from Orders
join Employees on Orders.EmployeeID=Employees.EmployeeID
where Employees.FirstName='Anne' AND RequiredDate<ShippedDate


 --List all countries to which beverages have been shipped. (Country)
select ShipCountry
from Orders
join [Order Details] on Orders.OrderID=[Order Details].OrderID
join Products on [Order Details].ProductID=Products.ProductID
join Categories on Products.CategoryID=Categories.CategoryID
where CategoryName='beverages'