use hr;
show tables;
select * from employees;
desc employees;

-- employees 테이블에서 1991년 이전 입사 직업 이름,입사일 출력 --
select concat(first_name," ",last_name)as 이름, hire_date as 입사일 
from employees
where hire_date < '1991-01-01';
# 공백은 " "로 표현하기 날짜는 01-01부터 ''안에 넣어주기!alter

-- employees 테이블에서 1989년 이전 입사, 입사일 출력 --
