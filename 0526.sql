-- 조작어(DML): 삽입(INSERT ~ INTO), 삭제(DELETE FROM), 수정(UPDATE ~ SET), 검색(SELECT ~ FROM)
-- 제어어(DCL): GRANT, REVOKE, COMMIT, ROLLBACK
    -- COMMIT: 현재 상태를 DB에 적용(저장)
    -- ROLLBACK: COMMIT 이전상태로 되돌린다.
        -- COMMIT - 작업1 - 작업2 - 작업3 - COMMIT - 작업4 - 작업5 - ROLLBACK(작업4, 작업5 이전상태로 되돌린다.
        
-- 데이터 삽입(INSERT INTO ~ VALUES ~)
-- 방법1) INSERT INTO 테이블 이름 VALUES (테이블에 들어갈 값, 테이블에 들어갈 값, 테이블에 들어갈 값);
    -- 값은 순서대로 모두 채워야 한다.
    -- 모두 채우지 않으면 오류이다.
    -- 값을 넣기 싫으면 NULL을 넣을 수 있다.
    -- (단, 속성 NOT NULL이면 무조건 값이 들어가야 한다.)
    -- 날짜와 문자는 반드시 ''(사용)
    -- SYSDATE는 오늘 날짜를 뜻하는 오라클 명령어이다.
    INSERT INTO MEMBER01
    VALUES(2,'KIM','K111','김둘리', 24, SYSDATE, 02, '서울');
    
    INSERT INTO MEMBER01
    VALUES(3,'PARK','P111','박꺼정', NULL, NULL, 02, '서울');
    
    INSERT INTO MEMBER01
    VALUES(4,'LEE','L111','이지매', NULL, '2023/01/22', 02, '서울');
    COMMIT;
    
-- 방법2) INSERT INTO 테이블이름(컬럼명, 컬럼명,...)
    -- VALUES(들어갈 값, 값,...)
    -- 컬럼명과 들어갈 반드시 1:1 매칭
    -- 속성이 NOT NULL 반드시 넣어야 된다.
    
    INSERT INTO MEMBER01(IDX)
    VALUES(5);
    INSERT INTO MEMBER01(IDX,M_ID,M_NAME,M_PW)
    VALUES(6, 'KANG','강동원','K111');
    COMMIT;
    
    INSERT INTO 고객테이블
    VALUES('APPLE','정소화',20,'GOLD', '학생', 1000);
    INSERT INTO 고객테이블
    VALUES('BANANA','김선우',25,'VIP', '간호사', 2500);
    INSERT INTO 고객테이블
    VALUES('CARROT','고명석',28,'GOLD', '교사', 4500);
    INSERT INTO 고객테이블
    VALUES('ORANGE','김용욱',22,'SILVER', '학생', 0);
    INSERT INTO 고객테이블
    VALUES('MELON','성원용',35,'GOLD', '회사원', 5000);
    INSERT INTO 고객테이블
    VALUES('PEAR','채광주',31,'SILVER', '회사원', 500);
    INSERT INTO 고객테이블
    VALUES('PEACH','오형준',NULL,'SILVER', '의사', 300);
    COMMIT;
    INSERT INTO 고객테이블
    VALUES('PEACH1','오형준1',NULL,'SILVER1', '의사1', 3001);
    ROLLBACK;
    
    CREATE TABLE 제품테이블(
    제품번호 VARCHAR(50) NOT NULL PRIMARY KEY,
    제품명 VARCHAR(50),
    재고량 NUMBER,
    단가 NUMBER,
    제조업체 VARCHAR(50)
    );
    
    CREATE TABLE 주문테이블(
    주문번호 VARCHAR2(50) NOT NULL PRIMARY KEY,
    주문고객 VARCHAR2(50),
    주문제품 VARCHAR2(50),
    수량 NUMBER,
    배송지 VARCHAR(50),
    주문일자 DATE
    );
    
    INSERT INTO 제품테이블
    VALUES('P01','그냥만두',5000,4500, '제조업체');
    INSERT INTO 제품테이블
    VALUES('P02','매운쫄면',2500,5500, '민국푸드');
    INSERT INTO 제품테이블
    VALUES('P03','쿵떡파이',3600,2600, '한빛제과');
    INSERT INTO 제품테이블
    VALUES('P04','맛난초콜릿',1250,2500, '한빛제과');
    INSERT INTO 제품테이블
    VALUES('P05','얼큰라면',2200,1200, '대한식품');
    INSERT INTO 제품테이블
    VALUES('P06','통통우동',1000,1550, '민국푸드');
    INSERT INTO 제품테이블
    VALUES('P07','달콤비스킷',1650,1500, '한빛제과');
    
    INSERT INTO 주문테이블
    VALUES('O01','APPLE','P03',10,'서울시 마포구', '2022/01/01');
    INSERT INTO 주문테이블
    VALUES('O02','MELON','P01',5,'인천시 계양구', '2022/01/10');
    INSERT INTO 주문테이블
    VALUES('O03','BANANA','P06',45,'경기도 부천시', '2022/01/11');
    INSERT INTO 주문테이블
    VALUES('O04','CARROT','P02',8,'부산시 금정구', '2022/02/01');
    INSERT INTO 주문테이블
    VALUES('O05','MELON','P06',36,'경기도 용인시', '2022/02/20');
    INSERT INTO 주문테이블
    VALUES('O06','BANANA','P01',19,'충청북도 보은군', '2022/03/02');
    INSERT INTO 주문테이블
    VALUES('O07','APPLE','P03',22,'서울시 영등포구', '2022/03/15');
    INSERT INTO 주문테이블
    VALUES('O08','PEAR','P02',50,'강원도 춘천시', '2022/04/10');
    INSERT INTO 주문테이블
    VALUES('O09','BANANA','P04',15,'전라남도 목포시', '2022/04/11');
    INSERT INTO 주문테이블
    VALUES('O10','CARROT','P03',20,'경기도 안양시', '2022/05/22');
    COMMIT;
    
    -- 수정, 삭제는 반드시 조건식을 넣어야 한다.
    -- 조건식을 넣지 않으면 전체가 삭제 되거나 전체가 수정된다.
    
    -- 데이터 삭제(DELETE FROM 테이블이름 [WHERE 조건식])
        -- 조건식이 있으면 조건식이 참인 것만 실행된다.
        -- 조건식(컬럼명 비교연산자)
    DELETE FROM 고객테이블;
    SELECT * FROM 고객테이블;
    SELECT * FROM 제품테이블;
    -- 제조업체가 '한빛제과'인 행만 삭제
    DELETE FROM 제품테이블 WHERE 제조업체 = '한빛제과';
    -- 제조업체가 '민국푸드'이면서 단가 3000이하인 행만 삭제
    DELETE FROM 제품테이블 WHERE 제조업체 = '민국푸드' AND 단가 <= 3000;
    ROLLBACK;
    
    -- 데이터 수정(UPDATE 테이블이름 SET 변경내용 [WHERE 조건식])
        -- 조건식이 있으면 조건식이 참인 것만 수정된다.
        -- 조건식이 없으면 전체가 수정된다.
     -- 제조업체를 대한푸드로 변경
    UPDATE 제품테이블 SET 제조업체 = '대한푸드';
    -- 제조업체를 한빛제과로 수정 단, 단가가 2000이상인 행만 수정
    UPDATE 제품테이블 SET 제조업체 = '한빛제과' WHERE 단가 >= 2000;
    -- 제조업체를 대한제품, 재고량=10000으로 수정 단, 제품번호가 P01 또는 P05 행만 수정
    UPDATE 제품테이블 SET 제조업체 = '대한식품', 재고량 = 10000 WHERE 제품번호 ='P01' OR 제품번호='P05';
    ROLLBACK;
    UPDATE 제품테이블 SET 제조업체 = '대학식품' WHERE 제품번호 = 'P01';
    UPDATE 제품테이블 SET 제조업체 = '대한식품' WHERE 제품번호 = 'P01';
    COMMIT;
    
    -- 제품테이블에서 제품번호가 P03인 제품의 제품명을 통큰파이로 수정하자
    UPDATE 제품테이블 SET 제품명 = '통큰파이' WHERE 제품번호 = 'P03';
    
    -- 제품테이블에 있는 모든 제품의 단가를 10% 인상해보자(칼럼이 숫자이면 산술연산이 가능)
    UPDATE 제품테이블 SET 단가 = 단가*1.1;
    -- 주문테이블에서 주문일자가 2022-05-22인 주문내역을 삭제하자
    DELETE FROM 주문테이블 WHERE 주문일자 = '2022/05/22';
    -- 주문테이블에서 주문일자가 2022-03 ~ 2022-04인 주문내역을 삭제하자
    DELETE FROM 주문테이블 WHERE 주문일자 >= '2022/03/01' AND 주문일자 <= '2022/04/30';
    -- 주문테이블의 주문일자를 모두 5일 수정하자
    UPDATE 주문테이블 SET 주문일자 = 주문일자 +5;
    -- 주문테이블에서 정소화 고객이 주문한 제품의 주문수량을 5개로 수정해보자.(서브쿼리 = 나중에)
ROLLBACK;

-----------------------------------------------------------