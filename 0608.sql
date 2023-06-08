-- PL/SQL: ����Ŭ���� �����ϴ� ���α׷��� ����� Ư���� ������ SQL
--         SQL�� ������ + ���(if, loop, for)�� ���
--         ������ ���α׷��� �����ϰ� �ϴ� ����Ŭ SQL ������
-- ����:  https://www.tutorialspoint.com/plsql/index.htm

-- 1. ���ν���: return ���� ������� �ʴ� �Լ��� ����
--            �۾������� ������ ������ ���α׷��� ���� ����
--            ����� ������ �ǵ��� ������ out ���� ����ؾ� �Ѵ�.
--    �⺻����: [������], ������, [������]
--    1. ������: DECLARE
--              ��������;
--    2. ������: BEGIN
--              SQL �����;
--    3. ������: EXCEPTION
--              END;

-- HELLO, WORLD! ����ϱ�
-- String msg = "Hello, world!" -> msg varchar2(50) := 'hello, world!'
-- System.out.println(����)   -> dbms_output.put_line(����);
-- ��, dbms_output.put_line()�� ����ϱ� ���ؼ��� set serveroutput on;

-- 1) �͸� ���ν���: ��ȸ��, ������� �ʴ´�.
set SERVEROUTPUT on;
DECLARE
msg VARCHAR2(50) := 'hello, world!';
BEGIN
dbms_output.put_line(msg);
end;

-- �͸� ���ν����� Ȱ���� ��� ����
    -- 1) if ���ǽ� then
        -- ���ǽ��� ���̸� ������ ����;
        -- end if;
        
    -- ���� i�� 10�̻��̸� �����Ͱ��� �������
    DECLARE
        i NUMBER := 24;
    BEGIN
        if (i>=10) then
           dbms_output.put_line('i��'||i||'�̴�.'); 
        end if;
    end;
    
-- 2) if ���ǽ� then
    -- ���ǽ��� ���̸� ������ ����;
    -- else
        -- ���ǽ��� �����̸� ������ ����;
    -- end if;
    
-- ���� i�� Ȧ������ ¦������ �Ǻ��ϴ� �͸� ���ν���
DECLARE
    i NUMBER := 57;
BEGIN
    if (mod(i,2) = 0) then
        dbms_output.put_line('i��' || i || '¦���̴�.');
    else
        dbms_output.put_line('i��' || i || 'Ȧ���̴�.');
    end if;
end;

DECLARE
    i NUMBER := 28;
    res VARCHAR2(50);
BEGIN
    if (mod(i,2) = 0) then
        res := '¦��';
    else
        res := 'Ȧ��';
    end if;
      dbms_output.put_line('i��' || i || '��' || res ||'�̴�.');  
end;

-- 3) if ���ǽ� then
    -- ���๮;
    -- elsif ���ǽ� then
    -- ���๮;
    -- elsif ���ǽ� then
    -- ���๮;
    -- [else ���๮;]
    -- end if;
    
DECLARE
    i int := 80;
    hak VARCHAR2(50);
BEGIN
    if (i>=90) then 
        hak := 'A����';
    elsif (i>=80) then
        hak := 'B����';
    elsif (i>=70) then
        hak := 'C����';
    else hak := 'F����'; 
    end if;
    dbms_output.put_line('����� ������ '|| hak ||' �Դϴ�');
end;

-- �ݺ���: for��, while��, loop��
-- 1) for��
--    for ���� in �ʱⰪ .. ������ loop
--         �ݺ������� ����(SQL��)
--    end loop;

-- 1-10���� ����ϴ� ���ν���(��������)
DECLARE
    i NUMBER;
BEGIN
    for i in 1 .. 10 LOOP
         dbms_output.put_line(' i =  '|| i);
    end loop;
end;

-- 11-20���� ����ϴ� ���ν���(��������)
DECLARE
BEGIN
    for cnt in 11 .. 20 LOOP
         dbms_output.put_line(' cnt =  '|| cnt);
    end loop;
end;

-- 1 - 10���� ¦���� ���
DECLARE
BEGIN
    for cnt in 1 .. 10 loop
        if(mod(cnt,2)=0) then
            dbms_output.put_line(' cnt =  '|| cnt);
        end if;
    end loop;
end;
-- 1-10 ���� ¦���� �� ���
DECLARE
    i NUMBER := 0;
BEGIN
    for cnt in 1 .. 10 loop
        if(mod(cnt,2)=0) then
            i := i + cnt;
        end if;
    end loop;
        dbms_output.put_line('¦���� ���� '|| i);
end;

-- 2) while��
-- declare
    -- ����(�ʱ��)
-- begin
    -- while ���ǽ� loop
        -- ������ ����;
        -- ������;
    -- end loop;
-- end;

-- 1-10���� ���
DECLARE
    i NUMBER := 1;
begin
    while (i<=10) loop
        dbms_output.put_line('i = '|| i);
        i := i + 1;
    end loop;
end;
        
-- 1-10���� ¦���� ���
DECLARE
    i NUMBER := 1;
begin
    while (i<=10) LOOP
        if(mod(i,2)=0) then
            dbms_output.put_line(' i = '|| i);
        end if;
        i := i + 1;
    end loop;
end;
-- 1-10���� ¦���� �� ���
DECLARE
    i NUMBER := 1;
    s NUMBER := 0;
begin
    while (i<=10) LOOP
        if(mod(i,2)=0) then
            s := s + i;
        end if;
        i := i + 1;
    end loop;
    dbms_output.put_line('�հ�: '|| s);
end;

-- 3-1) loop
-- declare
    -- ����(�ʱ��)
-- begin
    -- loop
        -- ������ ����;
        -- ������;
        -- if(�������� ���ǽ�) then
            -- exit;
        -- end if;
    -- end loop;
-- end;
-------------------------------------
-- declare
    -- ����(�ʱ��)
-- begin
    -- loop
        -- ������ ����;
        -- exit when ���ǽ�;(�������� ���ǽ�)
        -- ������;
    -- end loop;
-- end;

-- 1-10���� ���
declare
    i NUMBER := 1;
begin
    loop
        dbms_output.put_line(' i = '|| i);
        i := i + 1;
        if(i > 10) then
            exit;
        end if;
    end loop;
end;

declare
    i NUMBER := 1;
begin
    loop
        dbms_output.put_line('i = '|| i);
        exit when (i >= 10);
        i := i + 1;
    end loop;
end;

-----------------------------------------------------------
-- ���� ���ν���
-- ����) create [or replace] procedure �̸�
--      begin
--          ����(update, insert, delete�� �Ϲ� SQL�� ����, select�� ���� �ٸ���)
--      end;

-- customer ���̺��� custid�� 2�� �ڷ��� �̸��� '�Ѹ�'�� ��������.
-- 1. ���ν��� ����
create PROCEDURE ch_name as
begin
    update customer set name = '�Ѹ�' where custid = 2;
end;

create PROCEDURE ch_name2 as
begin
    update customer set name = '�Ѹ�' where custid = 2;
end;

select * from CUSTOMER order by custid;

-- ���ν��� ����: EXEC ���ν����̸�;
exec ch_name;
-- ���� ��� Ȯ��
select * from customer order by custid;

-- �ܺο��� custid�� �̸��� �޾Ƽ� customer ���̺��� �����ϴ� ���ν����� ������.
-- �ܺο��� ������ �޴´� => �Ű�����, ���� => in(����)
-- �ܺη� ������ ������ => return        => out
-- ���࿡ Ư�����̺��� �������� Ÿ���� �� ��: ���̺�,Į��%type

create PROCEDURE ch_name3(p_name in customer.name%TYPE, p_custid in customer.custid%TYPE) as
begin
    update customer set name = p_name where custid = p_custid;
end;

-- ����
exec ch_name3('�Ӳ���', 1);
exec ch_name3('������', 4);
select * from customer;

-- customer ���̺� 6�� ����� ���ѹα� ��⵵ 000-1414-1414�� ������ �����ϴ� ���ν��� ����
create PROCEDURE ins_customer as
begin
    insert into customer(custid, name, address, phone)
    values(6, '�����', '���ѹα� ��⵵', '000-8989-8989');
end;

-- ����
exec ins_customer;
select * from customer;

create PROCEDURE ch_name3(p_name in customer.name%TYPE, p_custid in customer.custid%TYPE) as
begin
    update customer set name = p_name where custid = p_custid;
end;

-- customer ���̺� ��ȣ,�̸�,�ּ�,��ȭ��ȣ�� �Է¹޴� ���ν��� ����
create PROCEDURE ins_customer2(p_custid in customer.custid%TYPE, p_name in customer.name%TYPE, 
                                p_address in customer.address%TYPE, p_phone in customer.phone%TYPE) as
begin
    update customer set name = p_name, address = p_address, phone = p_phone where custid = p_custid;
end;

exec ins_customer2(7, '�̰���', null, null);

-- customer ���̺� ��ȣ�� �޾Ƽ� �����ϴ� ���ν��� ����
create PROCEDURE ins_customer3(p_custid in customer.custid%TYPE) as
begin
    delete from customer where custid = p_custid;
end;

-- ����
exec ins_customer3(6);

-- ** begin ~ end; ��Ͼȿ��� ���Ǵ� select��
-- select �÷�
-- into ���庯��(����� ����)
-- from ���̺��̸�
-- where ���ǽ�

-- Ư¡: where ���ǽ��� ����Ͽ� ����� �ϳ��� ������ ����
--      ���� ����� into ������ �ִ� ���庯���� ��������

declare
    v_name customer.name%type;
    v_phone customer.phone%type;
begin
    select name, phone into v_name, v_phone
    from customer
    where custid = 2;
    dbms_output.put_line('customer name : ' || v_name);
    dbms_output.put_line('customer phone : ' || v_phone);
end;

declare
    v_customer customer%rowtype;
begin
    select * into v_customer
    from customer
    where custid = 2;
    dbms_output.put_line('customer name : ' || v_customer.name);
    dbms_output.put_line('customer phone : ' || v_customer.phone);
    dbms_output.put_line('customer address : ' || v_customer.address);
    dbms_output.put_line('customer custid : ' || v_customer.custid);
end;

select * from book;

-- customer ���̺� �����͸� �Է��ؼ� ���� ������ ������ ������Ʈ�� ������ ��������
-- (�⺻Ű�� �������� ������ �־�� �Ѵ�.)

create procedure chk_customer(
    p_name customer.name%type, p_address customer.address%type,
    p_phone customer.phone%type)as
    cnt number;
begin
    select count(*)
    into cnt
    from customer
    where name = p_name and address = p_address and phone = p_phone;
    
    if(cnt=0)then
        insert into customer(custid, name, address, phone)
        values(customer_seq.nextval, p_name, p_address, p_phone);
    else
        update customer set name = p_name, address = p_address, phone=p_phone where name=p_name and phone=p_phone;
    end if;
end;

select * from customer;
exec chk_customer('�Ѹ�', '���ֵ�', '000-6000-0001');
exec chk_customer('�Ѹ�', '�︪��', '000-1004-0001');

-- out�� �̿��ؼ� ���ν��� ����� ��������
-- book���̺��� ����Ǿ� �ִ� ������ ��� ������ ��ȯ�ϴ� ���ν���
select * from book;
select avg(price) from book;

create or replace procedure avg_price2(avg_val out number) as
begin
    select avg(price)
    into avg_val
    from book
    where price is not null;
end;

-- exec�� ���� �ȵ�
-- exec avg_price();
-- �͸� ���ν����� ���� ��Ų��.

declare
    a_val number;
begin
    -- �̸� ������� ���ν��� ȣ��
    avg_price2(a_val);
    dbms_output.put_line('å ��� �ݾ�' || trunc(a_val));
end;

-- bookid�� �Է¹޾Ƽ� å�̸�, ������ ����ϴ� ���ν��� (���1)
create or replace procedure chk_book
(
    p_bookid in book.bookid%type,
    p_bookname out book.bookname%type,
    p_price out book.price%type
)as
begin
    select bookname, price
    into p_bookname, p_price
    from book
    where bookid = p_bookid;
end;

-- ����
declare
    i_bookname book.bookname%type;
    i_price book.price%type;
begin
    chk_book(2, i_bookname, i_price);
    dbms_output.put_line('bookname: ' || i_bookname);
    dbms_output.put_line('price: ' || i_price);
end;