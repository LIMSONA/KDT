-- 3. SQL 기초 --
use madang;
show databases;
show tables;

select * from book;

#3-1
select bookname,price from book;

#3-2
desc book;
select * from book;
#동일식으로
select bookid,bookname,publisher,price from book;

#3-3
select publisher from book;

#3-4 
select * from book where price <20000 ;

