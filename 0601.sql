-- ����(join) �˻�: 2�� �̻��� ���̺��� �����Ͽ� �����͸� �˻��ϴ� ��
--              �Ϲ������� �ܷ�Ű�� �̿��ؼ� �����Ѵ�.
--              �����Ϸ��� ���̺��� �Ӽ��� �̸��� �޶� ������ ������(������Ÿ��, ũ��)�� ���ƾ� �Ѵ�.
--              from���� �˻��� �ʿ��� ��� ���̺��� ����
--              where���� ���� �Ӽ��� ���� ���ƾ� ���� �ǹ��ϴ� ���������� ����
--              ��Ī�� ����ϴ� ���� SQL �ۼ��ϴ� ���� ����.

-- ��������(Inner join)
-- select A���̺��.�÷���, A���̺��.�÷���, B���̺��.�÷���, B���̺��.�÷���
-- from A���̺��, B���̺��
-- where A���̺��.�÷��� = B���̺��.�÷���
--      **A���̺��.�÷��� = B���̺��.�÷��� �̶� �÷��� �ܷ�Ű�� �⺻�̴�.
--      **�� ���̺��� ��� ���� Į���� ������ ���� �� ���

-- banana ���� �ֹ��� ��ǰ�� �̸��� �˻��غ���
select p.��ǰ�� 
from ��ǰ���̺� p, �ֹ����̺� o
where p.��ǰ��ȣ = o.�ֹ���ǰ and o.�ֹ��� = 'BANANA';

select p.��ǰ��
from ��ǰ���̺� p inner join �ֹ����̺� o on p.��ǰ��ȣ = o.�ֹ���ǰ
where o.�ֹ��� = 'BANANA';

-- ���̰� 30���̻��� ���� �ֹ��� ��ǰ�� ��ȣ�� �ֹ�����,���̸��� �˻�����
select c.���̸�, c.����, o.�ֹ���ǰ, o.�ֹ�����
from �����̺� c, �ֹ����̺� o
where c.�����̵� = o.�ֹ��� and c.���� >= 30;

-- ���̰� 30���̻��� ���� �ֹ��� ��ǰ�� ��ȣ�� �ֹ�����,���̸�, ��ǰ���� �˻�����
select c.���̸�, c.����, o.�ֹ���ǰ, p.��ǰ��, o.�ֹ�����
from �����̺� c, �ֹ����̺� o, ��ǰ���̺� p
where c.�����̵� = o.�ֹ��� and o.�ֹ���ǰ = p.��ǰ��ȣ and c.����>= 30;

-- ��� ���� �ֹ��� ��ǰ�� ��ǰ���� �˻�����
select p.��ǰ��
from �����̺� c, �ֹ����̺� o, ��ǰ���̺� p
where c.�����̵� = o.�ֹ��� and o.�ֹ���ǰ = p.��ǰ��ȣ and c.���̸� = '���';

-- ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� �˻��Ͻÿ�.(����)
select c.name, o.saleprice
from customer c, orders o
where c.custid = o.custid;

-- ��id�� �ֹ��� ��� ������ �� �Ǹž��� ���ϱ�(group by)
select custid, sum(sasaleprice)
from orders 
group by custid;

-- ��id�� �ֹ��� ��� ������ �� �Ǹž��� ���ϰ�, ���̸����� ���� �Ͻÿ�
select c.custid, sum(o.saleprice)
from customer c, orders o
where c.custid = o.custid
group by c.custid
order by c.custid asc;

-- ���� �̸��� ���� �ֹ��� ������ �̸�, �ֹ� ��¥�� ���Ͻÿ�.
SELECT c.name, b.bookname, o.orderdate
from customer c, orders o, book b
where c.custid = o.custid and b.bookid = o.bookid
order by c.name asc;

-- ������ 20,000�� �̻��� ������ �ֹ��� ���� �̸��� ������ �̸��� ���Ͻÿ�.
SELECT c.name, b.bookname, o.saleprice, o.orderdate
from customer c, orders o, book b
where c.custid = o.custid and b.bookid = o.bookid and o.saleprice >= 20000
order by c.name asc;

-- inner join, left join, right join
-- select �Ӽ�
-- from ���̺�1 inner join ���̺�2 on ��������
-- [where �˻�����]

-- banana ���� �ֹ��� ��ǰ�� �̸��� �˻��غ���
select p.��ǰ��
from ��ǰ���̺� p inner join �ֹ����̺� o on p.��ǰ��ȣ = o.�ֹ���ǰ
where o.�ֹ��� = 'BANANA';

create table AAA(
    id number PRIMARY key ,
    ename VARCHAR2(50)
);
create table BBB(
    id number PRIMARY key ,
    kname VARCHAR2(50)
);

insert into AAA values(1,'AAA');
insert into AAA values(2,'BBB');
insert into AAA values(3,'CCC');

insert into BBB values(1,'��');
insert into BBB values(2,'��');
insert into BBB values(4,'��');
insert into BBB values(5,'��');
commit;

-- left join: �������̺� �ִ� ��
-- select �÷���, ...from ���̺�1 left join ���̺�2 on �������� [where �˻�����]
select a.id, a.ename, b.kname
from AAA a left join BBB b on a.id =b.id;

-- right join: ���������̺� �ִ� ��
-- select �÷���, ...from ���̺�1 right join ���̺�2 on �������� [where �˻�����]
select a.id, a.ename, b.kname
from AAA a right join BBB b on a.id =b.id;

select a.id,a.ename,b.kname
from BBB b left join AAA a on a.id=b.id;

-- �����̺��� �������� ���̸�, �ֹ���ǰ,�ֹ����ڸ� �˻�����
select c.���̸�, o.�ֹ���ǰ, o.�ֹ�����
from �����̺� c left join �ֹ����̺� o on c.�����̵� = o.�ֹ���;
order by c.���̸�;

-- ������ �������� ���� ���� �����Ͽ� ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� ���Ͻÿ�
select c.name, o.saleprice
from customer c left join orders o on c.custid=o.custid;

--------------------------------------------------------------------------
-- ��������: ����(Query = ����)�� ������ �ۼ��ϴ� ��
-- ������ ������: ����� �� �� => �񱳿�����
-- ������ ������: ����� ������ => in(or), any(and), all, exists;

-- book ���̺��� ���� ��� ������ �̸��� �˻�����.
-- 1. ���� ��� �ݾ�:
select max(price) from book;

-- 2. ������ 35000���� �����̸�
select bookname from book where price = 35000;

select bookname from book where price = (select max(price) from book);

-- ������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�.
-- 1. ������ ������ ���� �ִ� �ڷḦ �˻�(�ߺ�����)
-- 1,2,3,4
select distinct custid from orders;

select name from customer where custid = 1;
select name from customer where custid = 2;
select name from customer where custid = 3;
select name from customer where custid = 4;

select name from customer where custid in (1,2,3,4);

-- subquery
select name from customer where custid in (select distinct custid from orders);

-- join
select distinct c.name from customer c, orders o where c.custid = o.custid;

-- �̻�̵��� ������ ������ ������ ���� �̸��� ���̽ÿ�
--1. �̻�̵� bookid
select bookid from book where publisher = '�̻�̵��';  --7,8(������)

-- 2. bookid�� 7,8�� custid
select custid from orders where bookid in (7,8);    --  4   4   3

-- 3. custid 3,4�� ���� �̸� ���
select name from customer where custid=4 or custid =3;
select name from customer where custid in (3,4);

-- subquery
select name from customer 
where custid in (select custid from orders
                    where bookid in (select bookid from book where publisher = '�̻�̵��'));

-- join
select distinct name
from customer c, orders o, book b
where c.custid = o.custid and b.bookid = o.bookid and b.publisher = '�̻�̵��';

-------------------------------------------------------------------------------
-- _���ν����� å�� ������ ���
--(join)
select distinct c.name
from customer c, orders o, book b
where c.custid = o.custid and b.bookid = o.bookid and b.bookname like '_��%';

-- 1. _���� ������ å�� bookid
select bookid from book where bookname like '_��%';
-- 2. 1,2,3,7,8�� custid
select custid from orders where bookid in(1,2,3,7,8);
-- 3. custid(1,1,4,1,3)�� ���̸�
select name from customer where custid in (1,1,4,1,4,3);
--subquery
select name from customer 
    where custid in (select custid from orders
        where bookid in(select bookid from book where bookname like '_��%'));
        
-- ��յ������ݺ��� ��� �����̸�
-- 1. ��յ�������
select avg(price)from book;
-- 2. 14450���� ��� ������ �̸�
select bookname from book where price > 14450;
-- subquery
select bookname
from book
where price > (select avg(price) from book);

-- ���޺�Ŷ�� ������ ������ü�� ���� ��ǰ���� ��ǰ��� �ܰ��� �˻�
-- 1.���޺�Ŷ�� ������ ������ü
select ������ü from ��ǰ���̺� where ��ǰ�� = '���޺�Ŷ';    -- �Ѻ�����
-- subquery
select ��ǰ��, �ܰ� from ��ǰ���̺�
where ������ü = (select ������ü from ��ǰ���̺� where ��ǰ�� = '���޺�Ŷ');

-- �������� ���� ���� ���� ���̸��� �������� �˻�
-- 1. ������ �ְ�
select max(������) from �����̺�;
-- ����(subquery)
select ���̸�, ������ from �����̺�
where ������ = (select max(������) from �����̺�);

-- in: ��ġ�ϴ� ���� ������ �˻� ������ ��
-- not in: ��ġ���� ������ �˻� ������ ��
-- exists: �ϳ��� �����ϸ� �˻� ������ ��

-- banana ���� �ֹ��� ��ǰ�� ��ǰ��� ������ü�� �˻��غ���
select ��ǰ��, ������ü
from ��ǰ���̺�
where ��ǰ��ȣ in(select �ֹ���ǰ from �ֹ����̺� where �ֹ��� = 'BANANA');
-- banana ���� �ֹ����� ���� ��ǰ�� ��ǰ��� ������ü�� �˻��غ���
select ��ǰ��, ������ü
from ��ǰ���̺�
where ��ǰ��ȣ not in(select �ֹ���ǰ from �ֹ����̺� where �ֹ��� = 'BANANA');
-- ���ѽ�ǰ�� ������ ��� ��ǰ�� �ܰ����� ��� ��ǰ�� ��ǰ��, �ܰ�, ������ü�� �˻��غ���

-- 2022��3��15�� ��ǰ�� �ֹ��� ���� ���̸��� �˻��غ���.

-- 2022��3��15�� ��ǰ�� �ֹ����� ���� ���� ���̸��� �˻��غ���.