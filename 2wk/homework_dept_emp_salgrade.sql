show tables;
# dept, emp, salgrade

desc dept; #deptno, dname, loc
desc emp; #empno, ename,job,mgr,hiredate,sal,comm,deptno
desc salgrade; #grade, losal, hisal

###########################################
-- select 문제
#1. 사원테이블의 모든 레코드를 조회하시오
select *
from emp;

#2. 사원명과 입사일을 조회하시오.
select ename, hiredate
from emp;

#3. 사원번호와 이름을 조회하시오.
#---> 블로그에 잘못 올라옴
select empno, ename
from emp;

#4. 사원테이블에 있는 직책 목록을 조회하시오.
select distinct job
from emp;

#5. 총 사원수를 구하시오.
select count(empno)
from emp;

#####################################
-- where 조건 문제
#1. 부서번호가 10인 사원을 조회하시오
select *
from emp
where deptno=10;

select *
from emp
where deptno like '10';

#2. 월급여가 2500이상 되는 사원을 조회하시오.
select *
from emp
where sal>=2500;

#3. 이름이 'KING'인 사원을 조회하시오.
select *
from emp
where ename = "KING";

select *
from emp
where ename like "kING";

#4. 사원들 중 이름이 S로 시작하는 사원의 사원번호와 이름을 조회
select empno as 사원번호, ename as 이름
from emp
where ename like "s%";

#5. 사원이름에 t가 포함된 사원의 사원번호와 이름을 조회
select empno as 사원번호, ename as 이름
from emp
where ename like "%t%";

#6. 커미션이 300,500,1400인 사원의 사번, 이름 커미션을 조회
select empno as 사번, ename as 이름, comm as 커미션
from emp
where comm in(300,400,500);

#7. 월급여가 1200~3500 사이 사원의 사번, 이름, 월급여를 조회
select empno 사번, ename 이름, sal 월급여
from emp
where sal between 1200 and 3500;

#8. 직급이 매니저이고, 부서번호가 30번인 사원의 이름,사번,직급,부서번호 조회
select ename 이름,empno 사번,job 직급,deptno 부서번호
from emp
where job ="manager" and DEPTNO=30;

#9. 부서번호가 30이 아닌 사원의 사번, 이름, 부서번호를 조회
select empno 사번, ename 이름, deptno 부서번호
from emp
where deptno <> 30;

#10 커미션이 300,500,1400이 모두 아닌 사원의 사번, 이름, 커미션을 조회하시오
select empno, ename, comm
from emp
where comm not in(300,500,1400);

#11 이름에 S가 포함되지 않는 사원의 사번,이름을 조회
select empno,ename
from emp
where ename not like '%s%';

#12 급여가 1200보다 미만이거나 3700 초과하는 사원의 사번,이름,월급여를 조회
select empno, ename, sal
from emp
where sal <1200 or sal >3700;

select empno, ename,sal
from emp
where sal not between 1200 and 3700;

#13. 직속상사가 null인 사원의 이름과 직급을 조회하시오.
select ename,job
from emp
where mgr is null;

-- group by 구문 문제
#1. 부서별 평균월급여를 구하는 쿼리
select deptno, avg(sal)
from emp
group by deptno;

#2. 부서별 전체 사원수와 커미션을 받는 사원들의 수를 구하는 쿼리

