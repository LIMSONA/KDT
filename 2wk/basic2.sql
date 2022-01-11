-- db와 user 만들기 --
create user test@localhost identified by "test";
create database testdb;

-- 사용자와 권한 확인 --
select * from mysql.user;

-- 권한 부여 --
grant all privileges on testdb.* to test@localhost with grant option;
flush privileges;

show grants for test@localhost;

-- 사용자와 권한 확인 --
select * from mysql.user;