-- 만들어진 테이블에 primary key추가
alter table 고객테이블 add PRIMARY key (고객아이디);
commit;

-- 만들어진 테이블을 가지고 외래키를 만들자.
-- alter table 테이블 이름 add constraint fk명 foreign key(칼럼명)
-- references pk를 위한 테이블명(컬럼명);

alter table 주문테이블 add constraint fk_주문고객 foreign key (주문고객)
references 고객테이블(고객아이디);

alter table 주문테이블 add constraint fk_주문제품 foreign key (주문제품)
references 제품테이블(제품번호);

-- FK를 적용하면 마음대로 삽입/삭제할 수 없다.
-- 무결성 제약 조건에 위배됨 - 부모키가 없습니다.
insert into 주문테이블(주문번호, 주문고객, 주문제품, 수량, 배송지, 주문일자)
values('o11','BANANA','p07',15,'제주도','2022-06-01');

-- ORA-02292: 무결성 제약조건(C##RYUHYEJI.FK_주문고객)이 위배되었습니다- 자식 레코드가 발견되었습니다
delete from 고객테이블 where 고객아이디 = 'APPLE';
delete from 제품테이블 where 제품번호 = 'p03';
-- 삭제가능: 주문테이블에서 참조하지 않았으므로 삭제 가능
delete from 제품테이블 where 제품번호 = 'p05';

--테이블 생성하면 외래키 만들기
CREATE TABLE CLIENTINFO (
    NAME VARCHAR2(20),
    AGE NUMBER -- 나이는 0 보다 크고 150 보다는 작다 
        CONSTRAINT CHECK_AGE CHECK(AGE > 0 AND AGE < 150),
    GENDER VARCHAR2(3) -- 성별은 알파벳 M 또는 W로 입력 받는다.
        CONSTRAINT CHECK_GENDER CHECK(GENDER IN('M', 'W')),
    INFONO NUMBER -- 정보번호는 INFO 테이블의 기본키다.
        CONSTRAINT PK_INFONO PRIMARY KEY
);

INSERT INTO CLIENTINFO VALUES('홍길동', 30, 'M', 1);
INSERT INTO CLIENTINFO VALUES('홍숙이', 20, 'W', 2);
INSERT INTO CLIENTINFO VALUES('김강', 25, 'M', 3);
INSERT INTO CLIENTINFO VALUES('박홍길', 40, 'M', 4);
INSERT INTO CLIENTINFO VALUES('원빈', 44, 'M', 5);
INSERT INTO CLIENTINFO VALUES('이나영', 42, 'W', 6);
commit;

select * from CLIENTINFO;

-- 외래키 만들 테이블
create table CLIENTJOIN(
    ID VARCHAR2(40) not null primary key,
    PW VARCHAR2(40),
    INFONO number,
    constraint FK_INFONO foreign key(INFONO) references CLIENTINFO(INFONO)
);

-- rownum: 오라클 내부에서 생성하는 기상 칼럼, SQL조회 결과의 순번을 나타냄
select rownum, k.* from (select * from 고객테이블) k where rownum between 1 and 3;

--------------------------------------------------------------------------------
-- 날짜 / 시간 함수
-- 1. sysdate: 오라클에서 지원하는 시스템상의 오늘 날짜 변환하는 함수, 연산가능
select sysdate -1 as 어제, sysdate as 오늘, sysdate +1 as 내일 from dual;

-- 2. to_date(문자열): 문자열 데이터를 날짜형 데이터로 변경
select sysdate from dual;
select sysdate +20 from dual;
-- 오류
-- select sysdate - '2023-06-01' from dual;
select trunc(sysdate - to_date('2023-06-01')) from dual;

-- 3. to_char('날짜', '날짜형'): 날짜형 데이터를 문자형 데이터로 변경
select to_char(to_date('2023/06/05','yy-mm-dd'),'yymmdd') from dual;

-- 4. ADD_MONTHS(date, 숫자): 날짜형의 날짜에서 지정한 달만큼 더함(1: 다음달, -1: 지난달)
select sysdate, add_months(sysdate,4), add_months(sysdate,-4) from dual;

-- 5. last_day(date): 해당 달의 마지막 날짜
select last_day(sysdate), last_day(add_months(sysdate,4)), last_day(add_months(sysdate,3))from dual;

-- 6. 해당 요일의 가장 가까운 날짜(미래): next-day(날짜,요일)
select sysdate, next_day(sysdate,'토요일'), next_day(sysdate, '수요일') from dual;

-- 7. 기간 구하기: moths_between(끝날짜, 시작날짜): 월단위
select trunc(months_between(sysdate, '2023/01/01')) from dual;
