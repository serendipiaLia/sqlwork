-- ex4 ���̺� ����

CREATE TABLE ex4(
    id VARCHAR2(10) PRIMARY KEY, -- �⺻Ű ��������
    password VARCHAR2(10) NOT NULL
);

INSERT INTO ex4 VALUES ('sky2003', 'PW1234');
INSERT INTO ex4 VALUES ('sky2003', 'PW5678'); -- ���Ἲ �������� ����
INSERT INTO ex4 VALUES ('today1006' , 'PW9000', 25); 

COMMIT;

-- ����(age) Į�� �߰�
ALTER TABLE ex4 ADD age NUMBER(3);

SELECT * FROM ex4;

