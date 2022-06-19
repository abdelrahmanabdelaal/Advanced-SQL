/*1.Display all the data from the Employee table (HumanResources Schema) As an XML (Use: XML path).
(Advanture works DB)
*/
select *
from [HumanResources].[Employee] 
for xml path ('Employee')
/*2.Create an textQuestions table that contains: ID, Course , Grade(Untyped XML Column).[Bouns]*/
create table textQuestions(
ID int ,
Course nvarchar(50),
Grade xml)
/*a.Insert some records in the table.*/
insert into textQuestions values(1, 'Arabic', '0')
insert into textQuestions values(2, 'English', '80')
insert into textQuestions values(3, 'Math', '65')
/*b.What’re the differences between Typed and untyped XML columns?*/
--
/*c.Can you query from XML column based on a value of specific XML element or attribute? 
(Use XPath and XQuery) . */
--no
/*3.Create  login and user for iti DB on Student table allow user to
make select for St_id, St_Fname  prevent user from Update St_Lname.*/
--user1
/*4.make login and user for Company DB on Schema that Includes ( View , Stored , Function )*/
--user2
/*5.Return the result of this XML data as table (XML shredding):*/
--iti
declare @docs xml ='<book genre="VB" publicationdate="2010">
   <title>Writing VB Code</title>
   <author>
      <firstname>ITI</firstname>
      <lastname>ITI</lastname>
   </author>
   <price>44.99</price>
</book>'
declare @hdocs int
Exec sp_xml_preparedocument @hdocs output, @docs
select * into DataXml
FROM OPENXML (@hdocs, '//book')  
WITH ([book genre] varchar(10) '@genre',
publicationdate date '@publicationdate',
	  Title varchar(50) 'title', 
	  AuthorFirstName varchar(10) 'author/firstname',
	  AuthorLastName varchar(10) 'author/lastname',
	  Price decimal 'price'
	  )
Exec sp_xml_removedocument @hdocs
select * from DataXml
/*6.Create a job that make all available  types of backup Daily */

BACKUP DATABASE ITI
TO DISK = 'D:\ITI\Advanced Sql\Day8\ITI.bak'