# noinspection SqlWithoutWhereForFile

select *
from db_school.student;



delete
from db_school.student;

show full columns from db_school.student;

show full tables from db_school;

show variables like 'c%';

select *
from scott.emp;


select EMPNO,
       HIREDATE -- 投影
from scott.emp;

select distinct JOB
from scott.emp;

select *
from scott.emp
     # where SAL > 2000;
     # where SAL <> 3000;
     # where SAL <> 3000 and JOB <> 'salesman';
where SAL <> 3000
   or JOB <> 'salesman';

-- ci: case insensitive
select *
from scott.emp
where ENAME = binary 'Scott';

select JOB, ENAME, HIREDATE
from scott.emp
     # order by ENAME asc; -- ascend default
     # order by ENAME desc; -- descend
     # order by ENAME;
     # order by HIREDATE; -- 工龄长的在前？后？
order by JOb, ENAME desc;


select comm
from scott.emp
order by COMM;


select *
from scott.emp
limit 3 offset 0;
-- offset 偏移量
# limit 0, 3;

select ENAME
from scott.emp
     # where ENAME like '_COTT';
where ENAME like '%\_%' escape '\\';

update scott.emp
set ENAME = 'sco_tt'
where ENAME = 'scott';

select *
from scott.emp;

select *
from scott.emp
     # where JOB = 'salesman' or JOB = 'manager' or JOB = 'president';
where job in ('salesman', 'manager', 'president');

select *
from scott.emp
     # where SAL >= 2000 and sal <=3000; -- [2000, 3000]
where SAL between 2000 and 3000;


select e.ename as '员工 姓名'
from scott.emp as e;

select *
from scott.emp
where comm is not null;

update scott.emp
set comm = null
where EMPNO = '7499';-- DML

select ENAME, sal + ifnull(comm, 0)
from scott.emp;

select *
from scott.emp;

select *
from scott.dept;

select e.ENAME, e.DEPTNO, d.DNAME, d.DEPTNO
from scott.emp e
            join scott.dept d
                 on e.DEPTNO = d.DEPTNO;
-- 52 = 13 * 4

select e.ENAME, d.DNAME
from scott.emp e
            left join scott.dept d
                      on e.DEPTNO = d.DEPTNO;

select e.ENAME, d.DNAME
from scott.dept d
            right join scott.emp e
                       on e.DEPTNO = d.DEPTNO -- KING

union -- all

select e.ENAME, d.DNAME
from scott.emp e
            right join scott.dept d
                       on e.DEPTNO = d.DEPTNO; -- OPERATIONS

select e.ENAME, e.DEPTNO, d.DNAME, d.DEPTNO
from scott.emp e
            join scott.dept d
       #                  on e.DEPTNO = d.DEPTNO;
                 using (deptno);