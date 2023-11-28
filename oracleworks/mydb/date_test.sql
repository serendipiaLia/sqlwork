-- ��¥ Į��
-- 1. creat_date DATE DEFAULT SYSDATE (���� ��¥�� �ð�)
-- 2. hire_date DATE (Ư����¥)

-- ���� ��¥
SELECT SYSDATE  FROM dual;

-- ���� ��¥�� �ð�
SELECT SYSTIMESTAMP FROM dual;

-- 20������ ��¥ ���
SELECT SYSDATE -20 FROM dual;

-- Ư����¥���� 20�� ���� ��¥ ���
SELECT TO_DATE('2023-10-25') -20 FROM dual;

-- ������ �ֹ� Ȯ������
SELECT orderid �ֹ���ȣ,
       orderdate �ֹ���,
       To_date(orderdate) +10 Ȯ����
FROM orders;

----test1-------------------
CREATE TABLE date_test1(
    reg_date DATE,
    hire_date DATE
);

-- �߰�1
INSERT INTO date_test1 VALUES(SYSDATE, '2023-11-01');
INSERT INTO date_test1 VALUES(SYSDATE, to_date('2023-11-01'));

SELECT * FROM date_test1;
DROP TABLE date_test;

--test2 : �ڹ� Ŭ������ ���� �� ��� -----------------------------
CREATE TABLE date_test2(
    reg_date DATE,
    hire_date DATE
);
-- �߰�2
INSERT INTO date_test2(hire_date) VALUES('2023-11-01');
INSERT INTO date_test2(hire_date) VALUES(To_date ('2023-11-01'));

SELECT * FROM date_test2;