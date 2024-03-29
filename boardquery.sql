-- CREATE sequence board_seq
-- increment BY 1
-- START WITH 1
-- nocycle

-- CREATE sequence group_seq
-- increment BY 1
-- START WITH 1
-- nocycle

-- AUTO_INCREMENT는 하나만 가능
-- groups 도 자동 증가해야 된다.

CREATE TABLE board(
 idx INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 writer VARCHAR(60) NOT NULL,
 title VARCHAR(60) NOT NULL,
 content LONGTEXT NOT NULL,
 pwd  CHAR(60) NOT NULL,
 hit INT NOT NULL,
 groups INT NOT NULL,
 step INT NOT NULL,
 lev INT NOT NULL,
 regdate TIMESTAMP NOT NULL,
 f_name VARCHAR(150)
);

SELECT LAST_INSERT_ID();