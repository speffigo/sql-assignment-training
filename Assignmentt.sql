

insert into employee(empno,empname,job,mgr,hiredate,salary,comm,deptno) values(435,'Blake','Analyst',889,'03-Dec-89',4500,0,40)
update  employee set salary=3500 where empno=325

create table Department(Deptno numeric,dname varchar(20),Loc varchar(20))
insert into Department(deptno,dname,loc) values(50,'Purchase','Los Angeles')

--simple queries for DQL command
select * from employee 
Select * from department
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
select sum(salary) as total from employee s
select deptno , avg(salary),max(salary),min(salary) from employee group by deptno   
select deptno , avg(salary),max(salary),min(salary) from employee group by deptno having count(empname)>2 

--current date
select current_date   
--name and salry
select empname,salary as Aannual-salary from employee 

--queries using clauses
select job,count(empno) from employee group by job
select job,sum(salary) from employee group by job having sum(salary)>5000
select empno,empname,deptno,salary from employee order by empname,deptno,salary
select empname,salary from employee order by salary desc

--subqueries
select empname from employee where salary=(select max(salary) from employee)
select empname from employee where salary >(select avg(salary) from employee)
select empname from employee where salary>(select salary from employee where deptno=30)
select empname from employee where salary>(select e.salary from employee e,department d  where dname='Sales' and e.deptno=d.deptno)
select empname from employee where mgr in (select empno from employee where empname='James')
select empname from employee where mgr in (select empno from employee where empname='James')and salary>=(select avg(salary) from employee)

--queries using join 
select e.empno,e.empname,d.deptno,d.dname from employee e ,department d where e.deptno=d.deptno
select e.empname as employee , ee.empname as manager from employee e,employee ee where e.mgr=ee.empno
select e.empname from employee e,employee ee where e.empno=ee.mgr and e.deptno=ee.deptno
select e.empno,e.empname,e.job ,e.mgr ,e.hiredate ,e.salary ,e.comm ,d.deptno ,d.dname ,d.loc from employee e left join department d on e.deptno =d.deptno
select e.empno,e.empname,e.job ,e.mgr ,e.hiredate ,e.salary ,e.comm ,d.deptno ,d.dname ,d.loc from employee e right join department d on e.deptno =d.deptno
select e.empno,e.empname,e.job ,e.mgr ,e.hiredate ,e.salary ,e.comm ,d.deptno ,d.dname ,d.loc from employee e full outer join department d on e.deptno =d.deptno

--queires on integrity constraints 
create table Cust_dtls (cust_no int unique not null,cust_name varchar(50) check (upper(cust_name)= cust_name),cust_city varchar(20) check (cust_city like 'H%'))
select * from cust_dtls 
alter table employee add primary key(empno)
alter table employee alter column empname set not null
alter table employee alter column comm set default 0
alter table employee add foreign key (deptno) references department (deptno)
alter table employee add foreign key (mgr) references Employee (empno)
--
alter table department add constraint uniqloc unique(Loc)
alter table department drop constraint uniqloc
alter table cust_dtls drop constraint cust_name

--queries DDL command
alter table department add Budget BIGINT
alter table department alter column budget set default 5000
drop table employee;

--queries DML command
alter table department rename to dept_details
delete from dept_details where loc like 'NewYork'
delete from employee where salary <(select avg(salary)from employee )
update dept_details set dname='Distribution' ,deptno =70 where dname like 'Sales'

