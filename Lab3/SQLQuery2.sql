with cte 
as 
(
select p.FirstName+''+p.LastName as full_name, e.Gender, e.MaritalStatus,(year(getdate())-year(BirthDate)) as age
from [Person].[Person] p
join [HumanResources].[Employee] e
on p.BusinessEntityID = e.BusinessEntityID
)
select full_name from cte
where Gender = 'F' and MaritalStatus= 'S' and age<40
alter table [HumanResources].[Employee]
add age as(year(getdate())-year(BirthDate))
select * from  [HumanResources].[Employee]



create table test(
first_name nvarchar(50),
last_name nvarchar(50)
)
go
with t 
as 
(select FirstName, LastName
from [Person].[Person])
INSERT INTO [dbo].[test]  
SELECT FirstName, LastName   
FROM t 