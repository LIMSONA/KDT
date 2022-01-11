
-- 테이블 생성 --
create table pets(
name varchar(20),
owner varchar(20),
species varchar(20),
sex char(1),
birth date,
death date);

-- 잘 들어갔나 확인 --
show tables;
select * from pets;

-- 삭제 --
drop table pets;

-- 확인 --
show tables;

-- 다시 생성 --
create table pets(
name varchar(20),
owner varchar(20),
species varchar(20),
sex char(1),
birth date,
death date);

insert into pets values('Fluffy','Harold','cat','f',
'1999-02-04',NULL);

-- 오류 발생의 경우 --
insert into pets values('doongi');
-- 수정하자면!!!! --
insert into pets(name) values('doongi');

select * from pets;
insert into pets (owner, name) values 
(1,'abc'),(2,'def'),(3,'ghi');

desc emp;

-- 원하는 조건으로 조회하기 --
# 사원명, 사원번호, 직업을 emp테이블에서 조회
select ename,empno,job from emp;
# 사원명, 사원번호, 직업을 emp테이블에서 부서명이 10번인 것 조회
select ename,empno,job from emp where DEPTNO=10;

select * from pets where name = "doongi";
select * from pets where name is null;
select * from pets where death is null;