-- test ���̺� ����
CREATE TABLE test (
    action VARCHAR2(1000)
);

INSERT INTO test VALUES ('���� �� ���� �ο��� �����մϴ�.');

SELECT * FROM test;

DROP TABLE test;
COMMIT;