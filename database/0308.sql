use scott;

show tables from scott;


select *
from emp
       inner join dept
                  on emp.DEPTNO = dept.DEPTNO;

select ENAME,dept.DEPTNO
from emp left outer join dept
                         on emp.DEPTNO = dept.DEPTNO
union -- union all 会出现重复数据    union自动去重  相当于全外连接
select ENAME,dept.DEPTNO
from emp right outer join dept
                          on emp.DEPTNO = dept.DEPTNO;