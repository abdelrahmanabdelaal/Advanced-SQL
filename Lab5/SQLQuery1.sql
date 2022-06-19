/*Create a stored procedure to show the number of students per department.[use ITI DB]*/
alter proc StudentNumber
as 
select count(s.St_Id)  
from Student s
group by s.Dept_Id 
having Dept_Id is not null
StudentNumber
/*2.Create a trigger to prevent anyone from inserting a new record in the Department
table [ITI DB]. “Print a message for the user to tell him that he can’t 
insert a new record in that table”.*/
create trigger NoInsert
on [dbo].[Department]
instead of insert
as
select 'not allowed to insert more records in this table '
insert into [dbo].[Department](Dept_Id) values(500)
/*Create a stored procedure that will check for the number of total employees in the project no.100  
if they are more than 3 print a message to the user “'The number of employees
in the project 100 is 3 or more ” if they are less display a message to the user
“'The following employees work for the project 100” 
in addition to the first name and last name of each one. [Company DB] */
create proc CheckNumber
as
declare @x int  = (select count(a.ESSn) from Works_for a where a.Pno=100) 
if(@x>3)
select'The number of employees in the project 100 is 3 or more'
else if (@x<=3)
select e.Fname+' '+e.Lname as Name
from Employee e
join Works_for w
on e.SSN=w.ESSn and w.Pno=100
CheckNumber
/*Create a stored procedure that will be used in case there is an old employee
has left the project and a new one becomes instead him. 
The procedure should take 3 parameters (old Emp. SSN, new Emp. SSN, and the project no.)
and it will be used to update the works_on table. */
alter proc EmployeeUpdate @oldssn int, @newssn int, @pnum int
as
if exists ( select 1 from Works_for where ESSn =@oldssn and Pno=@pnum)
update Works_for 
set ESSn =@newssn
where ESSn =@oldssn and Pno=@pnum

EmployeeUpdate 968574, 112233, 700
/*Create an Audit table with the following structure*/
create table HistoryData
(
ProjectNo int,
UserName nvarchar(200),
ModifiedDate date,
Hours_Old int,
Hours_New int
)
create trigger BudgetUpdate
on Works_for
after update
as
if update(hours)
begin
declare @oldhour int, @newhour int, @pno int
select @oldhour = hours from deleted
select @newhour = hours from inserted
select @pno = Pno from deleted
select * from deleted
select * from inserted
insert into HistoryData values(@pno, SUSER_NAME(), GETDATE(), @oldhour,@newhour )
end
update Works_for
set Hours = 5
where ESSn = 521634 and pno=400
select * from HistoryData
/*Create a trigger that prevents the insertion Process for the Employee table in March [Company DB]. */
create trigger NoInsertMarch
on Employee
for insert
as
if 
month(getdate()) = 3
rollback

/*Create a trigger that prevents users from altering any table in Company DB. */
create trigger NoAlter
on database
for alter_table
as 
select 'Altering tables is not allowed'
rollback
alter table Departments add name nvarchar(50)
/*Create a trigger on the student table after inserting to add a row in the Student Audit table 
(Server User Name, Date, Note) where the note will be “[username] Inserted
New row with Key=[Key Value] in table [table name]”.[use ITI DB] */
create table StudentHistory
(
UserName nvarchar(200),
insertdate date,
note nvarchar(200)
)

alter trigger Noinser
on Student
for insert
as
declare @id int, @note nvarchar(200)
select @id = St_Id from inserted
select @note= SUSER_NAME()+'  '+'Inserted New row with Key='+str(@id)+'  '+'in table Student'
insert into StudentHistory values (SUSER_NAME(), GETDATE(), @note)


insert into student(St_Id, St_Fname, St_Address) values (71, 'Abdelrahman', 'Monofia')
select * from StudentHistory


/*9*/
create trigger NoDeleting
on student
instead of delete
as
declare @id int, @note nvarchar(200)
select @id = St_Id from deleted
select @note= SUSER_NAME()+'  '+'tried to delete a row with Key='+str(@id)
insert into StudentHistory values (SUSER_NAME(), GETDATE(), @note)

delete from Student where St_Id=68 
select * from StudentHistory
--Bonus
