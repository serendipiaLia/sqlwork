-- ���� ���� �Լ�  
-- DECODE(Į����, ���ǽ�, ���� ��, ������ ��) 
-- ������ �����̸� 'M', ���ڸ� 'F'�� ���
SELECT ename ����̸�, gender ����, 
    DECODE(gender, '����', 'M', 'F') gender
FROM emp; 

-- ���� ���� (if ~ else�� ����)
/*
    CASE
        WHEN ����1 THEN ���1
        WHEN ����2 THEN ���2
        ELSE ���3
    END Į����
*/
SELECT ename �����ȣ, gender ����,
    CASE
        WHEN gender = '����' THEN 'M'
        ELSE 'F'
    END gender
FROM emp;

SELECT * FROM emp;
-- > �޿��� ���� ���� ǥ��
-- �޿��� 350���� �̻��̸� ������ '����'���� ǥ���ϰ�
-- �޿��� 250���� �̻��̸� ������ '�븮'�� ǥ���ϰ�
-- �������� '���'���� ǥ��
SELECT ename, salary,
       CASE
           WHEN salary >= 3500000 THEN '����'     
           WHEN salary >= 2500000 AND salary < 3000000 THEN '�븮' 
           ELSE '���'          -- AND salary < 3000000 ��������!
       END
FROM emp;

-- salary�� ����
SELECT COUNT(salary)
FROM emp;

-- null���� 0�� ǥ�� : ����x, ������������ ��½� ���� NVL�� ������
-- NVL(�μ�1, �μ�2) : �μ�1�� null�� �ƴϸ� �μ�1 ���, �μ�1�� null�̸� �μ�2 ���
SELECT ename �����,
    NVL(salary, 0) �޿�
FROM emp;


-- > �ǽ� ���̺� ����
CREATE TABLE K1 (
    ID VARCHAR2(3),
    CNT NUMBER(2)
);

INSERT INTO K1 VALUES('��', 5);
INSERT INTO K1 VALUES('��', NULL);
INSERT INTO K1 VALUES('��', 5);
INSERT INTO K1 VALUES('��', NULL);
INSERT INTO K1 VALUES('��', 10);

COMMIT;

SELECT * FROM K1; 
SELECT NVL(CNT, 0) FROM K1;

-- ���� ���ϱ� (�׳� ī��Ʈ �Ѱ�, NVLó���ϰ� ī��Ʈ�Ѱ� ��)
SELECT COUNT(CNT) FROM K1; -- 3
SELECT COUNT(NVL(CNT, 0)) FROM K1; -- 5

-- ��� ���ϱ�
SELECT ROUND((SUM(CNT) / COUNT(CNT)), 1)FROM K1; -- 6.7
SELECT SUM(CNT) / COUNT(NVL(CNT,0)) FROM K1; --4

-- �ּҰ� ���ϱ�
SELECT MIN(NVL(CNT, 5)) FROM K1; -- 5


