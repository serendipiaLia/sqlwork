-- ROLLUP(), CUBE(), GROUPING SETS()
CREATE TABLE table_dept(
    dept_no VARCHAR2(3),
    job_name VARCHAR2(30),
    salary NUMBER
);

INSERT INTO table_dept VALUES('100', '���ǻ�', 3300000);
INSERT INTO table_dept VALUES('100', '������', 4300000);
INSERT INTO table_dept VALUES('100', '������', 2500000);
INSERT INTO table_dept VALUES('200', '���ǻ�', 5000000);
INSERT INTO table_dept VALUES('200', '�����ͺм���', 4000000);
INSERT INTO table_dept VALUES('200', '������', 6000000);

COMMIT;

SELECT * FROM table_dept;

-- �μ� ��ü�� �ο����� �޿� �հ�
SELECT COUNT(*) "��ü �ο���", SUM(salary) "�޿� �հ�(��)" FROM table_dept;

-- �μ���(dept_no) �ο��� �� �޿� �հ�
SELECT dept_no, COUNT(*) "��ü �ο���", SUM(salary) "�޿� �հ�(��)" FROM table_dept
GROUP BY dept_no;

-- �μ���(dept_no), �����̸���(job_name) �ο��� �� �޿� �հ�
SELECT dept_no, job_name, COUNT(*) "��ü �ο���", SUM(salary) "�޿� �հ�(��)" FROM table_dept
GROUP BY dept_no, job_name;

-- �μ���, ���� �̸��� �ο��� �� �޿� �հ� (+ �Ұ�, �Ѱ�) ROLLUP���
SELECT dept_no, job_name, COUNT(*) "��ü �ο���", SUM(salary) "�޿� �հ�(��)" FROM table_dept
GROUP BY ROLLUP(dept_no, job_name);

-- CUBE ���
SELECT dept_no, job_name, COUNT(*) "��ü �ο���", SUM(salary) "�޿� �հ�(��)" FROM table_dept
GROUP BY CUBE(dept_no, job_name) ORDER BY dept_no; 

-- GROUPING SETS ��� (group�� �Ұ�, �Ѱ� ���� ����, ��ü �Ѱ� �ȳ���)
SELECT dept_no, job_name, COUNT(*) "��ü �ο���", SUM(salary) "�޿� �հ�(��)" FROM table_dept
GROUP BY GROUPING SETS(dept_no, job_name) ORDER BY dept_no; 
