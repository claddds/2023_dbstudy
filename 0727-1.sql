-- 데이터베이스 확인
-- SHOW DATABASES;

-- 데이터 베이스 생성
-- CREATE DATABASE ictedu;

-- 계정 생성
-- CREATE USER 'rhj'@'%' IDENTIFIED BY '1111';
-- CREATE USER '아이디'@'localhost' IDENTIFIED BY '비밀번호';

-- 사용자 계정 권한 주기 
GRANT ALL PRIVILEGES ON ictedu.* TO 'rhj'@'%';
-- GRANT ALL PRIVILEGES ON 데이터베이스.* TO '아이디'@'localhost';

-- flush privileges;members