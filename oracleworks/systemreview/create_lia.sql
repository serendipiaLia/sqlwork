-- ���ο� user ���� : lia (������̸�)
CREATE USER c##lia IDENTIFIED BY pw990618;

-- �� �̸��� SESSION ���� �ο�(grant)
GRANT CREATE SESSION TO c##lia;

-- LIA�� info table ���� �ο�
GRANT CREATE TABLE, RESOURCE TO c##lia;

-- table�� �ִ� DB ����, ��ȸ,���� ���� �ο� (DBA database administorator)
GRANT CONNECT, DBA TO c##lia;