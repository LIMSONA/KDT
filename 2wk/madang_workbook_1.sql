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

#3-5
select * from book where price between 10000 and 20000;

#3-6
select * from book where publisher in("굿스포츠","대한미디어");

#3-7
select bookname, publisher from book where bookname="축구의 역사";
#동일식
select bookname, publisher from book where bookname like "축구의 역사";

#3-8
select bookname, publisher from book where bookname like "%축구%";

#3-9
select bookname from book where bookname like "_구%";

#3-10
select * from book where bookname like "%축구%" and price >20000;

#3-11
select * from book where publisher like "굿스포츠" or publisher = "대한미디어";

#3-12
select * from book order by bookname;

#3-13
select * from book order by price, bookname;

#3-14
select * from book order by bookname desc, publisher asc;

#3-15
select sum(price) from book;

#3-16
desc book;
select * from book;
select * from customer;
select * from orders;

select sum(saleprice) as 총매출 from orders
where custid=2;

#3-17 
select sum(saleprice), avg(saleprice), min(saleprice), max(saleprice)
from orders;

#3-18
select count(*) from orders;

#3-19
desc orders;
select custid, count(*) as "총 수량", sum(saleprice) as "총 판매액"
from orders
group by custid;

#3-20
select custid, count(*) as "총 수량"
from orders
where saleprice >=8000
group by custid
having count(*) >= 2;

-- 3-21부터있는 조인문제를 join 여러가지 문법으로 풀어보쟝
-- = 방법, natural join 방법, join on 방법, join using방법
# 3-21
desc customer;
desc orders;

select *
from customer c,orders o
where c.custid = o.custid;

# 3-22
select *
from customer c,orders o
where c.custid = o.custid
order by c.custid;

select *
from customer c natural join orders o
where c.custid = o.custid
order by c.custid;

select *
from customer c join orders o
on c.custid = o.custid
order by c.custid;

select *
from customer c join orders o
using (custid)
order by c.custid;

#3-23
#1)
select name, saleprice
from customer c, orders o
where  c.custid =  o.custid;
#2)
select name, saleprice
from customer c natural join orders o
where  c.custid =  o.custid;
#3)
select name, saleprice
from customer c join orders o
on  c.custid =  o.custid;
#4)
select name, saleprice
from customer c join orders o
using  (custid);

#3-24
desc customer;
desc orders;
#1)
select name, sum(saleprice)
from customer c, orders o
where c.custid = o.custid
group by c.name
order by c.name;

#2)
select name, sum(saleprice)
from customer c natural join orders o
where c.custid = o.custid
group by c.name
order by c.name;

#3)
select name, sum(saleprice)
from customer c join orders o
on c.custid = o.custid
group by c.name
order by c.name;

#4)
select name, sum(saleprice)
from customer c join orders o
using (custid)
group by c.name
order by c.name;

#3-25
select * from book; #bookid, bookname
select * from orders; # custid, bookid
select * from customer; # custid, name

select c.name as "고객이름", b.bookname as "주문한 도서이름"
from customer c, orders o, book b
where c.custid=o.custid and o.bookid=b.bookid;

#3-26
select * from book; #bookid, price, bookname
select * from orders; # custid, bookid, price
select * from customer; # custid, name

select c.name as "고객 이름", b.bookname as "도서 이름"
from customer c, orders o, book b
where c.custid=o.custid and o.bookid=b.bookid and b.price=20000; 

#3-27
#도서를 구매하지 않은사람 포함 
select c.name, o.saleprice
from customer c left outer join orders o
on c.custid=o.custid;

#3-28 서브쿼리 내일 배울것 !
select * from book; # price, bookname

select bookname
from book
where price = 
(select max(price)bookname
from book);


# 3-33까지
