-- �ڹ� ������Ʈ�� ������ users(ȸ��) ���̺� ���� 
CREATE TABLE users(
    userid VARCHAR2(20) PRIMARY KEY,
    username VARCHAR2(30) NOT NULL, 
    userpassword VARCHAR2(20) NOT NULL,
    userage NUMBER(3) NOT NULL,
    useremail VARCHAR2(50) NOT NULL
);

-- ȸ�� �߰�
INSERT INTO users
VALUES ('today', '�̰���', '12345', '25', 'todat@korea.kr');

COMMIT;

SELECT * FROM users;

SELECT * FROM users WHERE userid = 'today';