/*1*/
select Dname, Dnum, MGRSSN from Departments
/*2*/
select dep.dname, pr.pname
from Departments dep
join Project pr
on dep.Dnum = pr.Dnum
/*3*/
select fname, lname from Employee
where dno=30 and salary between 1000 and  2000
/*4*/
select fname+' '+lname [full name]
from Employee em , Works_for wo, Project pr
where em.Dno=10 and pr.Pnumber=200 and wo.Hours>=10 and wo.Pno=pr.Pnumber and em.SSN=wo.ESSn
/*5*/
select fname, lname from Employee
where Superssn = 223344
/*6*/
select em.fname, em.lname, pr.pname
from Employee em
join Project pr
on em.dno = pr.dnum
order by pr.Pname

/*8*/
select a.*
from Employee a
join Employee b
on a.SSN = b.Superssn
/*9*/
select em.*, de.*
from Employee em
full outer join Dependent de
on em.SSN = de.essn
select * from Employee

/* disply the Sql server version*/
select @@VERSION
/* disply the name of the server*/
select @@SERVERNAME
