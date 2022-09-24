----------------------1
use ITI
create proc sumvalue
as 
  select sum(s.ST_ID),D.Dept_Name 
  FROM Student S ,Department D
  WHERE D.Dept_Id =S.Dept_Id
  GROUP BY D.Dept_Name

  execute sumvalue
  ---------------------2
use Company_SD

create proc checking
as 
declare @y int
set @y =(select COUNT(ESSn) from Works_for where Pno=100)
	if @y > 3
	select 'The number of employees in the project p1 is 3 or more'
	else 
	select 'The following employees work for the project p1' 
union 
	select concat(fname,' ',lname) as fullname from Employee ,Works_for 
	where ssn=ESSn and pno=100 

 execute checking
 --------------------3
 create  procedure emp_swap @old_num int ,@new_num int ,@pnum int 
as 
begin try
	update Works_for
		set ESSn=@new_num , pno=@pnum 
	where @old_num=essn and @pnum=pno  
end try
begin catch
	select'error!!'
end catch

execute emp_swap 669955,112233,300
--------------------------------------4
ALTER TABLE Project
ADD budget int ;
create table Audit
(
ProjectNo varchar(20) ,
UserName varchar(25),
ModifiedDate date,
Budget_Old  int ,
Budget_New int 
)
create trigger x1
on Project
for update 
as 
if update (budget)
begin
declare @budg_old int ,@budg_new int ,@pnum int
select @budg_old= budget from deleted
select @budg_new=budget  from inserted
select @pnum=Pnumber       from deleted

insert into Audit 
values (@pnum,SUSER_NAME(),GETDATE(),@budg_old,@budg_new)
end

update Project
set budget =5000
where budget=10000

------------------------------------5
use ITI
create trigger x2
on department
instead of insert 
as
select'can’t insert a new record table'

insert into Department (Dept_Id,Dept_Name)
values(71,'kotln')

-----------------------------------------6
create trigger x3
on employee
instead of insert
as
if format (getdate(),'MMMM')='March'
begin
select 'you are not allow to insert on march'
delete from employee 
where ssn =(select ssn from inserted)
end 
insert into Employee(SSN,Fname,Lname,Bdate)
values(500,'Alex','vic','1973-03-18')
-----------------------------------------7
use iti
create table Student_Audit
(
Server_User_Name varchar(30) , 
Date date, 
Note varchar(100)
)
create trigger x4
on student 
after insert
as 
declare @id int
set @id = (select St_id from inserted)
insert into Student_Audit 
values (SUSER_NAME(),GETDATE(),CONCAT(SUSER_NAME(),'insert new row with key ',@id
,'in the student table '))

insert into Student(St_Id,St_Fname,St_Lname,St_Age)
values(200,'samul','shing',25)
-----------------------------------------8
create trigger x5
on student 
instead of delete
as 
declare @id int
set @id  = (select St_id from deleted)
insert into Student_Audit 
values (SUSER_NAME(),GETDATE(),CONCAT(SUSER_NAME(),'try to delete row with key ',@id ))

delete from dbo.Student where St_Id = 10