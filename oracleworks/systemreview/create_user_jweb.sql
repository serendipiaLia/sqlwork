-- jweb user���� (db) : c##mydb

-- c##�� ������ �ʴ� ���
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

-- jweb user���� �����ϱ�
CREATE USER jweb IDENTIFIED BY pwjweb;

-- jweb���� �ο�, ���ҽ� ���� Ȯ��
GRANT CONNECT, RESOURCE, DBA TO jweb;


