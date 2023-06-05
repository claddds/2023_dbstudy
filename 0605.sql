-- ������� ���̺� primary key�߰�
alter table �����̺� add PRIMARY key (�����̵�);
commit;

-- ������� ���̺��� ������ �ܷ�Ű�� ������.
-- alter table ���̺� �̸� add constraint fk�� foreign key(Į����)
-- references pk�� ���� ���̺��(�÷���);

alter table �ֹ����̺� add constraint fk_�ֹ��� foreign key (�ֹ���)
references �����̺�(�����̵�);

alter table �ֹ����̺� add constraint fk_�ֹ���ǰ foreign key (�ֹ���ǰ)
references ��ǰ���̺�(��ǰ��ȣ);

-- FK�� �����ϸ� ������� ����/������ �� ����.
-- ���Ἲ ���� ���ǿ� ����� - �θ�Ű�� �����ϴ�.
insert into �ֹ����̺�(�ֹ���ȣ, �ֹ���, �ֹ���ǰ, ����, �����, �ֹ�����)
values('o11','BANANA','p07',15,'���ֵ�','2022-06-01');

-- ORA-02292: ���Ἲ ��������(C##RYUHYEJI.FK_�ֹ���)�� ����Ǿ����ϴ�- �ڽ� ���ڵ尡 �߰ߵǾ����ϴ�
delete from �����̺� where �����̵� = 'APPLE';
delete from ��ǰ���̺� where ��ǰ��ȣ = 'p03';
-- ��������: �ֹ����̺��� �������� �ʾ����Ƿ� ���� ����
delete from ��ǰ���̺� where ��ǰ��ȣ = 'p05';

--���̺� �����ϸ� �ܷ�Ű �����
CREATE TABLE CLIENTINFO (
    NAME VARCHAR2(20),
    AGE NUMBER -- ���̴� 0 ���� ũ�� 150 ���ٴ� �۴� 
        CONSTRAINT CHECK_AGE CHECK(AGE > 0 AND AGE < 150),
    GENDER VARCHAR2(3) -- ������ ���ĺ� M �Ǵ� W�� �Է� �޴´�.
        CONSTRAINT CHECK_GENDER CHECK(GENDER IN('M', 'W')),
    INFONO NUMBER -- ������ȣ�� INFO ���̺��� �⺻Ű��.
        CONSTRAINT PK_INFONO PRIMARY KEY
);

INSERT INTO CLIENTINFO VALUES('ȫ�浿', 30, 'M', 1);
INSERT INTO CLIENTINFO VALUES('ȫ����', 20, 'W', 2);
INSERT INTO CLIENTINFO VALUES('�谭', 25, 'M', 3);
INSERT INTO CLIENTINFO VALUES('��ȫ��', 40, 'M', 4);
INSERT INTO CLIENTINFO VALUES('����', 44, 'M', 5);
INSERT INTO CLIENTINFO VALUES('�̳���', 42, 'W', 6);
commit;

select * from CLIENTINFO;

-- �ܷ�Ű ���� ���̺�
create table CLIENTJOIN(
    ID VARCHAR2(40) not null primary key,
    PW VARCHAR2(40),
    INFONO number,
    constraint FK_INFONO foreign key(INFONO) references CLIENTINFO(INFONO)
);

-- rownum: ����Ŭ ���ο��� �����ϴ� ��� Į��, SQL��ȸ ����� ������ ��Ÿ��
select rownum, k.* from (select * from �����̺�) k where rownum between 1 and 3;

--------------------------------------------------------------------------------
-- ��¥ / �ð� �Լ�
-- 1. sysdate: ����Ŭ���� �����ϴ� �ý��ۻ��� ���� ��¥ ��ȯ�ϴ� �Լ�, ���갡��
select sysdate -1 as ����, sysdate as ����, sysdate +1 as ���� from dual;

-- 2. to_date(���ڿ�): ���ڿ� �����͸� ��¥�� �����ͷ� ����
select sysdate from dual;
select sysdate +20 from dual;
-- ����
-- select sysdate - '2023-06-01' from dual;
select trunc(sysdate - to_date('2023-06-01')) from dual;

-- 3. to_char('��¥', '��¥��'): ��¥�� �����͸� ������ �����ͷ� ����
select to_char(to_date('2023/06/05','yy-mm-dd'),'yymmdd') from dual;

-- 4. ADD_MONTHS(date, ����): ��¥���� ��¥���� ������ �޸�ŭ ����(1: ������, -1: ������)
select sysdate, add_months(sysdate,4), add_months(sysdate,-4) from dual;

-- 5. last_day(date): �ش� ���� ������ ��¥
select last_day(sysdate), last_day(add_months(sysdate,4)), last_day(add_months(sysdate,3))from dual;

-- 6. �ش� ������ ���� ����� ��¥(�̷�): next-day(��¥,����)
select sysdate, next_day(sysdate,'�����'), next_day(sysdate, '������') from dual;

-- 7. �Ⱓ ���ϱ�: moths_between(����¥, ���۳�¥): ������
select trunc(months_between(sysdate, '2023/01/01')) from dual;
