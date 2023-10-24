--  ���� ���̺��� �����Ͽ� EMPNO, EMPNAME, DEPTNO, DEPTNAME �÷��� 
-- ANSI �������� ��ȸ

-- 1. ������ ����(10��) �� 2. �ش� ������ �߻��� ����(20��) �� ���� ���� ���
-- 3. �ذ��� �� �ִ� ��ġ����(20��), 4. ��ġ������ ����� ANSI ����(20��),
-- 5. ����Ŭ ���� �������� ����(30��) �Ͽ� ��ġ���� ���� ���

CREATE TABLE department (
    deptcode NUMBER, --
    deptname VARCHAR2(10)
);
INSERT INTO department VALUES (1, '�λ�');
INSERT INTO department VALUES (2, '����');
INSERT INTO department VALUES (3, '�ѹ�');

select *from department;

CREATE TABLE employee(
    empno NUMBER,
    empname VARCHAR2(10),
    deptno NUMBER --
);
INSERT INTO employee VALUES(101, 'lee' , 1);
INSERT INTO employee VALUES(102, 'rim' , 2);
INSERT INTO employee VALUES(103, 'seo', 2);
INSERT INTO employee VALUES(104, 'kang', 3);


-- ������ ���� ����
SELECT empno, empname, deptno, deptname FROM employee
JOIN department USING(deptno);

-- �������� 
SELECT a.empno, a,.empname, a.deptno, b.deptname 
FROM employee a, department b
WHERE a.deptno = b.deptcode;

-- ��������
SELECT a.empno, a.empname, a.deptno, b.deptname 
FROM employee a JOIN department b
ON a.deptno = b.deptcode;


-- ���� ��Ȳ
-- ORA-00904: "DEPARTMENT"."DEPTNO": invalid identifier