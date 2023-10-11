-- ��� ���̺� ����
CREATE TABLE employee ( 
    empid NUMBER(3),
    empname VARCHAR2(20) NOT NULL,
    age NUMBER(3),
    deptid NUMBER,
    PRIMARY KEY(empid), -- �⺻Ű
    FOREIGN KEY(deptid) REFERENCES department(deptid) -- �ܷ�Ű
);

-- ��� �ڷ� �߰�
INSERT INTO employee (empid, empname, age, deptid)
VALUES (101,'�̰���', 27, 10);
INSERT INTO employee(empid, empname, age, deptid)
VALUES (102, '�����', 31, 10); -- �μ� �ڵ尡 ��� �ܷ�Ű ���� (department���� 30����)
INSERT INTO employee(empid, empname, deptid) -- age����
VALUES (103, '���쿵', 20);
INSERT INTO employee(empid, empname, age, deptid)
VALUES (104, '������', 21, 20);

-- ����� ��� ���� ���
SELECT * FROM employee;

-- ��� �̸��� ���� Į�� ���
SELECT empname, age FROM employee;

-- ��� �̸��� '�����'�� ������ ���
SELECT * FROM employee
WHERE empname = '�����';

-- ���̰� 30�̻��� ����� �˻�
SELECT * FROM employee
WHERE age > 30;

-- �μ���ȣ�� 20�� ��� �˻�
SELECT * FROM employee
WHERE deptid = 20;

-- ���̰� �Էµ��� ���� ��� �˻�
SELECT * FROM employee
WHERE age IS NULL;

-- ���ڿ� �˻�(����̸����� '��'�� �����ϰų�(OR), ���̰� �Էµ��� ���� ��� �˻�)
-- A OR B : A�����ϰų� B���� / A AND B : A�� B ��� ���� 
SELECT * FROM employee
WHERE empname LIKE '%��%' OR age is NULL;

COMMIT;

DROP TABLE EMPLOYEE;