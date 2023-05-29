drop table book;

CREATE TABLE book(
    bookid number not null primary key,
    bookname VARCHAR2(50),
    publisher VARCHAR2(50),
    price NUMBER
);

create table orders(
    orderid number not null PRIMARY KEY,
    custid NUMBER NOT NULL,
    bookid NUMBER NOT NULL,
    saleprice NUMBER,
    orderdate DATE
);

create TABLE customer(
    custid NUMBER not null PRIMARY KEY,
    name VARCHAR2(50),
    address VARCHAR2(50),
    phone VARCHAR2(50)
);

commit;

insert into customer
VALUES(1,'������','���� ��ü��Ÿ', '000-5000-0001');
insert into customer
VALUES(2,'�迬��','���ѹα� ����', '000-6000-0001');
insert into customer
VALUES(3,'��̶�','���ѹα� ������', '000-7000-0001');
insert into customer
VALUES(4,'�߽ż�','�̱� Ŭ������', '000-8000-0001');
insert into customer
VALUES(5,'�ڼ���','���ѹα� ����');
insert into customer
VALUES(5,'�ڼ���','���ѹα� ����',null);

insert into book
VALUES(1,'�౸�� ����', '�½�����', 7000);
insert into book
VALUES(2,'�౸�ƴ� ����', '������', 13000);
insert into book
VALUES(3,'�౸�� ����', '���ѹ̵��', 22000);
insert into book
VALUES(4,'���� ���̺�', '���ѹ̵��', 35000);
insert into book
VALUES(5,'�ǰ� ����', '�½�����', 8000);
insert into book
VALUES(6,'���� �ܰ躰���', '�½�����', 6000);
insert into book
VALUES(7,'�߱��� �߾�', '�̻�̵��', 20000);
insert into book
VALUES(8,'�߱��� ��Ź��', '�̻�̵��', 13000);
insert into book
VALUES(9,'�ø��� �̾߱�', '�Ｚ��', 7500);
insert into book
VALUES(10,'Olympic Champions', 'Pearson', 13000);

insert into orders
VALUES(1, 1, 1, 6000, '2014-07-01');
insert into orders
VALUES(2, 1, 3, 21000, '2014-07-03');
insert into orders
VALUES(3, 2, 5, 8000, '2014-07-03');
insert into orders
VALUES(4, 3, 6, 6000, '2014-07-04');
insert into orders
VALUES(5, 4, 7, 20000, '2014-07-05');
insert into orders
VALUES(6, 1, 2, 12000, '2014-07-07');
insert into orders
VALUES(7, 4, 8, 13000, '2014-07-07');
insert into orders
VALUES(8, 3, 10, 12000, '2014-07-08');
insert into orders
VALUES(9, 2, 10, 7000, '2014-07-09');
insert into orders
VALUES(10, 3, 8, 13000, '2014-07-10');

-- 1.��� ������ �̸��� ������ �˻��Ͻÿ�.
    select bookname, price from book;

-- 2.��� ������ ���ݰ� �̸��� �˻��Ͻÿ�.
    select price, bookname from book;
    
-- 3.��� ������ ������ȣ,  �����̸�, ���ǻ�, ������ �˻��Ͻÿ�.
    select * from book;
    
-- 4.���� ���̺� �ִ� ��� ���ǻ縦 �˻��Ͻÿ�.
    select publisher from book;
    
-- 5.���� ���̺� �ִ� ��� ���ǻ縦 �˻��Ͻÿ�.(�ߺ�����)
    select distinct publisher from book;
    
-- 6.������ 10,000�� �̻� 20,000 ������ ������ �˻��Ͻÿ�.
    select * from book where price between 10000 and 20000;
    
-- 7.���ǻ簡 ���½������� Ȥ�� �����ѹ̵��� ������ �˻��Ͻÿ�.
    select * from book where publisher in ('�½�����', '���ѹ̵��');
    
-- 8.'�౸�� ���硯�� �Ⱓ�� ���ǻ縦 �˻��Ͻÿ�.
    select publisher from book where bookname = '�౸�� ����';
    
-- 9.�����̸��� ���౸���� ���Ե� ���ǻ縦 �˻��Ͻÿ�.
    select publisher from book where bookname like '%�౸%';
    
-- 10.�����̸��� ���� �� ��° ��ġ�� ��������� ���ڿ��� ���� ������ �˻��Ͻÿ�
    select * from book where bookname like '_��%';
    
-- 11.�౸�� ���� ���� �� ������ 20,000�� �̻��� ������ �˻��Ͻÿ�.
    select * from book where bookname like '%�౸%' and price >= 20000;
    
-- 12.������ �̸������� �˻��Ͻÿ�.
    select * from book order by bookname;
    
-- 13.������ ���ݼ����� �˻��ϰ�, ������ ������ �̸������� �˻��Ͻÿ�.
    select * from book order by price, bookname;
    
-- 14.������ ������ ������������ �˻��Ͻÿ�. ���� ������ ���ٸ� ���ǻ��� ������������ �˻��Ѵ�.
    select * from book order by price desc, publisher;
    
-- 15. ������ȣ�� 1�� ������ �̸�
    select bookname from book where bookid = 1;
    
-- 16. ������ 20000�� �̻��� ������ �̸�
    select bookname from book where price >= 20000;
    
-- 17. ��� ���� �̸� ,�ּ�
    select name,address from customer;
    
-- 18. 2014�� 7�� 4�� ~ 7�� 7�� ���̿� �ֹ����� ������ �ֹ���ȣ
    select orderid from orders where orderdate between '2014-07-04' and '2014-07-07';
    
-- 19. 2014�� 7�� 5�� ~ 7�� 7�� ���̿� �ֹ����� ������ ������ ������ �ֹ� ��ȣ
     select orderid from orders where orderdate < '2014-07-05' or orderdate > '2014-07-07';
     
-- 20. ���� '��'���� ���� �̸��� �ּ�
    select name, address from customer where name like '��%';
    
-- 21. ���� '��'���̰� �̸��� '��'�� ������ ���� �̸��� �ּ�
    select name, address from customer where name like '��%��'; 