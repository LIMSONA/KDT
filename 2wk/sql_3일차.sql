-- 서브쿼리 --

# 예제Q. smith 사원이 있는 부서의 급여평균을 알아내라
select deptno 
from emp
where ename = "smith";

select avg(sal)
from emp
where deptno = 
(select deptno 
from emp 
where ename ="smith");

# <smith와 같은 부서>의 이름,사원번호,부서번호,직책

select deptno
from emp
where ename = "smith";

select deptno, ename, empno, job
from emp
where DEPTNO = (select deptno
from emp
where ename = "smith");

# 평균급여보다 많이 받는 사원들의 정보를 출력해주세요.
# 서브쿼리 test
select avg(sal)
from emp;
#전체쿼리
select *
from emp
where sal > (select avg(sal) from emp);

#smith보다 월급을 더 많이 받는 사람들을 구해라
#서브쿼리 테스트
select sal
from emp
where ename = "smith";
#코드실행
select *
from emp
where sal >(select sal
from emp
where ename = "smith");

#####부서별 평균급여보다 많이 받는 사원정보
#서브쿼리 테스트
select avg(sal)
from emp
group by deptno;

#코드실행
select * from emp
where sal > all
(select avg(sal)
from emp
group by deptno);


-- outer 쿼리
#위 예제에서 smith의 부서의 평균보다 높은 다른 부서별 평균알아볼떄??
select * from emp where ename = "smith";
select avg(b.sal)
from emp b
group by deptno;

desc emp;
select * from emp a
where avg(a.sal) >
(select avg(b.sal) from emp b
where a.deptno = b.deptno);

#select * from emp where sal = 
#(select avg(sal) from emp where deptno = smith의 부서번호);
#smith의 부서번호를 알때는 바깥쪽에서 검색해서 가지고 온다

select deptno, avg(sal) as smithdeptnoavg from emp where ename = "smith";
select deptno, avg(sal) from emp group by deptno;

# outer 쿼리는 group by가 필요없당
# 실행
select * from emp e  
where e.sal = (select avg(sal) from emp where deptno = e.deptno);


-- 테이블 생성하기
create table member(
no int not null primary key,
email varchar(50) not null,
passwd varchar(20) not null,
name varchar(25),
department_name varchar(25));

-- 테이블 수정
#추가
alter table member 
add juminbunho char(13) not null;
#확인
select * from member;
#삭제
alter table member
drop juminbunho;
desc member; 
#추가
alter table member
add join_date datetime not null;

desc member;

alter table member change no no int not null auto_increment;
alter table member
change department_name dept_name varchar(25);
alter table member
change name name char(10);

alter table member rename user;


-- 삽입
desc user;
alter table user
change join_date join_date datetime not null default now();
select*from user;
insert into user values (1,"lightsn52@gmail.com",1234,"임소나","꾸꾸부서",default);
insert into user values (2,"lightsn52@naver.com",3456,"또방","꾸꾸부서",default);
insert into user (no,email,name,passwd) values (3, "lightsn52@kakao.com","소나",5678);

select * from pets;
insert into pets values ("KKUKKU","sona","dog",null,null,null);
insert into pets (name,owner,species) values ("DDoDDo","sona","lion"); 

desc user;
#업데이트하기
update user
set passwd = '7777', name = "소나소나"
where no = 1 ;
select * from user;
#값 삭제하기
delete from user where no = 3;