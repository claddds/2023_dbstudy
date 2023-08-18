create table guestbook2(
    idx INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    subject VARCHAR(50),
    content VARCHAR(4000),
    email VARCHAR(50),
    pwd VARCHAR(50),
	 f_name VARCHAR(50),
    regdate TIMESTAMP
  );