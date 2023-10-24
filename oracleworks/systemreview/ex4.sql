-- ex4 ���̺� ����

CREATE TABLE ex4(
    id VARCHAR2(10) PRIMARY KEY, -- �⺻Ű ��������
    password VARCHAR2(10) NOT NULL
);

INSERT INTO ex4 VALUES ('sky2003', 'PW1234');
INSERT INTO ex4 VALUES ('sky2003', 'PW5678'); -- ���Ἲ �������� ���� - ���� �Ұ�
INSERT INTO ex4 VALUES ('today1006' , 'PW9000', 25); 
INSERT INTO ex4 (id, password) VALUES ('today321' , 'pw3456');
-- �ڷ����� ũ��(10)���� ū ������(11�� - pw345678910)�Է� �Ұ� 
INSERT INTO ex4 (id, password, age) VALUES ('today321' , 'pw345678910', 23);
-- �ϱ⿡�� �ڷ��� ũ��(12)������ ���
INSERT INTO ex4 (id, password, age) VALUES ('today1010' , 'pw789101234', 24); 


COMMIT;

-- ����(age) Į�� �߰�
ALTER TABLE ex4 ADD age NUMBER(3);

-- �ڷ����� ũ�� ����(Varchar2 10 -> 12)
ALTER TABLE ex4 MODIFY password VARCHAR2(12);

SELECT * FROM ex4;

