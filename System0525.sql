-- �Ϲ� ���� �����
CREATE USER c##ryuhyeji IDENTIFIED BY 1111;

-- ������ ���� �ο� : GRANT
GRANT CONNECT, RESOURCE TO c##ryuhyeji;

-- ���̺� �����̽� ���� �ο�
ALTER USER c##ryuhyeji DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;

select *from tab;
desc help;
