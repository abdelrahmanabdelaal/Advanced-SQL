/*1.use ITI. find the count of times that Ahmed appears  after Khalid in the st_Fname column*/
declare c1 cursor
for 
   select St_Fname
   from Student

for read only

declare @name varchar(100), @counter int =0

open c1
fetch c1 into @name 

while @@FETCH_STATUS = 0
  begin 
    if(@name = 'ahmed')
	begin
	  fetch c1 into @name 
      if(@name = 'khalid')
	      set @counter+=1
	end
fetch c1 into @name 
  end
 select @counter
close c1
deallocate c1
/*2.Try to display all students' first names in one cell separated by a comma. Using Cursor */
declare c2 cursor
for 
    select St_Fname  
   from Student
   where St_Fname is not null

   for read only

declare @name varchar(20) , @AllNames varchar(500) = ''

open c2
fetch c2 into @name 

while @@FETCH_STATUS = 0
  begin 
     set @AllNames = @AllNames +' , ' + @name  
	 fetch c2 into @name 
  end
  select @AllNames
close c2
deallocate c2
/*3*/
declare c3 cursor
for 
    select Salary
	from Employee

for update

declare @sal int

open c3
fetch c3 into @sal 

while @@FETCH_STATUS = 0
  begin 
    if(@sal >3000)
	  update Employee Set Salary=Salary*1.2
	  where current of c3 

    else 
	   update Employee Set Salary=Salary*1.1
	    where current of c3 
    fetch c3 into @sal 
  end

 
close c1
deallocate c1
/*4.Create a SQL CLR function that takes a character and returns the number of  
occurrences in the students' first name in ITI DB*/
declare @name nvarchar(max)
select @name =  st_fname from Student where St_Id=5

select

dbo.char_count('a',@name)
/*5.Create a SQL CLR function that takes a department manager‘s hire date with a 
specific id and returns neither was it leap year or not.use company DB*/ 
 declare @date nvarchar(100)
 select @date =  year([MGRStart Date]) from Departments where Dnum = 20
select
dbo.Leap_Function(@date) as leapornot
select
dbo.Leap_Function(2020)