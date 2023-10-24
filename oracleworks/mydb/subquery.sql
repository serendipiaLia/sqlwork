-- ���� ����(Sub Query): �μ� ����(��ø ����)

-- ���� �� ������ ���� ���� ������ �˻�
    -- MAX(price) : 35000
    SELECT MAX(price) FROM book;

--> ������ �������� (����� �Ѱ�)
-- ���� �߿��� ���� ��� ������ �̸��� �˻�
SELECT bookname, price FROM book
WHERE price = (SELECT MAX(price) FROM book);
    
-- ������ ������ ���� �ִ� ���� id �˻�
SELECT custid FROM orders;   
-- ������ ������ ���� �ִ� 1�� ���� �̸� �˻�
SELECT name FROM customer
WHERE custid = 1;

--> ������ �������� (����� �ټ���)
-- ������ ������ ���� �ִ� ���� �̸� �˻�
SELECT name FROM customer
WHERE custid IN(SELECT custid FROM orders);
    
-- ���� ���
SELECT DISTINCT cus.name 
FROM customer cus, orders ord
WHERE cus.custid = ord.custid;
    
--> FROM���� �ִ� �������� : �ζ��κ� ��� ��

-- ���� �̸��� ���� �Ǹž� �˻� (customer, orders)
-- �׷캰 : GROUP BY
-- ��, �� ��ȣ�� 2 ������

    -- ���� ���� ���
    SELECT a.name, SUM(b.saleprice) FROM customer a, orders b
    WHERE a.custid = b.custid AND a.custid <= 2
    GROUP BY a.name;
        -- HAVING �߰�
        SELECT a.name, SUM(b.saleprice) total
        FROM customer a, orders b
        WHERE a.custid = b.custid AND a.custid <= 2
        GROUP BY a.name HAVING SUM(b.saleprice) >= 30000;    
                    -- HAVING�� ��Ī ����� ��쵵 ����
       
    -- ���� ���� ���
    SELECT a.name, SUM(b.saleprice) 
    FROM (SELECT * FROM customer WHERE custid <=2 ) a, orders b
    WHERE a.custid = b.custid
    GROUP BY a.name; 
       
        /*
         �������   
         1. FROM�� ���̺��
         2. WHERE, GROUP BY
         3. SELECT��
         4. ORDER BY��
     */
     
   
--> product, product_review Ȱ��
SELECT * FROM product;
SELECT * FROM product_review;
    -- ��ǰ ���� ���̺� �ִ� ��ǰ �̸� �˻� / ��Į�� �������� ���
    -- ��Į�� �������� : select ���� �ִ� select���� ����
    SELECT r.product_code, 
    (SELECT p.product_name FROM product p 
        WHERE r.product_code = p.product_code)product_name,
        r.member_id, r.content
    FROM product_review r 



