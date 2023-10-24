-- <dept> ���̺�
CREATE TABLE dept (
    deptid NUMBER PRIMARY KEY,
    deptname VARCHAR2(20) NOT NULL, -- NULL ����
    location VARCHAR2(20) NOT NULL
);

-- �μ� �ڷ� �߰�
INSERT INTO dept(deptid, deptname, location)
VALUES (10, '������', '����');
INSERT INTO dept(deptid, deptname, location)
VALUES (20, '������', '��õ');
INSERT INTO dept(deptid, deptname, location)
VALUES (30, '��������', '����');

SELECT * FROM dept;

-- �μ��̸����� ��(deptname)�� ������ �̸� ���
-- ���ڿ��� �Ϻκ��� ���� : SUBSTR('���ڿ�', �ε���, �ڸ���)
-- Ư�� ���ڿ��� ã�� �ٲٱ� : REPLACE('���ڿ�',���� �� ����, ���� �� ����)
SELECT deptname AS �μ��̸�,
    LENGTH(deptname) AS ���ڼ�,
    SUBSTR(deptname, 1, LENGTH(deptname)-1) AS SUBSTR_����,
    REPLACE(deptname, '��', '') AS REPLACE_����
FROM dept;
