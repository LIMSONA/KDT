-- 서브쿼리 문제
#1. allen과 같은 부서에 근무하는 사원의 이름,부서번호를 조회
#서브쿼리 테스트
select deptno
from emp
where ename = "allen";
#코드식
select deptno, ename
from emp
where deptno = (select deptno
from emp
where ename = "allen");

select * from emp; #deptno
select * from dept; #deptno
#2.사원명'jones'가 속한 부서명 조회
#서브쿼리
select deptno
from emp
where ename = "jones";

#코드실행
select dname
from dept
where deptno = (select deptno
from emp
where ename = "jones");

#3. 10번부서에서 근무하는 사원의 이름과 10번 부서의 부서명을 조회
#그냥 풀기
select e.ename, d.dname
from emp e, dept d
where e.deptno = d.deptno and d.deptno=10;

######서브쿼리로풀기??????
#서브쿼리 테스트
select deptno,dname
from dept
where deptno=10;
#코드실행
select e.ename, d.dname
from emp e, 
(select deptno,dname
from dept
where deptno=10) d
where e.deptno = d.deptno;

#서브쿼리를 하나의 테이블로 생각해서 그거와 조인하면 된다고 생각하면 됨!!!!!!

#4. 평균 월급여보다 더많은 월급여를 받은 사원의 사원번호,이름,월급여 조회
#서브쿼리테스트
select avg(sal)
from emp;

#코드실행
select empno,ename,sal
from emp
where sal > (select avg(sal)
from emp);

#5. 부서번호가 10인 사원중에서 최대급여를 받는 사원과 
#동일한 급여를 받는 사원의 사원번호, 이름조회
#서브쿼리 테스트
select max(sal)
from emp
where deptno = 10;
#코드실행
select empno,ename
from emp
where sal = (select max(sal)
from emp
where deptno = 10);

-- insert 문 이용한 문제
use kdtdb;
desc emp;
#1. emp 테이블에 새로운 사원정보 추가
insert into emp (empno,ename,job,mgr,hiredate,sal,comm,deptno)
values (1562,'홍길동','SALESMAN',7698,SYSDATE(),2000,1000,30);
select * from emp;
#2. emp 테이블에 새로운 사원 정보추가(임꺽정)
insert into emp values( 1500,'임꺽정','SALESMAN',7698,SYSDATE(),1800,1200,30);
#3. emp 테이블에 새로운 사원정보 추가(장길산)
insert into emp (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,DEPTNO)
VALUES (1697,'장길산','MANAGER',7839,SYSDATE(),3000,30);


-- update문 이용 문제
#1. 사원테이블에서 임꺽정의 월급여를 2800으로 변경
update emp
set sal =2800
where ename = "임꺽정";

#2. 사원테이블에서 홍길동의 월급여를 300만큼 인상하고 comm은 500으로 변경
update emp
set sal=sal+300 , comm =500
where ename="홍길동";

-- delete 문
#1. 사원테이블에서 홍길동, 임꺽정,장길산을 삭제
delete from emp
where ename in ("홍길동","임꺽정","장길산");