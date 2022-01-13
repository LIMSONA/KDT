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

#
