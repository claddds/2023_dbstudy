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

