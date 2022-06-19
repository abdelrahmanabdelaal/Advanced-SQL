/*
1.	Display the SalesOrderID, ShipDate of the SalesOrderHearder table (Sales schema) to designate SalesOrders that occurred within the period ‘7/28/2008’ and ‘7/29/2014’
*/
select SalesOrderID, ShipDate from [Sales].[SalesOrderHeader] where ShipDate between '7/28/2008' and '7/29/2014' 
/*
2.	Display only Products(Production schema) with a StandardCost below $110.00 (show ProductID, Name only)
*/
select ProductID, Name from [Production].[Product] where StandardCost < 110.00
/*
3.	Display ProductID, Name if its weight is unknown
*/
select ProductID, Name from [Production].[Product] where Weight is not null
/*
4.	 Display all Products with a Silver, Black, or Red Color
*/
select ProductID, Name, Color from [Production].[Product] where Color = 'silver' or Color = 'black' or color = 'red'
/*
5.	 Display any Product with a Name starting with the letter B
*/
select ProductID, Name from [Production].[Product] where Name like 'B%' 

select * into New_table
from Sales.Store
