use AdventureWorks2012
--1
select SalesOrderID,ShipDate
from  sales.SalesOrderHeader
where ShipDate between  7/28/2002 and 7/29/2014
--2
select ProductID, Name
from Production.Product
Where StandardCost<11000
--3
select ProductID, Name
from Production.Product
where weight is null
--4
select Name, Color 
from Production.Product
where Color  in ('Silver' , 'Black', 'Red')
--5
select name
from Production.Product
where name like 'B%'
--6
UPDATE Production.ProductDescription
SET Description = 'Chromoly steel_High of defects'
WHERE ProductDescriptionID = 3 
select Description
from Production.ProductDescription 
where Description like'%_%'
--7
select sum(TotalDue),OrderDate
from Sales.SalesOrderHeader
group by OrderDate
having OrderDate between '7/1/2001' and '7/31/2014'
--8
select DISTINCT HireDate
from HumanResources.Employee
--9
select  AVG(DISTINCT ListPrice)
 from Production.Product
 
--10

select FORMATmessage (Name,convert(varchar(20),ListPrice),'The %s is only! %s') as Result
from Production.Product 
where ListPrice between 100and 120 
order by ListPrice
------
select concat('the [',name ,'] is only!',' [',listprice,']') as product_name_price
from Production.Product
where ListPrice between 100 and 120
order by ListPrice
--11

select rowguid ,Name, SalesPersonID, Demographics into store_Archive
FROM Sales.Store
select* 
from store_Archive
---------
select* 
from store_Archive
where Name=132
--12
select format(getdate(),'dd-MM-yyyy')
union
select format(getdate(),'dddd MMMM yyyy')
union
select format(getdate(),'ddd MMM yy')
union
select format(getdate(),'dddd')
union
select format(getdate(),'MMMM')
union
select format(getdate(),'hh:mm:ss')
union
select format(getdate(),'hh tt')
union
select format(getdate(),'HH')
union
select format(getdate(),'dd-MM-yyyy hh:mm:ss')
union
select format(getdate(),'dd-MM-yyyy hh:mm:ss tt')