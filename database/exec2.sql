use scott;

show tables from scott;

select * from dept;

select *
from salgrade;

select * from emp;

# 1. 返回拥有员工的部门名、部门号
select distinct dept.DNAME,dept.DEPTNO
from emp inner join dept
on dept.DEPTNO=EMp.DEPTNO;
# 2. 工资多于 scott 的员工信息
select * from emp where SAL > (select sal from emp where ENAME = 'scott');
# 3. 返回员工和所属经理的姓名?
select a.ENAME,b.ENAME
from scott.emp a join emp b
on a.DEPTNO = b.DEPTNO
and b.JOB = 'manager';

# 4. 返回雇员的雇佣日期早于其经理雇佣日期的员工及其经理姓名
select a.ENAME,b.ENAME
from scott.emp a join emp b
on a.DEPTNO = b.DEPTNO
and b.JOB = 'manager'
and a.HIREDATE<b.HIREDATE ;

# 5. 返回员工姓名及其所在的部门名称
select ENAME,DNAME from emp join dept
on emp.DEPTNO = dept.DEPTNO;

# 6. 返回从事 clerk 工作的员工姓名和所在部门名称
select ENAME,DNAME from emp join dept
on emp.JOB = 'clerk'
and emp.DEPTNO = dept.DEPTNO;
# 7. 返回部门号及其本部门的最低工资
select emp.DEPTNO, min(SAL) from emp
join dept on emp.DEPTNO = dept.DEPTNO;
# 8. 返回销售部 sales 所有员工的姓名
select ename from emp join dept
where emp.DEPTNO = dept.DEPTNO
and dname = 'sales';
# 9. 返回工资多于平均工资的员工
select ename from emp where sal>(select avg(SAL) from emp);
# 10. 返回与 scott 从事相同工作的员工
select ename from emp where JOB = (select job from emp where ename = 'scott');
# 11. 返回比 30 部门员工平均工资高的员工姓名与工资
select ename,sal from emp where sal > (select avg(sal) from emp where deptno =30);
# 12. 返回工资高于30部门所有员工工资的员工信息
select * from emp where sal > (select avg(sal) from emp where deptno =30);
# 13. 返回部门号、部门名、部门所在位置及其每个部门的员工总数
select dept.DEPTNO,DNAME,LOC,count(*) from emp join dept
where emp.DEPTNO=dept.DEPTNO
group by DNAME;
# 14. 返回员工的姓名、所在部门名及其工资
select ename,dname,sal from emp join dept where emp.DEPTNO=dept.DEPTNO;
# 15. 返回雇员表中不在同一部门但是从事相同工作的员工信息
select e1.ENAME,e1.deptno,e1.JOB,e2.ENAME,e2.deptno ,e2.JOB from emp e1 ,emp e2
where e1.JOB = e2.JOB and e1.DEPTNO <> e2.DEPTNO;
# 16. 返回员工的详细信息，包括部门名
select e.* ,DNAME from emp e join dept where e.DEPTNO = dept.DEPTNO ;
# 17. 返回员工工作及其从事此工作的最低工资
select job,min(sal) from emp group by JOB;
# 18. 返回不同部门经理的最低工资
select deptno,min(sal) from emp where JOB = 'manager' group by DEPTNO;
# 19. 计算出员工的年薪，并且以年薪排序
select ename,sal*12 from emp order by sal desc;
# 20. 返回工资处于第 4 级别的员工的姓名
select ename ,grade  from emp ,salgrade where sal between LOSAL and HISAL and grade = 4;

select * from emp;

