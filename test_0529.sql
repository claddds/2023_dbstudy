-- ���̺� ����
create table ict_mem(
    m_idx number not null PRIMARY key,
    m_id VARCHAR2(50),
    m_pw VARCHAR2(50),
    m_name VARCHAR2(50),
    m_reg DATE,
    m_addr VARCHAR2(150)
);

-- ������ ����
insert into ict_mem
values(61,'admin','admin','������','2023/02/22','ȸ��');
insert into ict_mem
values(1,'aaaa','1111','ȫ�浿','2022/12/20','�԰浿');
insert into ict_mem
values(43,'333','333','333','2023/02/14','333');
insert into ict_mem
values(45,'3333333','33333','3333','2023/02/14','3333');
commit;

DELETE FROM ict_mem;
drop table ict_mem;
rollback;

alter table ict_mem add m_age number;
alter table ict_mem drop COLUMN m_reg;

update ��ǰ���̺� set �ܰ� = �ܰ�*1.1 where ������ü = '���ѽ�ǰ';
update ��ǰ���̺� set ��� = 10000 , ������ü = '����Ǫ��' where ��ǰ��ȣ = 'P01' or ��ǰ��ȣ = 'P05';
delete from ��ǰ���̺� where ������ü = '�α�Ǫ��' and �ܰ� <= 3000;
delete from �ֹ����̺� where �ֹ����� >= '2022/03/01' and �ֹ����� <= '2022/04/30';

