create table Instructor(
id int primary key,
salary int default 1000,
overtime int unique ,
BD date,
Fname varchar(50),
Lname varchar(50),
address varchar(50),
hiredate date default getdate(),
age as year(getdate())-year(BD),
Netsalary as salary+overtime,
constraint c1 check(address in ('cairo','alex')),
constraint c2 check(salary in (1000,5000)),
);
create table course(
cid int primary key,
duration varchar(50) unique,
cname varchar(50)
constraint c4 unique(duration),
);
create table lab(
 id int ,
 cid int,
 capacity int ,
 lacation varchar(50),
 constraint c5 primary Key(id,cid) ,
 constraint c6 check(capacity<20)  ,
 constraint c7 foreign key(cid) references course(cid)
on delete cascade on update cascade,
 );
create table tech(
id int,
cid int,
constraint c8 primary key(id,cid),
constraint c9 foreign key(id) references instructor(id)
on delete cascade on update cascade ,
constraint c10 foreign key(cid) references course(cid)
on delete cascade  on update cascade,
 );

