--- 테이블 보기 ---
show tables;
--- emp 테이블 내용 보기 ---
select * from emp;
--- 묘사 ---
desc bonus;

--- 사용자 삭제 ---
drop user test@localhost;

--- 현재 유저 ---
select user();
select current_user();


create user