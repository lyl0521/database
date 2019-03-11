use scott;
select *
from emp;
# 1. 查找部门 30 中员工的详细信息
select * from  emp where DEPTNO=30;
# 2. 找出从事 clerk 工作的员工的编号、姓名、部门号
select EMPNO ,ENAME , DEPTNO from emp  where job = 'clerk';
# 3. 检索出奖金多于基本工资的员工信息
select  * from emp where COMM > SAL;
# 4. 检索出奖金多于基本工资 30% 员工信息
select * from emp where COMM >= ( SAL * 0.3 );
# 5. 希望看到 10 部门的经理或者 20 部门的职员 clerk 的信息
select * from emp where DEPTNO = 10 and job = 'manager' or deptno = 20 and job = 'clerk';
# 6. 找出 10 部门的经理、20 部门的职员或者既不是经理也不是职员但是高于 2000 元的员工信息
select * from emp where DEPTNO = 10 and job = 'manager' or
      DEPTNO = 20 and job<> 'manager' and sal>2000;
# 7. 找出获得奖金的员工的工作
select * from emp where COMM <>0;
# 8. 找出奖金少于 100 或者没有获得奖金的员工的信息
select * from emp where COMM<100 or comm is null;
# 9. 查找员工雇佣日期是当月的最后一天的员工信息
select *
from emp
where last_day(month(HIREDATE))=date_format(HIREDATE,'%d');
# 10. 检索出雇佣年限超过 35 年的员工信息
select date_format(now(),'%Y');
SELECT year(HIREDATE)  from emp;
select * from emp where (select date_format(now(),'%Y')-(SELECT year(HIREDATE)  ))>=35;
# 11. 找出姓名以 A、B、S 开始的员工信息
select * from emp where ename like 'A%' or ename like  'B%' or ename like  'S%';
# 12. 找到名字长度为 4 个字符的员工信息
select * from emp where length(ENAME) = 4;
# 13. 名字中不包含 R 字符的员工信息
select * from emp where ename not like '%r%';
# select * from emp where ename not rlike 'r';    两个均可
# 14. 找出员工名字的前3个字符
select substring(ENAME,1,3)
from emp;
# 15. 将名字中 A 改为 a
update emp set ename = replace(ENAME,'A','a');

# 16. 将员工的雇佣日期拖后 10 年
select * from scott.emp where date_add(HIREDATE, interval 10 year);
# 17. 返回员工的详细信息并按姓名排序
select *
from emp
order by ENAME;
# 18. 返回员工的信息并按员工的工作年限降序排列
select *
from emp
order by HIREDATE desc ;
# 19. 返回员工的信息并按工作降序、工资升序排列
select *
from emp
order by JOB desc ,sal ;
# 20. 返回员工的姓名、雇佣年份和月份，并按月份和雇佣日期排序
select ename ,date_format(HIREDATE,'%y-%m')
from emp
order by date_format(HIREDATE,'%m'),HIREDATE ;
# 21. 计算员工的日薪，每月按 30 天
select ENAME,sal/30
from emp ;
# 22. 找出 2 月份雇佣的员工
select ENAME,HIREDATE
from emp where date_format(HIREDATE,'%m')=2;
# 23. 至今为止，员工被雇佣的天数
select ename,datediff(now(),HIREDATE)
from emp;
# 24. 找出姓名中包含 A 的员工信息
select *
from emp where ENAME LIKE '%A%';
# 25. 计算出员工被雇佣了多少年、多少月、多少日
select ENAME,year(current_date)-year(HIREDATE) as '年份' ,HIREDATE as 入职日期,datediff(date(now()),HIREDATE) as '日数',timestampdiff(month ,HIREDATE,date(now())) as '月数'
from emp;

select ename,day(HIREDATE)=last_day(month(co))
from emp;

# 每个人工资和奖金的总和
select ename , sal +ifnull(COMM,0)
from emp;

select * from emp;

select date (now());






