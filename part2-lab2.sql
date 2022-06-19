/*1.Fill the Create a view “v_Emp_Projec” that will display 
the project name and the number of employees working on it
*/
create view v_Emp_Projec
as
select pr.Pname, count(em.SSN) as num_employee
from Project pr
join Departments de
on de.Dnum = pr.Dnum
join Employee em
on de.Dnum = em.Dno
group by pr.Pname
/*
2.	Create a view named  “v_count “ that will display the project name and 
the number of hours for each one*/
create view v_count
as
select pr.Pname, sum (w.Hours) as working_hours 
from Project pr
join Works_for w
on pr.Pnumber = w.Pno
group by  pr.Pname
/*
3.	Create a view named ” v_project_30H” that will display the project name
for the project that'll last 
for less than 30 hours, use the previously created view “v_count”*/
create view v_project_30H
as 
select Pname
from v_count
where working_hours<30
/*4.Delete the views  “v_project_30H” and “v_count”*/
drop view v_project_30H
drop view v_count
/*
5.	Display the project name that contains the letter “c” Use 
the previous view created in “v_Emp_Project”*/
select Pname
from v_Emp_Projec
where Pname like '%c%'
/*6.	Add a new column Enter_Date in Works_for and insert it with some dates 
then create view name “v_2021_check” that will display employee no., 
which must be from the first of January and the last of December 2021.
Note: this view will be used to insert data so make sure
that the coming new data matches the condition
*/
ALTER TABLE [dbo].[Works_for]
ADD Enter_Date datetime;
UPDATE Works_for
SET Enter_Date = '7/7/2021'
CREATE VIEW v_2021_check 
AS (
SELECT ESSN, W.Enter_Date 
FROM Employee AS E INNER JOIN Works_for AS W 
ON E. SSN = W. ESSn
WHERE W.Enter_Date BETWEEN '1/1/2021' AND '12/31/2021' ) with Check option  
select * from v_2021_check

INSERT INTO v_2021_check (ESSn, W.Enter_Date) VALUES(1,'10/2/2022')
select * from Works_for
/*7.	Create a temporary table [Session-based] to save the employee's name and birth date.*/
create table #test (
name varchar(20),
b_date datetime	
)
insert into #test values('abdelrahman', '1/25/2002')
drop table #test
