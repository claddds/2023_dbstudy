select DISTINCT 등급 from 고객테이블;

select 고객이름, 등급, 나이 from 고객테이블 order by 나이 DESC;

select avg(단가), sum(단가), count(*) from 제품테이블;

select 제조업체, count(*), max(단가) from 제품테이블 group by 제조업체;

select custid, count(*) 
from orders where saleprice >= 8000
group by custid having count(*) >= 2 ;

select lower ('KOREA1231'), lower('KoRea'), lower('korea'),
        upper('KOREA1212'), upper('KoRea'), upper('korea')
from dual;

select o.주문고객, p.제품명
from 제품테이블 p, 주문테이블 o
where p.제품번호 = o.주문제품 and o.주문고객 = 'BANANA';

select bookid
from book
where publisher = '이상미디어';

select custid
from orders
where bookid in (select bookid
                from book
                where publisher = '이상미디어');
                
select name
from customer
where custid in (select custid
                from orders
                where bookid in (select bookid
                                from book
                                where publisher = '이상미디어'));
                                

select trunc(months_between(sysdate, '2023/01/01')) from dual;

select months_between(sysdate, '2023/01/01') from dual;

set SERVEROUTPUT on;

DECLARE
    i NUMBER := 28;
    res VARCHAR2(50);
BEGIN
    if (mod(i,2) = 0) then
        res := '짝수';
    else
        res := '홀수';
    end if;
      dbms_output.put_line('i는' || i || res ||'이다.');  
end;

create PROCEDURE ch_name4(p_custid in customer.custid%TYPE, p_name in customer.name%TYPE) as
begin
    update customer set name = p_name where id = p_custid;
end;

exec ch_name4(1,'임꺽꺽');
select * from customer;

drop PROCEDURE ch_name4;

create PROCEDURE ins_customer2(p_custid in customer.custid%TYPE, p_name in customer.name%TYPE, 
                                p_address in customer.address%TYPE, p_phone in customer.phone%TYPE) as
begin
    update customer set name = p_name, address = p_address, phone = p_phone where custid = p_custid;
end;

create or replace trigger t_test4 after
delete on customer
for each row
begin
    insert into customer_del(custid, name, address, phone, del_date)
    values(:old.custid, :old.name, :old.address, :old.phone, sysdate);
end;