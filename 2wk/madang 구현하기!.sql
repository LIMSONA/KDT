-- db와 user 만들기 --
create user madang@localhost identified by "madang";
create database madang;

-- 권한부여하기 --
grant all privileges on madang.* to madang@localhost with grant option;
