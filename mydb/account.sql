-- ���� ���� ���̺� ����
CREATE TABLE account (
    ano VARCHAR2(20) PRIMARY KEY,
    owner VARCHAR2(20) NOT NULL,
    balance NUMBER NOT NULL
);

INSERT INTO account VALUES ('11-11-111', '����', 10000);

-- �ڷ� ����(��, ���)
UPDATE account SET balance = 50000,
    owner = '�ڴ��'
WHERE ano = '33-33-333';

-- �ڷ� ����
DELETE FROM account
WHERE ano = '22-22-222';

COMMIT;
ROLLBACK;
SELECT * FROM account;



