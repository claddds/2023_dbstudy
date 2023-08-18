CREATE TABLE members(
  m_idx INT  NOT NULL PRIMARY KEY AUTO_INCREMENT,
  m_id  CHAR(60),
  m_pw  CHAR(60),
  m_name CHAR(60),
  m_age  int,
  m_reg TIMESTAMP
); 
insert into members(m_id, m_pw, m_name, m_age, m_reg) 
values('hong', 'h111', '홍길동', 24, SYSDATE());
insert into members(m_id, m_pw, m_name, m_age, m_reg) 
values('park', 'p111', '박길동', 14, SYSDATE());
insert into members(m_id, m_pw, m_name, m_age, m_reg) 
values('goh', 'g111', '고길동', 21, SYSDATE());
insert into members(m_id, m_pw, m_name, m_age, m_reg) 
values('kim', 'k111', '김길동', 29, SYSDATE());
insert into members(m_id, m_pw, m_name, m_age, m_reg) 
values('lee', 'l111', '이길동', 29, SYSDATE());

create table guestbook(
    idx INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    NAME CHAR(60),
    SUBJECT  CHAR(60),
    content LONGTEXT,
    email CHAR(60),
    pwd CHAR(60), 
    regdate TIMESTAMP
);

insert into guestbook(NAME, SUBJECT, content, email, pwd, regdate) 
values('홍길동', '첫번째연습','첫번째연습 내용~~~','hong@nave.com','1111',SYSDATE());

create table guestbook2(
    idx int not NULL PRIMARY KEY AUTO_INCREMENT,
    name varchar(50),
    subject varchar(50),
    content longtext,
    email varchar(50),
    pwd varchar(50), 
    f_name varchar(50),
    regdate TIMESTAMP
  );

CREATE TABLE bbs_t(
        b_idx     int not null PRIMARY KEY AUTO_INCREMENT,
        subject VARCHAR(60),
        writer    VARCHAR(60),
        content longtext,
        f_name VARCHAR(60),
        pwd      CHAR(60),
        write_date TIMESTAMP,
        hit       INT,
        STATUS  int
     );

   CREATE TABLE comment_t(
        c_idx     INT not null PRIMARY KEY AUTO_INCREMENT,
        writer     VARCHAR(20),
        content  longtext,
        write_date TIMESTAMP,
        b_idx       INT,
       CONSTRAINT comm_t_fk FOREIGN KEY (b_idx) REFERENCES bbs_t(b_idx)
   );