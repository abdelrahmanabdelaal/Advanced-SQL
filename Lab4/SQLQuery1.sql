/*1.Create a function that takes the project number and displays all employees in this project.*/
create function emp_info (@p_num int)
returns table
as
return
(
select *
from Employee e
join Works_for w
on e.SSN =w.ESSn
join Project p
on p.Pnumber = w.Pno and p.Pnumber = @p_num
)
select * from emp_info(100)



/*2.Create a scalar function that takes a date and returns the month name of that date.
ex: giving the function '2009/5/12' as a parameter will return 'May'
*/
create function GetMomth(@da date)
returns nvarchar(50)
	begin 
	declare @mo nvarchar(50)
		select @mo =DATENAME(month,@da)
		return @mo
	end
select dbo.GetMomth('2006/12/25')
/*3.Create a multi-statements table-valued function that takes 2 integers 
and returns the values between them.*/
create function GetNumber(@num int, @num2 int)
returns @t table (a int)as
begin
	
	while ( @num < @num2)
	
	begin
		set @num+= 1 
		
		if (@num=@num2)
		break

		insert into @t values (@num)

	 end

	return
end

 select * from Getnumber(1,7)

/*4.Create a tabled valued function that takes Student No. 
and returns Department Name with Student full name.*/
create function student_inf(@id int)
returns table
as
return
(
select d.Dept_Name, s.St_Fname+' '+s.St_Lname as full_name
from Department d
join Student s
on d.Dept_Id = s.Dept_Id
where s.St_Id = @id
)
select *from student_inf(6)
/*5.	Create a scalar function that takes Student ID and returns a message to the user 
a.	If the first name and Last name are null then display 'First name & last name are null'
b.	If the first name is null then display 'first name is null'
c.	If the last name is null then display 'last name is null'
d.	Else display 'First name & last name are not null'
*/
alter function CheckName(@id int)
returns nvarchar(100)
begin
declare @x nvarchar(50), @y nvarchar(50), @res nvarchar(50)
select @x = St_Fname, @y = St_Lname  from Student where St_Id = @id
	if(@x is null and @y is null)
		set @res ='First name & last name are null'
	else if (@x is null)
           set @res= 'first name is null'
	else if (@y is null)
           set @res ='last name is null'
	else
			set @res='First name & last name are not null'
	return @res
end
select dbo.CheckName(13)
/*6.Create a function that takes an integer that represents the format of 
the Manager's hiring date and displays the department name, Manager Name, and hiring date 
with this format.  ex: giving the function 100 as a parameter will return the date
like ‘Jan 1 2000’ or any other type of format.*/
create function ManagerData(@formate int)
returns table 
as  
return
(
select d.Dept_Name, i.Ins_Name, convert (varchar(20) , d.Manager_hiredate ,@formate ) as HireDate
from Instructor i
join Department d
on i.Ins_Id = d.Dept_Manager
)
select * from ManagerData(100)
/*7.	Create multi-statements table-valued function that takes a string as a parameter
a.	If string='first name' returns the student's first name 
b.	If string='last name' returns the student's last name 
c.	If string='full name' returns Full Name from student table 
Note: try  “ISNULL” function
*/
create function GetStudentName(@format varchar(50))
returns @t table (ename varchar(50))
as
 begin 
      if @format ='first name'
	  insert into @t
	  select isnull(St_Fname,'Empty') from Student 

	  else if @format ='last name'
	  insert into @t
	  select isnull(St_Lname,'Empty') from Student 

	  else if @format ='full name'
	  insert into @t
	  select  isnull(St_Fname, 'Empty')+' '+isnull(St_Lname, 'Empty') as FullName from Student 

	  return 

 end

 select * from GetStudentName('first name')
 --8.Write a query that returns the Student No and Student first name without the last char
 select St_Id, substring(St_Fname, 1, len(St_Fname)-1) from Student
 /*9.Write a query that takes the columns list and table name into variables 
 and then returns the result of this query “Use execute function”*/
declare @col nvarchar(20) ='St_Fname' , @tab nvarchar(20)='Student'
execute('select '+@col+' from '+ @tab)



