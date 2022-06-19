/*
1.	Display instructor Name and Department Name 
Note: display all the instructors if they are attached to a department or not
*/
select ins.Ins_Name, dep.Dept_Name
from Instructor ins left outer  join Department dep
on ins.Dept_Id = dep.Dept_Id
/*
2.	Display student full name and the name of the course he is taking
For only courses which have a grade  
*/
select s.St_Fname +' '+ s.St_Lname as FullName, c.Crs_Name
from Student s
join Stud_Course sc 
on s.St_Id = sc.St_Id
join Course c
on sc.Crs_Id = c.Crs_Id and sc.Grade is not null
/*
3.	Display number of courses for each topic name
*/
select t.Top_Name, COUNT(c.Crs_Id) as NUmberOfCourses
from Course c join Topic t
on c.Top_Id = t.Top_Id 
group by c.Top_Id, t.Top_Name
/*
4.	Display max and min salary for instructors
*/
select MAX(Salary) as MaxSalary, min(Salary) as MinSalary from Instructor
/*
5.	Display instructors who have salaries less than the average salary of all instructors.
*/
select Ins_Name from Instructor where Salary < (select Avg(Salary) from Instructor)
/*
6.	Display the Department name that contains the instructor who receives the minimum salary.
*/
select dep.Dept_Name
from Department dep
join Instructor i
on dep.Dept_Id = i.Dept_Id and i.Salary= (select min(Salary) from Instructor)
/*
7.	Select max two salaries in instructor table
*/
select distinct top 2 (Salary) from Instructor
order by Salary desc
select * from Course
select * from Department
select * from Instructor