-- department ���̺� ����
CREATE TABLE department(
     deptno VARCHAR2(4) PRIMARY KEY,
     deptname VARCHAR2(20) NOT NULL,
     office VARCHAR2(20) 
);

INSERT INTO department VALUES ('1000', '�λ���', '����');
INSERT INTO department VALUES ('1001', '������', '��õ');
INSERT INTO department VALUES ('1002', '������', '����');
INSERT INTO department(deptno, deptname) VALUES ('1003', '������');

-- employee ���̺� ����
CREATE TABLE employee ( 
    empno NUMBER(3) PRIMARY KEY,
    empname VARCHAR2(20) NOT NULL,
    sal NUMBER(10),
    createdate DATE DEFAULT SYSDATE,
    deptno VARCHAR2(4),
    FOREIGN KEY(deptno) REFERENCES department(deptno) -- �ܷ�Ű
);

INSERT INTO employee VALUES (100, '�̰���', 2500000, SYSDATE, '1000'); 
INSERT INTO employee VALUES (101, '���', 2000000, SYSDATE, '1001'); 
INSERT INTO employee VALUES (102, '�ڴ�', 3000000, SYSDATE, '1002'); 
INSERT INTO employee VALUES (103, '���¾�', 3500000, SYSDATE, '1000'); 
INSERT INTO employee VALUES (104, '�ֿ���', 5000000, SYSDATE, '1001'); 
INSERT INTO employee VALUES (105, '�쿵��', 4000000, SYSDATE, '1002'); 

COMMIT;
SELECT * FROM department;
SELECT * FROM employee;

-- �μ��� �޿� �Ѿ��� ���Ͻÿ�
SELECT deptno, SUM(sal) �޿�_��_�� FROM employee e
GROUP BY deptno;

-- �μ� �̸��� �μ��� �޿� �Ѿ��� ���Ͻÿ�
-- �μ��̸� department TABLE, �޿� employee TABLE -> ���� ���� ��� ���!
SELECT d.deptno, d.deptname, SUM(e.sal) �޿�_��_�� 
FROM department d, employee e
WHERE d.deptno = e.deptno
GROUP BY d.deptno, d.deptname;

-- 1002�� �������� �ѹ������� �ٲٱ�
UPDATE department SET deptname = '�ѹ���'
WHERE deptno = '1002';

-- 103�� '���¾�'����� �޿��� 3000000������ �����ϱ�
UPDATE employee SET sal = '3000000'
WHERE empno = 103;

-- SUM(�����հ��� Į����) OVER(ORDER BY ������ Į����) : ���� �հ�
-- Į������ �ҹ��ڷ� ǥ��� ""�� ����
SELECT empno, empname, sal, SUM(sal) OVER(ORDER BY empno) "sal_sumover"
FROM employee;

-- ���� RANK()OVER(ORDER BY �������� Į����) �Լ�
SELECT empno, empname, sal, SUM(sal) OVER(ORDER BY empno) "sal_sumover",
RANK()OVER(ORDER BY sal) SAL_RANK 
FROM employee;
    -- �ߺ��� ���� ������ ���� �ο���, ���� ���� �ο� DENSE_RANK()OVER()
    SELECT empno, empname, sal, 
    RANK()OVER(ORDER BY sal DESC) SAL_RANK,
    DENSE_RANK() OVER (ORDER BY sal DESC)
    FROM employee;

-- ROLLUP(Į��1, Į��2) : GROUP BY������ �Ұ�, �Ѱ踦 ����
select a.deptno, a.deptname, sum(b.sal) from department a, employee b
where a.deptno = b.deptno
group by ROLLUP(a.deptno, a.deptname);

-- CUBE(Į��1, Į��2) : GROUP BY ������ ��� �Ұ�, �Ѱ踦 ��ü������ ����
select a.deptno, a.deptname, sum(b.sal) from department a, employee b
where a.deptno = b.deptno
group by CUBE(a.deptno, a.deptname)
ORDER BY a.deptno;




