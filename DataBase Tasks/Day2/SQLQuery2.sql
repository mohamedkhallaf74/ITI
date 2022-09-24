use Company_SD
--1 
select Dnum,Dname,MGRSSN,Fname+Lname as managername
from Departments , Employee
where SSN=MGRSSN

--2
select Dname,Pname
from Departments D,Project P
where D.Dnum=P.Dnum

--3
select Fname+Lname as managername ,d.*
from Employee  , Dependent d
where SSN = ESSN

--4
select Pnumber, pname , plocation 
from Project
where City in ('Alex','Cairo')

--5
select * 
from Project 
where pname like 'a%'
--6
select * 
from employee
where Dno = 30 and Salary between 1000 and 2000

--7
select Fname+' '+Lname as fullname 
from Employee inner join works_for 
on SSN = ESSN
inner join Project 
on pnumber = Pno and pname = 'AL Rabwah' and hours >= 10 and Dno =10
--8
select e.fname +' ' + e.lname as employeename
from Employee s  inner join Employee e
on s.ssn = e.superssn and s.Fname = 'Kamel' and s.Lname ='Mohamed'
--9
select fname + ' ' + lname as employeename , pname
from Employee e inner join works_for w
on ssn = essn
inner join Project p
on pnumber = pno
order by pname
--10
select pnumber,dname, fname , Address, bdate
from Project p inner join Departments d
on d.Dnum = p.Dnum
inner join Employee 
on ssn = mgrssn and city = 'Cairo'
--11
select *
from Employee inner join Departments 
on ssn = mgrssn
--12
select *
from Employee e left outer join Dependent
on ssn=essn
--13
insert into Employee 
(ssn,superssn,salary,Dno)
values
(102672,112233,3000,30)
--14
insert into Employee
(Fname,Lname,SSN,Bdate,Address,Sex,Dno)
values
('mohamed','khallaf',102660,12/9/2000,'menofia','m',30)
--15
Update Employee
	set Salary = (Salary+.2*Salary)
where SSN=102672