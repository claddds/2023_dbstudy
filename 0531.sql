-- select [all|distinct] 속성이름(들)
-- from 테이블이름(들)
-- [where 검색조건(들)]
-- [group by 속성이름]
-- [having 검색조건(들)]
-- [order by 속성이름[asc|desc]]

-- 집계함수: 특별한 경우를 제외하고는 일반 컬럼과 같이 사용 불가
--          특정 속성값을 통계적으로 계산한 결과를 검색하기 위한 함수
-- 주의 사항: NULL 속성값은 제외하고 계산한다.
--          WHERE절에는 사용할 수 없고, SELECT절이나 HAVING절에서만 사용 가능
-- 종류: SUM(컬럼명): 해당 칼럼의 합계 구하기
--      AVG(컬럼명): 해당 컬럼의 평균 구하기
--      MAX(컬럼명): 해당 컬럼의 최대값 구하기
--      MIN(컬럼명): 해당 컬럼의 최소값 구하기
--      COUNT(기본 컬럼명 또는 *): 해당 컬럼의 갯수 구하기

-- 제품테이블에서 모든 제품의 단가 평균을 검색 해보자
    select AVG(단가), sum(단가), count(*) from 제품테이블;
    
-- 한빛제과에서 제조한 제품의 재고량 합계를 제품 테이블에서 검색해보자.
    SELECT avg(재고량), sum(재고량), count(*) from 제품테이블 where 제조업체 = '한빛제과';
    
-- 고객테이블에 고객이 몇 명 등록되어 있는지 검색해보자.
    select COUNT(*) FROM 고객테이블;
    
-- 제품테이블에서 제조업체의 수를 검색해보자.
    select count(distinct 제조업체) from 제품테이블;
    
-- order테이블에서 고객이 주문한 도서의 총 판매액, 평균을 구하시오.
    select sum(saleprice) as 총판매액, avg(saleprice) 평균 from orders;
    
-- orders테이블 중 2번 김연아 고객이 주문한 도서의 총 판매액을 구하시오.
    select sum(saleprice) as 총판매액 from orders where custid = 2;
    
-----------------------------------------------------------------------

-- Group by 속성명 [Having 조건]
-- 특정 속성값이 같은 튜플을 모아 그룹을 만듦
-- group by 사용시 select 절은 집계함수와, group by 에서 사용한 컬럼명만 사용 가능
-- 집계함수는 where절에서는 사용 못하고 having절에서 사용 가능
-- Having 절은 group by의 결과를 가지고 조건을 실행할때 사용
-- where절은 group by 이전에 조건을 가지고 실행할 때 사용

-- 주문테이블에서 주문제품별 수량의 합계를 검색하자
select 주문제품, sum(수량)
from 주문테이블
group by 주문제품;

-- 제품테이블에서 제조업체별로 제품의 개수와 가장비싼 단가를 검색하자.
select 제조업체, count(*) as "제품의 수", MAX(단가)
from 제품테이블
group by 제조업체;

-- 제품테이블에서 제조업체별로 제품의 개수와 가장 비싼 단가를 검색하자.(단, 제품수가 3개 이상)
select 제조업체, count(*) as 제품수, max(단가) as 최고가
from 제품테이블
GROUP by 제조업체 having count(*) >= 3;

-- 고객테이블에서 적립금 평균이 1000원 이상인 등급에 대해 등급별 고객수와 적립금 평균을 검색해보자
select 등급, count(*) as "등급별 고객 수", AVG(적립금) as "적립금 평균"
from 고객테이블
group by 등급 having avg(적립금) >= 1000;


-- orders 테이블에서 고객별로 주문한 도서의 총 수량과 총 판매액을 구하시오.
select custid, count(*) as "주문한 도서의 총 수량", sum(saleprice) as "총 판매액"
from orders
group by custid;

-- 가격이 8,000원 이상인 도서를 구매한 고객에 대하여 고객별 주문 도서의 총 수량을 구하시오.
select custid, count(*) as "주문한 도서의 총 수량"
from orders where saleprice>= 8000
group by custid order by custid;

-- 가격이 8,000원 이상인 도서를 구매한 고객에 대하여 고객별 주문 도서의 총 수량을 구하시오.
--(단, 두 권 이상 구매한 고객만 구한다.)
select custid, count(*) as "주문한 도서의 총 수량"
from orders where saleprice>= 8000
group by custid having count(*) >=2 order by custid;

-- orders 테이블에서 박지성의 총 구매액(박지성의 고객번호는 1번으로 놓고 작성)
select sum(saleprice)
from orders
where custid=1;

-- 박지성이 구매한 도서의 수 (박지성의 고객번호는 1번으로 놓고 작성)
    select count(*) from orders where custid = 1;
-- book 테이블에서의 도서의 총 개수
select count(*) from book;

-- book 테이블에서 출판사의 총 개수
    select count(DISTINCT publisher) from book;
commit;