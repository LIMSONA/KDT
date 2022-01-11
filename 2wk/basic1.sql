select * from mysql.user;

-- user 생성 --
create user kdt@'%' identified by 'kdt';
create user kdt@localhost identified by 'kdt';


-- 데이터베이스 생성 --
create database kdtdb;

-- 권한을 부여 --
grant all privileges on kdtdb.* to kdt@'%' with grant option;
grant all privileges on kdtdb.* to kdt@localhost with grant option;


select * from mysql.user;
show grants for kdt@localhost;
flush privileges;

select 