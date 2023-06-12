select DISTINCT ��� from �����̺�;

select ���̸�, ���, ���� from �����̺� order by ���� DESC;

select avg(�ܰ�), sum(�ܰ�), count(*) from ��ǰ���̺�;

select ������ü, count(*), max(�ܰ�) from ��ǰ���̺� group by ������ü;

select custid, count(*) 
from orders where saleprice >= 8000
group by custid having count(*) >= 2 ;

select lower ('KOREA1231'), lower('KoRea'), lower('korea'),
        upper('KOREA1212'), upper('KoRea'), upper('korea')
from dual;

select o.�ֹ���, p.��ǰ��
from ��ǰ���̺� p, �ֹ����̺� o
where p.��ǰ��ȣ = o.�ֹ���ǰ and o.�ֹ��� = 'BANANA';

select bookid
from book
where publisher = '�̻�̵��';

select custid
from orders
where bookid in (select bookid
                from book
                where publisher = '�̻�̵��');
                
select name
from customer
where custid in (select custid
                from orders
                where bookid in (select bookid
                                from book
                                where publisher = '�̻�̵��'));
                                

select trunc(months_between(sysdate, '2023/01/01')) from dual;

select months_between(sysdate, '2023/01/01') from dual;

set SERVEROUTPUT on;

DECLARE
    i NUMBER := 28;
    res VARCHAR2(50);
BEGIN
    if (mod(i,2) = 0) then
        res := '¦��';
    else
        res := 'Ȧ��';
    end if;
      dbms_output.put_line('i��' || i || res ||'�̴�.');  
end;

create PROCEDURE ch_name4(p_custid in customer.custid%TYPE, p_name in customer.name%TYPE) as
begin
    update customer set name = p_name where id = p_custid;
end;

exec ch_name4(1,'�Ӳ���');
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