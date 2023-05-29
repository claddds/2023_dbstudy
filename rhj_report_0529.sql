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
VALUES(1,'박지성','영국 맨체스타', '000-5000-0001');
insert into customer
VALUES(2,'김연아','대한민국 서울', '000-6000-0001');
insert into customer
VALUES(3,'장미란','대한민국 강원도', '000-7000-0001');
insert into customer
VALUES(4,'추신수','미국 클리블랜드', '000-8000-0001');
insert into customer
VALUES(5,'박세리','대한민국 대전');
insert into customer
VALUES(5,'박세리','대한민국 대전',null);

insert into book
VALUES(1,'축구의 역사', '굿스포츠', 7000);
insert into book
VALUES(2,'축구아는 여자', '나무수', 13000);
insert into book
VALUES(3,'축구의 이해', '대한미디어', 22000);
insert into book
VALUES(4,'골프 바이블', '대한미디어', 35000);
insert into book
VALUES(5,'피겨 교본', '굿스포츠', 8000);
insert into book
VALUES(6,'역도 단계별기술', '굿스포츠', 6000);
insert into book
VALUES(7,'야구의 추억', '이상미디어', 20000);
insert into book
VALUES(8,'야구를 부탁해', '이상미디어', 13000);
insert into book
VALUES(9,'올림픽 이야기', '삼성당', 7500);
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

-- 1.모든 도서의 이름과 가격을 검색하시오.
    select bookname, price from book;

-- 2.모든 도서의 가격과 이름을 검색하시오.
    select price, bookname from book;
    
-- 3.모든 도서의 도서번호,  도서이름, 출판사, 가격을 검색하시오.
    select * from book;
    
-- 4.도서 테이블에 있는 모든 출판사를 검색하시오.
    select publisher from book;
    
-- 5.도서 테이블에 있는 모든 출판사를 검색하시오.(중복제거)
    select distinct publisher from book;
    
-- 6.가격이 10,000원 이상 20,000 이하인 도서를 검색하시오.
    select * from book where price between 10000 and 20000;
    
-- 7.출판사가 ‘굿스포츠’ 혹은 ‘대한미디어’인 도서를 검색하시오.
    select * from book where publisher in ('굿스포츠', '대한미디어');
    
-- 8.'축구의 역사’를 출간한 출판사를 검색하시오.
    select publisher from book where bookname = '축구의 역사';
    
-- 9.도서이름에 ‘축구’가 포함된 출판사를 검색하시오.
    select publisher from book where bookname like '%축구%';
    
-- 10.도서이름의 왼쪽 두 번째 위치에 ‘구’라는 문자열을 갖는 도서를 검색하시오
    select * from book where bookname like '_구%';
    
-- 11.축구에 관한 도서 중 가격이 20,000원 이상인 도서를 검색하시오.
    select * from book where bookname like '%축구%' and price >= 20000;
    
-- 12.도서를 이름순으로 검색하시오.
    select * from book order by bookname;
    
-- 13.도서를 가격순으로 검색하고, 가격이 같으면 이름순으로 검색하시오.
    select * from book order by price, bookname;
    
-- 14.도서를 가격의 내림차순으로 검색하시오. 만약 가격이 같다면 출판사의 오름차순으로 검색한다.
    select * from book order by price desc, publisher;
    
-- 15. 도서번호가 1인 도서의 이름
    select bookname from book where bookid = 1;
    
-- 16. 가격이 20000원 이상인 도서의 이름
    select bookname from book where price >= 20000;
    
-- 17. 모든 고객의 이름 ,주소
    select name,address from customer;
    
-- 18. 2014년 7월 4일 ~ 7월 7일 사이에 주문받은 도서의 주문번호
    select orderid from orders where orderdate between '2014-07-04' and '2014-07-07';
    
-- 19. 2014년 7월 5일 ~ 7월 7일 사이에 주문받은 도서를 제외한 도서의 주문 번호
     select orderid from orders where orderdate < '2014-07-05' or orderdate > '2014-07-07';
     
-- 20. 성이 '김'씨인 고객의 이름과 주소
    select name, address from customer where name like '김%';
    
-- 21. 성이 '김'씨이고 이름이 '아'로 끝나는 고객의 이름과 주소
    select name, address from customer where name like '김%아'; 