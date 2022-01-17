#11번 문제
select empno,ename,sal
from emp
where sal > (select avg(sal) from emp where deptno="10");

#12번 self join
select e.ename 사원명, m.ename 매니저명
from emp e, emp m
where e.mgr= m.empno;

#13번 
select e.empno, e.ename, e.sal, s.grade
from emp e, salgrade s
where e.sal between s.LOSAL and s.HISAL;

#14번
select * from emp
where sal > all (select avg(sal) from emp group by deptno);

#15번
#select * from emp where sal > (자기자신이 속한 부서 평균 급여);
#(자기자신이 속한 부서 평균 급여) = select avg(sal) from emp where deptno = 자기부서
select * from emp a
where sal > (select avg(sal) from emp b where a.deptno = b.deptno);
