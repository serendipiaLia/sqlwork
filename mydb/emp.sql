-- emp ���̺�
CREATE TABLE emp(
    empno NUMBER(3) PRIMARY KEY, -- �����ȣ
    ename VARCHAR2(20) NOT NULL,  -- ����̸�   
    gender VARCHAR2(6) NOT NULL, -- ����
    salary NUMBER(10), -- �޿�
    hire_date VARCHAR2(20) NOT NULL -- �Ի���
);

-- �ڷ� ����
INSERT INTO emp VALUES (100, '�̰�', '����', 3000000, '2019-01-01');
INSERT INTO emp VALUES (101, '���', '����', 2500000, '2020-05-15');
INSERT INTO emp VALUES (102, '�����', '����', 5000000, '2015-02-22');
INSERT INTO emp VALUES (103, '�ڽ���', '����', null, '2023-10-01');

COMMIT;

SELECT * FROM emp;

-- <�ǽ� ���� Ǯ��>

-- Q : ��� ���̺��� ����(�˻�, ����, ����)�Ͻÿ�.

-- 1. ����� �Ի��� ������ ����(ASC)
SELECT * FROM emp 
ORDER BY hire_date ASC;
    --DESC
    SELECT * FROM emp 
    ORDER BY hire_date DESC;

-- 2. ����� �޿� ������ ����(ASC)
SELECT * FROM emp
ORDER BY salary;
    --DESC
    SELECT * FROM emp
    ORDER BY salary DESC;

-- 3. �޿��� 300���� ������ ����� �޿��� ���� ������ ����
SELECT * FROM emp
WHERE salary <= 3000000
ORDER BY salary DESC;

-- 4. �޿��� ���� ��� �˻�
SELECT * FROM emp 
WHERE salary IS NULL;

-- 5. ����� �� ���� ���Ͻÿ�
SELECT COUNT(*) AS ����� FROM emp; 

-- 6. ����� �޿� �հ�� ���
SELECT SUM(salary) AS �޿��հ�, AVG(salary) AS ��� FROM emp;

-- 7. �̸��� ����� ����� ������ ���ڷ� ����
UPDATE emp SET gender = '����'
WHERE ename = '���';

-- 8. �̸��� ������� ����� ����
DELETE FROM emp
WHERE ename = '�����';

ROLLBACK;
COMMIT;
SELECT * FROM emp;


-- �ݿø� : ROUND(����, �ڸ���)
SELECT ename ����̸�,
       salary �޿�,
       salary/30 �ϱ�,
       ROUND(salary/30, 1) ���1,
       ROUND(salary/30, 0) ���2,
       ROUND(salary/30, -1) ���3       
FROM emp;
