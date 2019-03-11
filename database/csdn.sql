create database csdn;

use csdn;

drop table if exists csdn.account;
create table csdn.account(
  id int(255) auto_increment primary key ,
  usename varchar(255) comment '用户名',
  password varchar(255) comment '密码',
  accounnt varchar(255) comment '账号'
)comment 'csdn账号密码';


SHOW VARIABLES LIKE '%local%';
SET GLOBAL local_infile=1;

load data local infile 'd:/csdn.sql'
  into table csdn.account
  fields terminated by  ',' (usename,password,accounnt)
  set id = null ;

select * from csdn.account;

drop table scott.test;