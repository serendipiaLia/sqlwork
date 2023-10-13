-- ��¥�� �ð� �Լ�

-- ���� ��¥ ��� : SYSDATE
SELECT SYSDATE FROM dual; 

-- ���� ��¥�� �ð� : SYSTIMESTAMP
SELECT SYSTIMESTAMP FROM dual;

-- ���� ��¥ ���� ��ȯ
SELECT TO_CHAR(SYSDATE, 'YYYY') AS �⵵,
       TO_CHAR(SYSDATE, 'MM')AS ��,
       TO_CHAR(SYSDATE, 'DD')AS ��,
       TO_CHAR(SYSDATE, 'YYYY-MM-DD')AS today��¥
FROM dual;
-- �ð� ���� ��ȯ
SELECT TO_CHAR(SYSDATE, 'HH:MI:SS') AS �ð�����,
       TO_CHAR(SYSTIMESTAMP, 'YYYY/MM/DD_HH:MI:SS') AS ��¥�ͽð�
FROM dual;

-- ���糯¥���� 10������ ��¥ ���
SELECT SYSDATE -10 FROM dual;
    -- 10������ ��¥
    SELECT SYSDATE +10 FROM dual;

-- Ư����¥,TO_DATE()���� 10������ ��¥ ���
SELECT TO_DATE('2023-09-11') -10 FROM dual;
    -- 10�� ���� ��¥
SELECT TO_DATE('2023-09-11') +10 FROM dual;

-- ���� ���ϰ� ���� : ADD_MONTHS()
SELECT ADD_MONTHS(SYSDATE, 3)AS ��� FROM dual; -- 24/01/13
SELECT ADD_MONTHS(SYSDATE, -3)AS ��� FROM dual; -- 23/07/13
-- Ư���� ��¥(��)���� ����
SELECT ADD_MONTHS(TO_DATE('2023/5/1'), -3)AS ��� FROM dual; -- 23/02/01

-- ���� �� ����ϱ� : MONTHS_BETWEEN(������, ������)
    -- �� ���� �� �ݿø� : ROUND(����, �ڸ���) ���
SELECT 
    ROUND(MONTHS_BETWEEN(SYSDATE, TO_DATE('2023-1-31')),0) AS ��_����_��
FROM dual;
    
SELECT 
    ROUND(MONTHS_BETWEEN(TO_DATE('2023-12-31'), 
                         TO_DATE('2023-1-1')),0) AS ��_����_��
FROM dual;


-- orders ���̺��� ��¥ �ð��Լ� ���
 
-- ������ �ֹ��Ϸκ��� 10�� �� ������ Ȯ���Ѵ�. �� �ֹ��� Ȯ�����ڴ�?
SELECT orderid �ֹ���ȣ, orderdate �ֹ���,
    TO_DATE(orderdate) +10 Ȯ���� 
FROM orders; 

-- �ֹ��Ͽ� 3���� ���ϰ�, 1���� ����
SELECT orderid �ֹ���ȣ, orderdate �ֹ���,
    ADD_MONTHS(orderdate, 3) AS ������,
    ADD_MONTHS(orderdate, -1) AS �Ѵ���
FROM orders; 

    -- �ֹ���ȣ�� 6���� 10������ ���
    SELECT orderid �ֹ���ȣ, orderdate �ֹ���,
     ADD_MONTHS(orderdate, 3) AS ������,
     ADD_MONTHS(orderdate, -1) AS �Ѵ���
    FROM orders WHERE orderid BETWEEN 6 AND 10;
             -- WHERE orderid >= 6 AND orderid <=10;
             
-- �ֹ���ȣ�� 10�� ������ �ֹ��Ϸκ��� ���ñ����� �� �������� ���Ͻÿ�
SELECT orderid �ֹ���ȣ, orderdate �ֹ���,
    ROUND(MONTHS_BETWEEN(SYSDATE, orderdate)) ROUND_�Ѱ�����,
    FLOOR(MONTHS_BETWEEN(SYSDATE, orderdate)) FLOOR_�Ѱ�����,
    TRUNC(MONTHS_BETWEEN(SYSDATE, orderdate), 0) TRUNC_�Ѱ�����
FROM orders WHERE orderid = 10; 
  
-- <��ȯ �Լ�> : TO_NUMBER() -> ���ڸ� ���ڷ� ��ȯ
SELECT TO_NUMBER('320')FROM dual; 



