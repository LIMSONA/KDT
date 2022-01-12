-- 문자형 함수 --
select upper("SEoul"), ucase("seOUL");
select lower("SEoul"), lcase("seOUL");

select substring("Happy Day",3,2);
select substring("Happy Day",7,2);

select lpad("hi",5,"?");
select lpad("sona",10,"^");
select rpad("hungry",15,"!");
select rpad("water",10,"~");

select ltrim("          sona           "),rtrim("          sona           ");
select trim(both"*" from "******sona*******");


-- 숫자형 함수 --
select abs(2), abs(-2);

select mod(100,7), 100%7;

# 주어진 값보다 크지 않은, 가장 큰 정수 반환
select floor(1.333333), floor(-1.333333);
# 주어진 값보다 작지않은, 가장 작은 정수 반환 
select ceiling(1.33333333), ceiling(-1.33333);
# 가장 근접한 정수
select round(1.333333), round(-1.33333);
# 소수점자리 지정 가장 근접한 수로 반환
select round(1.333333, 2), round(-1.33333, 2);

select pow(2,2), power(2,3);

#음수이면 -1 / 0이면 0 / 양수이면 1
select sign(-32), sign(0), sign(50);

select greatest(100,200,300), greatest(1.0,2.0,3.0), greatest("A","B","Z");select greatest(100,200,300), greatest(1.0,2.0,3.0), greatest("A","B","Z");
select least(100,200,300), least(1.0,2.0,3.0), least("A","B","Z");

-- 날짜형 함수 --
select curdate(), current_date;
select curtime(), current_time;
select now(), sysdate(), current_timestamp();

# date_format(date,format)형식
select date_format(curdate(), '%w %m %y');
select date_format(curdate() , '%y, %m, %d');