-- ���ο� �����(user) ���� : c##���
CREATE USER c##mydb IDENTIFIED BY pwmydb;

-- �������� ���� �� ���� ���� �ο� : GRANT CREATE
GRANT CREATE SESSION TO c##mydb; 
-- ���̺� �ڿ�(resource) ���� ���� �ο� : GRANT CREATE
GRANT CREATE TABLE, RESOURCE TO c##mydb;
--DBA(DatabaseAgent = Oracle)�� ����(����)�� ���� �ο�
GRANT CONNECT, DBA TO c##mydb;

