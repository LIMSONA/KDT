#4-1.
select abs(-78),abs(78);

#4-2.
select round(4.875,1);

#4-3.
#소수점자리가 아닌 정수자리에서 반올림할 경우에는 음수로!

select * from orders;
select custid as "고객번호", round(sum(saleprice)/count(*),-2) as"평균금액"
from orders
group by custid;

#4-4
select bookid,replace(bookname,"야구","농구") bookname, publisher, price
from book;

#4-5
select bookname "제목" ,char_length(bookname) "문자수", length(bookname) "바이트수"
from book
where publisher = "굿스포츠";

use madang;
select * from customer;

#4-6
select substr(name,1,1) "성", count(*) "인원"
from customer
group by substr(name,1,1);

select * from orders;
#4-7
select orderid "주문번호", orderdate "주문일자", adddate(orderdate,interval 10 day) "확정일자"
from orders;

#4-8
select orderid "주문번호" , str_to_date(orderdate,"%Y-%m-%d") "주문일", custid "고객번호" , bookid "도서번호"
from orders
where orderdate = date_format("20140707","%Y%m%d");

#4-9 
select sysdate();

select*from customer;
#4-10
select name "이름", ifnull(phone,"연락처없음") "전화번호"
from customer;

#4-11
set @seq:=0;
select (@seq:=@seq+1),custid, name, phone
from customer
where @seq<2;

-- chapter 4-2. 서브쿼리 --
select*from customer; #custid, name
select*from orders; #custid, saleprice
#4-12 고객별 판매액조회 (고객이름. 고개판매액 출력)
#서브쿼리 테스트
select custid,sum(saleprice)
from orders
group by custid;
#코드식
select custid,sum(saleprice)
from orders
group by custid;


