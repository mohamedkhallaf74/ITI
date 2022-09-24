use ITI
-------1
select count(St_Age) as num_of_st_with_age
from Student
--OR
Select count(St_Age)
from Student
where St_Age is not null
 
------------2
select DISTINCT Ins_Name
from Instructor
----OR
Select Ins_Name
From (select *,Row_number() over(order by ins_id ) as RN
	  from Instructor) as Newtable
--------------3
select  st_id as StudentId , isnull(St_Fname+' '+St_Lname,'notentered') as Studentfullname,isnull(Dept_name,0)
from Student s inner join Department k
on k.Dept_Id=s.Dept_Id  
--------------4
select Ins_Name,dept_name 
from Instructor i inner join Department d
on d.Dept_Id=i.Dept_Id 
Where i.Dept_Id is null or i.Dept_Id is not null
---------------5
select concat( St_Fname,' ',St_Lname),crs_name
from student s inner join Stud_Course c
on s.St_Id=c.St_Id
inner join Course o
on o.Crs_Id=c.Crs_Id
where Grade is not null
---------------6
select count(crs_id),top_name
from Course c inner join Topic t
on t.Top_Id=c.Top_Id
group by top_name
---------------7
select max(Salary) as maxs,min(Salary)as mini
from Instructor
---------------8
Select avg(salary) ,Ins_Name
 from Instructor 
 group by Ins_Name
having avg(salary)<(select avg(salary)from Instructor)
--------------9
select Dept_Name ,salary
from Department d inner join Instructor i
on d.Dept_Id=i.Dept_Id
where salary = (select min(salary) from Instructor)
-------------10
select top(2)salary 
 from Instructor
 order by Salary desc
-------------11
ALTER TABLE Instructor
ALTER COLUMN Salary varchar;
SELECT 
coalesce(salary ,'bonus '),Ins_Name
from Instructor 
---------------
SELECT 
coalesce(convert(varchar(20),salary) ,'bonus '),Ins_Name
from Instructor 
-------------12
select avg(salary)as avgsal
from Instructor
-------------13
select e.*
from Student e inner join Student a
on e.St_Id=a.St_super

-------------14
select* from(select salary , Dense_Rank() over (partition by dept_id order by salary desc)as rk
from Instructor)as t1
where rk<=2
-------------15
select* from(select * , Row_number() over (partition by dept_id order by newid() )as rk
from Student)as t2
where rk=1