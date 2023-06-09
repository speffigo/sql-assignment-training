

insert into employee(empno,empname,job,mgr,hiredate,salary,comm,deptno) values(435,'Blake','Analyst',889,'03-Dec-89',4500,0,40)
update  employee set salary=3500 where empno=325

create table Department(Deptno numeric,dname varchar(20),Loc varchar(20))
insert into Department(deptno,dname,loc) values(50,'Purchase','Los Angeles')

--simple queries for DQL command
select * from employee 
Select * from Department
select empno,empname,job from employee 
select deptno,dname from Department 
select distinct (job) from employee 

--Queries for DQL command using operators
select empname from employee where job='Analyst' and salary>2000
select empname from employee where comm is null
select empname from employee where job in('Clerk','Aanalyst','Manager') and salary >3000
select empname from employee where deptno in(10,20,40) and job in('Clerk','Analyst')
select e.empname,d.deptno ,d.dname from employee e ,department d where e.deptno=d.deptno and dname='Research' 
select empname from employee where empname like 'B%e'

--queries on Emp table 
select job from employee where deptno =10 
intersect 
select job from employee where deptno =20
select job from employee where deptno =10
select empname from employee where (1.2*salary)>3000
select * from employee where job not in ('Manager')

--queries using aggregate function 
select count(*) as total_row from employee 
select count(e.empno) as no_of_employee from employee e,department d where e.deptno =d.deptno and dname='Accounting' 
select sum(salary) as total from employee 
select deptno , avg(salary),max(salary),min(salary) from employee group by deptno   
--select * from employee where 

--current date
select current_date   
--name and salry
select empname,salary as Aannual-salary from employee 

--queries using clauses
select job,count(empno) from employee group by job
select job,sum(salary) from employee group by job having sum(salary)>5000
--
select empname,salary from employee order by salary desc

--subqueries
select empname from employee where salary=(select max(salary) from employee)
