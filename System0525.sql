-- 일반 계정 만들기
CREATE USER c##ryuhyeji IDENTIFIED BY 1111;

-- 계정에 권한 부여 : GRANT
GRANT CONNECT, RESOURCE TO c##ryuhyeji;

-- 테이블 스페이스 권한 부여
ALTER USER c##ryuhyeji DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;

select *from tab;
desc help;
