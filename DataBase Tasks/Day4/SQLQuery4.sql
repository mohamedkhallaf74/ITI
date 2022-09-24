use Company_SD
--1
select D.Dependent_name , D.Sex
from Dependent D inner join Employee E
on SSN=ESSN and E.Sex='F' and D.Sex='F'
union
select D.Dependent_name , D.Sex
from Dependent D inner join Employee E
on SSN=ESSN and E.Sex='M' and D.Sex='M'
--2 
select Pname ,sum(Hours)
from Works_for w inner join Project p
    on p.Pnumber=w.Pno
 group by Pname

 --3
 select * from Departments d
 inner join Employee e
on d.Dnum=e.Dno and e.SSN=(select min(e.SSN) from Employee e ,Departments d
where d.Dnum=e.Dno)
  
 --4
 select Dname,max(salary)as maxi,min(salary)as mini,avg(salary) as average
 from Employee inner join Departments
 on SSN=MGRSSN
 group by Dname
 --5
select Fname +' '+Lname as FN
from Employee  , Departments 
Where SSN=MGRSSN and MGRSSN not in (select(ESSN)  from Dependent )
 ----6
 Select Dnum,Dname,count(SSN)
 from Employee inner join Departments
 on Dno=Dnum
 group by Dnum,Dname
 having avg(salary)<(select avg(salary)from Employee)
 --7
 select fname+' '+lname as FN ,pname
 from Employee inner join Works_for
 on SSN=ESSN
 INNER join Project p
 on Pnumber=Pno
 order by   Dnum,lname, fname
 ----------
 select fname+' '+lname as FN ,pname
 from Employee ,Works_for,Project
where SSN=ESSn and Pnumber=Pno
 order by Dnum, lname ,fname 
 ----------
 --8
 select top(2)salary 
 from Employee
 order by Salary desc
 ------------------------------
 select
  (SELECT MAX(Salary) FROM Employee) as firstmaxsalary,
  (SELECT MAX(Salary) FROM Employee
  WHERE Salary NOT IN (SELECT MAX(Salary) FROM Employee )) as secmaxsalary
 --9
select Fname+' '+ Lname 
 from Employee
 intersect
 select Dependent_name
 from Dependent
 --10
 select SSN,fname+' '+lname as fullN
 from Employee 
 where Exists (select Dependent_name from Dependent where SSN=ESSN)
 --11
 insert into Departments 
(Dname,Dnum,MGRSSN,[MGRStart Date])
values
('DEPT IT',100,112233,1-11-2006)
 --12
 update Departments
  set MGRSSN=968574
  where Dname=100

update Departments
  set MGRSSN=102672
  where Dname=20

update Employee
   set Superssn=102672
   where SSN=102660


 --13

 begin try
 begin transaction

 delete Dependent
 where ESSN=223344

 delete Employee
 where Superssn=223344

 delete Works_for
 where ESSn=223344

 update Departments
 set MGRSSN=102672

 UPDATE Employee
 SET Superssn=102672

 delete Employee
 where ssn=223344
 commit
 end try
 begin catch
 --14
 update Employee
 set Salary=0.3*Salary+Salary
 from Employee inner join Works_for
 on SSN=ESSN
 inner join Project
 on Pnumber=Pno
 where Pname='Al Rabwah'
