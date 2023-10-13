-- DB�ڷᰡ ����Ǿ� ������, �ش� �ڷ������� �ƴϿ��� ��𼭵� �˻� ���� !!
SELECT * FROM orders;
SELECT * FROM customer;

-- �ֹ� ���̺��� Į��, �ڷ��� ����
DESC orders;

-- ��� �Լ� : ����(COUNT), �հ�(SUM), ���(AVG), �ִ밪(MAX), �ּҰ�(MIN)
    -- COUNT(*) : '*' ��� Į�� ����
    -- COUNT(Į����) : Į���� ���� 
    SELECT COUNT(*) AS ���ǸŰǼ� FROM orders; 
    
    SELECT COUNT(*) AS �Ѱ���, COUNT(phone) AS ��ȭ��ȣ�� FROM customer;
    
    -- phoneĮ���� null�ڷ� ������ ���� ����
    SELECT COUNT(phone) AS ��ȣ FROM customer; 

-- �հ�(SUM), ���(AVG)
 SELECT SUM(saleprice) AS ���Ǹž�,
        AVG(saleprice) AS ����վ�
        FROM orders;
    -- ���� �ֹ��� ������ �� �Ǹž� ���
    SELECT SUM(saleprice) AS ���Ǹž� FROM orders;
    -- ������ �ֹ��� ������ �� �Ǹž� ��� : GROUP BY ���
        -- GROUP BY Į���� : �׷����� ���� �� ��� 
        SELECT custid, 
             COUNT(*) AS ��������,
             SUM(saleprice) AS ���Ǹž� 
             FROM orders GROUP BY custid;
    -- ���������� 3�� �̻��� �ڷ� �˻�
        -- GROUP BY ������ ������ ������ HAVING�� ���
        SELECT custid, 
             COUNT(*) AS ��������,
             SUM(saleprice) AS ���Ǹž� 
             FROM orders GROUP BY custid
             HAVING COUNT(*) >= 3;
             -- AND SUM(saleprice) > 35000;

-- ���� �߿��� �ְ���(MAX), ��������(MIN) �˱�
    SELECT MAX(price) AS �ְ���, MIN(price) AS �������� FROM book;
 
-- '3�� ��'(�Ȼ�)�� �ֹ��� ������ �� �Ǹž� ���ϱ�
SELECT SUM(saleprice) AS ���Ǹž� FROM orders WHERE custid = 3;
-- '3�� ��'�� ���̵�� �ֹ� ���� ����� �˻�
SELECT custid, saleprice FROM orders WHERE custid = 3;

  
-- JOIN 
-- ���� ����(EQUL JOIN) : equal(=)�� ����ϴ� ����
-- ���̺�A.Į���� = ���̺�B.Į���� (Į����-FK)
    
    -- '3�� ��'�� ���̵�� �ֹ� ���� ����� �˻� + ������ å �̸��� �˻�
    -- bookname�� �ٸ� ���̺� �����Ƿ� join���ֱ�!
    SELECT custid, bookname, saleprice FROM orders, book 
    WHERE orders.bookid = book.bookid AND custid = 3;
    
    -- ���� �̸��� ���� �ֹ��� å�� ������ �˻� (customer,order Join!)
    SELECT customer.name, orders.saleprice FROM customer, orders
    WHERE customer.custid = orders.custid;
    
    -- ��Ī ���(cus, ord) Join + ORDER BY ����(���̸� ASC, �ֹ�����DESC) 
    SELECT cus.name, ord.saleprice
    FROM customer cus, orders ord
    WHERE cus.custid = ord.custid
    ORDER BY cus.name, ord.saleprice DESC;

