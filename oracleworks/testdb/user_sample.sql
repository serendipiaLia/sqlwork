-- ������ ������ �ƴ϶� ���� DB�� ����
DROP USER c##sample CASCADE;
DROP USER c##sample; -- table������ ������ ����, table������ ����!

-- ���ο� user �����
CREATE USER c##sample IDENTIFIED BY pw1234;

-- SESSION ���� �ο�
GRANT CREATE SESSION TO c##sample;
