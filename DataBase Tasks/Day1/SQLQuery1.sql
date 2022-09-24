use	[Company DB]	
--1
select* from EMPLOYEE
--2
select FNAME, LNAME, SALARY, DNO
from EMPLOYEE
--3
select PNAME,PLOCATION,DNUM
from PROJECT
--4
select FNAME+' '+LNAME as fullname ,(SALARY*12*.1) as Annualcomm
from EMPLOYEE
--5
select SSN, FNAME + ' '+LNAME as fullname 
from EMPLOYEE
where SALARY > 1000
--6
select SSN, FNAME + ' '+LNAME as fullname 
from EMPLOYEE
where(SALARY*12) > 10000
--7
Select FNAME , SALARY
from EMPLOYEE
where Sex = 'f'
--8
select DNUMBER ,DNAME 
from DEPARTMENT
where MGRSSN = 3
--9
select PNAME , PNUMBER, PLOCATION
from PROJECT
where DNUM=10