use ITI
--------------------1
create view detail
as
  select St_Fname+' '+St_Lname as fullname,Crs_Name
  from student s inner join Stud_Course c
  on s.St_Id=c.St_Id
  inner join Course o
  on o.Crs_Id=c.Crs_Id
  where Grade>50
select*
from detail
------------------2
create view managr
with encryption
as
select ins_name , top_name
from department d inner join Instructor i on i.Ins_Id=d.Dept_Manager
inner join Ins_Course n on i.Ins_Id=n.ins_Id
inner join Course c on c.Crs_Id=n.Crs_Id
inner join Topic t on t.Top_Id=c.Top_Id
select* from managr

sp_helptext'department'
-------------3
create view dd
as
  select  ins_name , dept_name
  from Instructor s inner join Department c
  on c.Dept_Id=s.Dept_Id
  where Dept_Name in( 'SD' , 'Java' )
select*
from dd
---------------4
create view v1
as
  select*
  from Student
  where St_Address in('Alex' , 'Cairo')
with check option 
select* from v1
update v1
set St_Address='tanta'
where St_Address='cairo'
----------------5
use [Company DB]
create view pn
as
select pname,count(essn) as counter
from project inner join works_on
on PNUMBER=PNO
group by PNAME 
select*
from pn
----------------6
use [Company DB]
--a
create schema company
alter schema company transfer dbo.DEPARTMENT
-----phesically project 
--b
create schema  HumanResource
alter schema  HumanResource transfer dbo.EMPLOYEE
-------------7
create clustered index hiredate
on department(manager_hiredate)
---------------8
create unique index x
on student(st_age)
---------------9

----------------10
select st_id ,substring(st_fname,1,len(st_fname)-1)as name
from dbo.student
----------------11
update stud_course
set grade = Null
from stud_course i inner join Student s
on s.st_id =i.st_id and dept_id=10
----------------12
create table daily_transaction
( UserID int ,
TransactionAmount int
)
create table last_transaction
( lUserID int ,
lTransactionAmount int
)
merge into last_transaction 
using daily_transaction
on luserid=userid
when matched then
update 
set lTransactionamount=Transactionamount
when not matched then 
insert values(userid,Transactionamount);
------------------13
create schema itiDB
alter schema itiDB transfer Student
alter schema itiDB transfer course