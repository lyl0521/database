create database school;

use school;

drop database school
;

create table stu
(
  stuid  char(4) comment '学号',
  name   varchar(20) comment '姓名',
  age    char(2) comment '年龄',
  gender char(1) check ( '男' or '女' ),
  primary key (stuid)
) comment '学生信息';

insert into stu
values ('0301', 'Tom', 19, '男'),
       ('0302', 'Mary', 20, '女'),
       ('0401', 'Jack', 18, '男'),
       ('0402', 'Ben', 20, '男');

create table course
(
  cid   char(4) comment '课程号',
  cname varchar(20) unique comment '课程名',
  primary key (cid)
) comment '课程表';

insert into course
values ('000A', '数据结构'),
       ('000B', 'Java程序设计'),
       ('000C', '数据库组成原理'),
       ('000D', 'Web程序设计');

select *
from stu;
select *
from course;

create table sc
(
  scid     char(4) comment '学号',
  courseid char(4) comment '课程号'
);

alter table sc
  add foreign key (scid) references stu (stuid);
alter table sc
  add foreign key (courseid) references course (cid);

insert into sc
values ('0301', '000A'),
       ('0301', '000C'),
       ('0302', '000B'),
       ('0302', '000D'),
       ('0401', '000A'),
       ('0401', '000C'),
       ('0402', '000C'),
       ('0402', '000D');

DROP TABLE SC;

SELECT * FROM sc;
SELECT * FROM stu;
SELECT * FROM course;

select distinct * from sc,stu,course where stuid = '0302'
