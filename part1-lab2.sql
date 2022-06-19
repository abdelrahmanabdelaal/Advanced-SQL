/*
Create a view that displays the student's full name, and course name if the student has a grade of more than 50.
*/
create view student_info
as 
select s.St_Fname+' '+s.St_Lname as full_name, c.Crs_Name
from Student s
join Stud_Course sc
on s.St_Id=sc.St_Id
join Course c
on c.Crs_Id=sc.Crs_Id and sc.Grade>50
/*
Create an Encrypted view that displays manager names and the topics they teach.
*/
create view instructor_info
with Encryption
as 
select i.Ins_Name, c.Crs_Name, tp.Top_Name 
from Instructor i
join Ins_Course ic
on i.Ins_Id = ic.Ins_Id  
join Course c
on c.Crs_Id = ic.Crs_Id
join Topic tp
on tp.Top_Id = c.Top_Id
sp_helptext 'instructor_info'
/*
Create a view “V1” that displays student data for a student who lives in Alex or Cairo.
Note: Prevent the users from running the following query 
Update V1 set st_address=’tanta’ Where st_address=’alex’.
*/
select * from Student
select * from Instructor
create view v1
as
select *
from Student
where St_Address = 'cairo' or St_Address = 'alex'
with check option

update v1
set st_address='tanta' Where st_address='alex'
select * from v1
insert into v1 values(16,'maher', 'mazen', 'tanta', 25, 10, 1)