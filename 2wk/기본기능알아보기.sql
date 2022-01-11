show grants for kdt@localhost;

select current_user();
select user();
select database();
-- sql 버젼 --
select version();
-- sql 현재 날짜 --
select current_date();

-- 아래의 경우 오류 발생: 권한 부여한 데이터베이스에만 부과 -- 
select * from mysql.user;

-- 현재 날짜, 시각 --
select now();

-- 계산기 역할 --
select sin(pi()/4), (4+1)*5;

-- 여러 줄에 걸쳐 실행 가능함 --
select
user()
,
current_date();

