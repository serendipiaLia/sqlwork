-- <���� Ÿ��> ���� �Լ�
-- ���� ���̺� : dual

-- ���밪 ���ϱ� : ABS()
SELECT ABS(-10) FROM dual; -- 10

-- �ݿø� : ROUND(����, �ڸ���)
SELECT ROUND(127.67, 1)FROM dual; -- �Ҽ� ù° �ڸ��� �ݿø� / 127.7
SELECT ROUND(127.67, 0)FROM dual; -- 0���ڸ� = ���� / 128
SELECT ROUND(127.67, -1)FROM dual; -- ���� �ڸ��� �ݿø� / 130
SELECT ROUND(127.67, -2)FROM dual; -- ���� �ڸ��� �ݿø� / 100

-- ����(����): TRUNC(����, �ڸ���)
SELECT TRUNC(127.67, 1)FROM dual; --- �Ҽ�ù° �ڸ����� ǥ��(���� ����) / 127.6
SELECT TRUNC(127.67, 0)FROM dual; -- 127
SELECT TRUNC(127.67, -1)FROM dual; -- 120
SELECT TRUNC(127.67, -2)FROM dual; -- 100

-- ������ ����(�Ҽ� ����) : FLOOR(�Ǽ�)
SELECT FLOOR(127.67)FROM dual; -- 127
SELECT FLOOR(127.6)FROM dual; -- 127

-- �ŵ����� : POWER(��, ����)
SELECT POWER(2, 3)FROM dual; -- 8


-- <���� Ÿ��>
-- ���� ���̺� : dual

-- ���� �ҹ��ڷ� �����ϱ� : LOWER('����')
SELECT LOWER('ABCD')FROM dual; -- abcd
-- ���� �빮�ڷ� �����ϱ� : UPPER('����')
SELECT UPPER('abcd')FROM dual; -- ABCD

-- ���ڿ��� �Ϻκ��� ���� : SUBSTR('���ڿ�', �ε���, �ڸ���)
SELECT SUBSTR('ABCD', 1, 2)FROM dual; -- AB

-- Ư�� ���ڿ��� ã�� �ٲٱ� : REPLACE('���ڿ�',���� �� ����, ���� �� ����)
SELECT REPLACE('ABCD', 'C', 'E')FROM dual; -- ABED

-- ���ڿ��� ���� ���ϱ� : LENGTH('���ڿ�')
SELECT LENGTH('ABCD')FROM dual; -- 4

-- Ư�����ڷ� �ڸ� ä���(ex.�ֹι�ȣ ����ŷ) : 
    -- ���ʺ��� ä��� : LPAD('���ڿ�',Ư���������Ա���, Ư������)
SELECT LPAD ('today', 10, '*')FROM dual; -- *****today
    -- �����ʺ��� ä��� : RPAD('���ڿ�',Ư���������Ա���, Ư������)
SELECT RPAD ('apple', 10, '*')FROM dual; -- apple*****


-- <orders�ֹ����̺�>

--���� ��� �ֹ� �ݾ��� 100�� ������ �ݿø�
SELECT custid AS ����ȣ,
    SUM(saleprice)AS �հ�ݾ�, 
    COUNT(saleprice)AS �ֹ��Ǽ�,
    ROUND(AVG(saleprice), -2) AS ����ֹ��ݾ� 
FROM orders
GROUP BY custid;

-- <book ���̺�>

-- å ������ ���� �� LENGTH(bookname)
-- å ������ ����Ʈ �� LENGTHB(bookname) �ѱ�:3byte, ����/Ư������:1byte
SELECT bookname AS å����, 
    LENGTH(bookname)AS ���ڼ�,
    LENGTHB(bookname) AS ����Ʈ��
FROM book;

-- '�౸'�� '��'�� �����Ͽ� �˻�
SELECT bookname AS å_����,
    REPLACE(bookname, '�౸', '��')AS ����_��_å����
FROM book;

-- <customer ���̺�>

-- �� �̸��� ���� ���� ���� ���� �ο����� ���Ͻÿ�.
SELECT SUBSTR(name, 1, 1)AS ��,
    COUNT(*) AS �ο�
FROM customer
GROUP BY SUBSTR(name, 1, 1);