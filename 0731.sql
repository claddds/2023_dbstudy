CREATE TABLE guestbook(
idx int PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50),
subject VARCHAR(50),
content VARCHAR(4000),
email VARCHAR(50),
pwd VARCHAR(50),
regdate date 
); 

COMMIT;

DROP TABLE guestbook;

create table guestbook(
    idx INT not null PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    subject VARCHAR(50),
    content VARCHAR(4000),
    email VARCHAR(50),
    pwd VARCHAR(50), 
    regdate TIMESTAMP
  );
insert into guestbook(NAME, SUBJECT, content, email, pwd, regdate)
values('홍길동', '첫번째연습','첫번째연습 내용~~~','hong@nave.com','1111',SYSDATE());