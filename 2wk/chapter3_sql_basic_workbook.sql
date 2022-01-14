desc book; #bookname, price

#3-28 가장 비싼 도서의 이름
#서브쿼리 테스트
select max(price)
from book;
#코드실행
select bookname
from book
where price =(select max(price)
from book);

desc orders;
select * from orders; #custid
select * from customer; #custid, name
#3-29 도서구매한 적있는 고객의 이름을 검색
#서브쿼리 테스트 - 도서구매한 이력 있는 고객검색
select distinct custid
from orders;
#코드실행
select name
from customer
where custid = any (select distinct custid
from orders);

select name
from customer
where custid  in (select distinct custid
from orders);

select * from book; #publisher, book id
select * from orders; #custid, book id
select * from customer; #custid, name
#3-30. 대한미디어출판 도서를 구매한 고객의 이름
#조인의 방법으로 풀수...?
select distinct c.name
from customer c, book b, orders o
where c.custid = o.custid and o.bookid = b.bookid
and b.publisher = "대한미디어";

#서브쿼리 방법으로!!
#서브쿼리 테스트 
-- 대한미디어 출판 도서 (결과 2개)
select bookid
from book
where publisher = "대한미디어";
-- bookid 조건으로 custid 추출(결과 2개니까 any나 in 사용)
select custid
from orders
where bookid in (select bookid
from book
where publisher = "대한미디어");

#코드실행
select name
from customer
where custid = (select custid
from orders
where bookid in (select bookid
from book
where publisher = "대한미디어"));


desc book; #price #publisher
#3-31. 출판사별로 출판사의 평균 도서가격보다 비싼 도서이름 **outer 서브쿼리
#서브쿼리-출판사별로 출판사의 평균 도서가격 -- 여러개
select publisher, avg(price)
from book
group by publisher; 

# 코드실행
select a.bookname
from book a
where a.price > 
(select avg(b.price)
from book b 
where a.publisher = b.publisher);


select * from customer; #address name custid
select * from orders; #custid 
#3-32. 대한민국 거주하는 고객이름과 / 도서를 주문한 고객의 이름
select name
from customer
where address like "%대한민국%"
union
select name
from customer
where custid in (select custid from orders);

#3-33. 주문이 있는 고객의 이름과 주소를 보이시오
#서브쿼리테스트 - 주문이 있는 고객 custid
select distinct custid
from orders;
#코드실행
select name, address
from customer
where custid in (select distinct custid
from orders);
#같은 코드
select name, address
from customer
where exists (select distinct custid
from orders);

-- 4. 데이터 정의어
#3-34
create table newbook(
bookid integer,
bookname varchar(20),
publisher varchar(20),
price integer);

#3-35
create table newcustomer(
custid integer primary key,
name varchar(40),
address varchar(40),
phone varchar(30));

#3-36
create table neworders(
orderid integer,
custid integer not null ,
bookid integer not null ,
saleprice integer,
orderdate date,
primary key(orderid),
foreign key(custid) references newcustomer(custid) on delete cascade);

desc neworders;

#3-37.
alter table newbook
add isbn varchar(13);
desc newbook;

#3-38.
alter table newbook
modify isbn integer;

#3-39.
alter table newbook
drop column isbn;

# 3-40.
alter table newbook
modify bookid integer not null;

#3-41.
alter table newbook
modify bookid integer not null primary key;

#동일한식alter table newbook add primary key(bookid);

#3-42
drop table newbook;

#3-43
drop table newcustomer;
desc newcustomer;
desc neworders;

#3-44 
select * from book;
insert into book(bookid,bookname,publisher,price)
values (11,"스포츠의학","한솔의학사",90000);
# 동일식 insert into book values (11,"스포츠의학","한솔의학사",90000);

#3-45
insert into book(bookid,bookname,publisher)
values (12,"스포츠의학","한솔의학사");

#3-46
select * from imported_book;
insert into book (bookid,bookname,price,publisher)
select bookid,bookname,price,publisher
from imported_book;

#3-47
select*from customer;

update customer
set address='대한민국부산'
where custid=5;

#3-48
update book a
set publisher = (select publisher from imported_book where bookid=21)
where a.bookid=12;
desc book;
select* from book;
select* from imported_book;

#3-49
delete
from book
where bookid=11;

#3-50
delete from customer;
desc