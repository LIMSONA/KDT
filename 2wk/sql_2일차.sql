select * from pets where owner="benny";
SELECT * FROM pets; 

-- 정렬하기 --
# 정렬조건을 콤마','로 추가하기 같은 조건일수도 있으니, 조건을 추가해주는거다.
# 정렬조건에서 desc는 내림차순!
select name,birth,owner from pets order by owner,birth desc;


-- null은 어떤 값이 아니니까 숫자나 문자열처럼 부등호로 유무 확인할수 없다! --
select name, birth, owner
from pets
where owner is not null
order by owner desc, birth desc;

-- 위와 같은 식 (마치 format 처럼 숫자로 부과 해서 써줄수 있다.)--
select name, birth, owner
from pets
where owner is not null
order by 3 desc, 2 desc;

-- 패턴매칭 --
# 첫글자 매칭
select * from pets where name like 'F%';
# 끝글자 매칭
select * from pets where name like '%F';
# 어디선가든 매칭
select * from pets where name like '%F%';
#두번째 매칭
select * from pets where name like '_l%';
#5문자 이름
select * from pets where name like '_____';

-- 카운트하기 --
select count(*) from emp;
select * from emp;

select count(comm) from emp;

select * from pets;
select count(sex) from pets;


-- 중복되는 값 제거 후 확인 --
select distinct owner from pets;
select distinct deptno from emp;

select distinct deptno from emp;

-- 컬럼명 변경해보기 --
# as로 짝꿍 지어져도 되지만, 안써도 무방!!
select deptno 부서번호, ename 사원명 from emp; 
# 부서V번호 라고 공백을 포함해서 써버리면 에러가 발생됨
# 그래서 " "안에 넣어서 하기!


-- concat 이어붙이기 --
select concat(name,"---",owner) from pets;


-- 실습해보기 --
desc emp;
select job from emp;
select distinct job from emp;

-- 그룹함수 --
#그룹함수는 그룹핑에 참여하지 않은 일반 컬럼과 함께 나올 수 없다!!
#그룹핑에 참여하는 열이라면 같이 select에 그룹함수와 같이 나올수 있음!
select count(*), deptno from emp; -- > 이거는 오류 발생alter
select count(*), deptno from emp group by deptno; -- > 이거는 가능함


-- 실행순서 --
-- FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY 
# 조건1 - 부서별 평균 급여. 급여 1000원 이하 제외
# 조건2 - 부서별 평균 급여 2500원 이하 부서 제외

select deptno, avg(sal) from emp
where sal > 1000
group by DEPTNO
having avg(sal) > 2500
order by 2 desc;

  