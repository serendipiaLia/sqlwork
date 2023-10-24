-- �μ��� ��� ���̺� ����
CREATE TABLE department (
    deptid NUMBER PRIMARY KEY,
    deptname VARCHAR2(20) NOT NULL, -- NULL ����
    location VARCHAR2(20) NOT NULL
);

-- �μ� �ڷ� �߰�
INSERT INTO department(deptid, deptname, location)
VALUES (10, '������', '����');
INSERT INTO department(deptid, deptname, location)
VALUES (20, '������', '��õ');
INSERT INTO department(deptid, deptname, location)
VALUES (30, '��������', '����');

COMMIT;

-- �ڷ� �˻�
SELECT deptid, deptname FROM department;

-- ��� Į�� �˻�('*' ���)
SELECT * FROM department;

-- Ư���� ������ (�� : �ο�) �˻� - WHERE ���ǹ� ���
-- �μ� �̸��� �������� row(���ڵ�)�˻�
SELECT * FROM department
WHERE deptname = '������';

-- �ڷ� ���� (�μ��̸� ���� ������ -> �濵��)
UPDATE department SET deptname = '�濵��'
WHERE deptid = 20;

ROLLBACK; -- COMMIT ������ �����ϸ� ��ҵ� (COMMIT�� ���󺹱�)

-- �ڷ� ���� (�μ� ��ȣ�� 30���� �������� ����)
-- ���� �̻� (�ڽ��� �����ϰ� �����Ƿ�, �μ���ȣ 10 ���� �ȵ�)
DELETE FROM department
WHERE deptid = 10;

COMMIT;

DROP TABLE DEPARTMENT;