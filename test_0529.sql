-- 테이블 생성
create table ict_mem(
    m_idx number not null PRIMARY key,
    m_id VARCHAR2(50),
    m_pw VARCHAR2(50),
    m_name VARCHAR2(50),
    m_reg DATE,
    m_addr VARCHAR2(150)
);

-- 데이터 삽입
insert into ict_mem
values(61,'admin','admin','관리자','2023/02/22','회사');
insert into ict_mem
values(1,'aaaa','1111','홍길동','2022/12/20','함경동');
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

update 제품테이블 set 단가 = 단가*1.1 where 제조업체 = '대한식품';
update 제품테이블 set 재고량 = 10000 , 제조업체 = '대한푸드' where 제품번호 = 'P01' or 제품번호 = 'P05';
delete from 제품테이블 where 제조업체 = '민국푸드' and 단가 <= 3000;
delete from 주문테이블 where 주문일자 >= '2022/03/01' and 주문일자 <= '2022/04/30';

