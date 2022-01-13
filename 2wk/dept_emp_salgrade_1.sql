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

select * from emp;
#2. 부서별 전체 사원수와 커미션을 받는 사원들의 수를 구하는 쿼리
select deptno, count(empno), count(comm)
from emp
group by deptno;

select deptno, count(*), count(comm)
from emp
group by deptno;

desc dept;
desc emp;
#3. 부서별 최대 급여와 최소 급여를 구하는 쿼리
select deptno, max(sal), min(sal)
from emp
group by deptno;

#4. 부서별로 급여 평균 (단, 부서별 급여 평균이 2000 이상만)
select deptno, avg(sal)
from emp
group by deptno
having avg(sal) >= 2000;

#5. 월급여가 1000 이상인 사원만을 대상으로 부서별로 월급여 평균을 구하라. 
-- 단, 평균값이 2000 이상인 레코드만 구하라

select deptno, avg(sal)
from emp
where sal >=1000
group by deptno
having avg(sal) >=2000;

-- order by 구문
#1.급여가 높은 순으로 조회하되 급여가 같을 경우 이름의 철자가 빠른 사원순으로 사번,이름,월급여를 조회하시오
select empno,ename,sal
from emp
order by sal desc, ename;

desc dept; #deptno, dname, loc
desc emp; #empno, ename,job,mgr,hiredate,sal,comm,deptno
desc salgrade; #grade, losal, hisal
select * from salgrade;

-- 조인join 문제
#1. 카테시안 곱
select emp.ename, dept.dname
from emp,dept;

#2. 사원명, 부서명
select e.ename, d.dname
from emp e, dept d
where e.deptno = d.DEPTNO;

#3. 이름,월급여,월급여 등급을 조회
select e.ename, e.sal, s.grade
from emp e,salgrade s
where e.sal between s.losal and s.hisal;

#4. 이름,부서명,월급여등급을 조회
select e.ename, d.dname, s.grade
from emp e, dept d, salgrade s
where d.deptno = e.DEPTNO and e.sal between s.LOSAL and s.hisal;

#5. 이름, 직속상사이름 조회
### 셀프조인
desc emp;
select * from emp;

select a.ename, b.ename
from emp a, emp b
where a.mgr = b.empno;


##상사가 없는 경우도 있다!!
#그래서!
SELECT a.ENAME as "직속상사이름", b.ENAME as "직원이름"
FROM EMP a LEFT JOIN EMP b ON a.MGR = b.EMPNO;

#6. 이름, 부서명 조회
#사원테이블에 부서번호40 속한 사원이 없지만 부서번호 40번 부서명도 출력
select e.ename, d.dname
from dept d left join emp e on d.deptno = e.deptno;

#7. 이름, 부서번호, 부서이름조회
select e.ename, e.DEPTNO,d.dname
from emp e, dept d
where e.DEPTNO = d.DEPTNO;

#dept테이블 더 큰 집합
SELECT ENAME,E.DEPTNO,DNAME
FROM EMP E INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO;

desc emp; #
desc dept; #loc, deptno
#8. 부서번호가 30번인 사원들의 이름, 직급,부서번호, 부서위치
select ename,job,e.DEPTNO,loc
from emp e, dept d
where e.deptno = d.deptno and d.deptno = 30;


select e.ename,e.job,e.deptno,d.loc
from emp e inner join dept d on e.deptno = d.deptno
where d.deptno = 30;


desc emp; #deptno
desc dept; #loc, deptno,dname
#9. 커미션을 받는 사원의 이름,커미션,부서이름,부서위치조회
SELECT ENAME,COMM,DNAME,LOC
FROM EMP,DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO 
AND EMP.COMM IS NOT NULL AND EMP.COMM <> 0;

select e.ename, e.comm, d.dname, d.loc
from emp e,dept d
where e.deptno = d.deptno
and e.comm is not null and e.comm <>0;

#10. dallas 근무 사원이름,직금,부서번호,부서명 조회
select e.ename, e.job, e.deptno, d.dname
from emp e inner join  dept d on e.deptno = d.deptno
where d.loc = "dallas";

#11. 이름에 A가 들어가는 사원의 이름,부서명 조회
select e.ename, d.dname
from emp e inner join dept d on e.deptno = d.deptno
where e.ename like "%A%";

select e.ename, d.dname
from emp e, dept d
where e.deptno = d.deptno
and e.ename like "%A%";
#12. 이름, 직급,월급여, 월급여 등급을 조회
select e.ename, e.job, e.sal, s.grade
from emp e, salgrade s
where e.sal between s.losal and s.hisal;

desc emp; #deptno ename empno deptno
#13. allen 같은 부서에 근무하는 사원이름,부서번호 조회 ==> 서브쿼리 문제

