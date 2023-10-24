-- ������ ���̺�
CREATE TABLE entertainers (
    name VARCHAR2(30),
    birthday VARCHAR2(20),
    job VARCHAR2(30)
);

INSERT INTO entertainers VALUES ('�絿��', '1979-06-01', '���, ����');
INSERT INTO entertainers VALUES ('������', '1992-09-04', '���');
INSERT INTO entertainers VALUES ('�����', '1982-02-20', '����, �۰�');

SELECT * FROM entertainers;

-- �� 1 ����ȭ ���
-- �Ӽ� ���� ���� ���̾�� ��
-- ������ ������ �������� �˻�
SELECT * FROM entertainers
WHERE job = '%����%';  

-- ������ ���̺�, ���� ���̺�� ����
CREATE TABLE entertainer(
    name VARCHAR2(20),
    birthday VARCHAR2(20)
);

INSERT INTO entertainer VALUES ('�絿��', '1979-06-01');
INSERT INTO entertainer VALUES ('������', '1992-09-04');
INSERT INTO entertainer VALUES ('�����', '1982-02-20');
--------------
CREATE TABLE job(
    ename VARCHAR2(20),
    jobname VARCHAR2(30)
);

INSERT INTO job VALUES ('�絿��', '���');
INSERT INTO job VALUES ('�絿��', '����');
INSERT INTO job VALUES ('������', '���');
INSERT INTO job VALUES ('�����', '����');
INSERT INTO job VALUES ('�����', '�۰�');

SELECT * FROM entertainer;
SELECT * FROM job;

-- �������� �̸��� �������, ���������� �˻�
    -- ��������
    SELECT a.name, a.birthday, b.jobname
    FROM entertainer a, job b
    WHERE a.name = b.ename;
    
    -- ��������(INNER JOIN) = ANSI
    SELECT a.name, a.birthday, b.jobname
    FROM entertainer a JOIN job b
    ON a.name = b.ename;
    
    



