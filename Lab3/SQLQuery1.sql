create schema company
alter schema company transfer dbo.departments
create schema HumanResource 
alter schema HumanResource transfer dbo.Employee
-- task 2
go
create type loc from nchar(2)
go
create default d1 as 'NY'
go
sp_bindefault d1, loc
go 
create rule r1 as @x in ('NY', 'DS', 'KW')
go
sp_bindrule r1, 'company.Project.Plocation'
--task 3
create sequence id_num
start with 1
increment by 1
create table newStudent(
id int primary key,
sadd loc )
 go
 insert into[dbo].[newStudent] 
 (sadd)values
 /*(next value for id_num, 'ci'),
 (next value for id_num, 'zo'),
 (next value for id_num, 'Al')*/
-- (next value for id_num, 'fr'),
-- (next value for id_num, 'ju')
	('he')-- yes i can
select next value for id_num
  
 delete from  [dbo].[newStudent] 
 where id=2