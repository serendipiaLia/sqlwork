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