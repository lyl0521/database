use scott;
create table copy_emp
as
  select ename,EMPNO,DEPTNO
from emp;

select * from copy_emp;

drop table copy_emp;

create or replace view v_emp
as
  select ename ,EMPNO,DNAME
from emp join dept
where emp.DEPTNO=dept.DEPTNO;

select * from v_emp;

start transaction ;

delete from scott.emp
where ENAME = 'allen';

select * from emp;


commit ;
rollback ;

INSERT INTO `emp` VALUES (7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600.00,300.00,30)
