-- ���� ����
-- product, product_review Table Ȱ��
SELECT * FROM product;
SELECT * FROM product_review;

-- <���䰡 �ִ� ��ǰ�� ������ �˻��Ͻÿ�>

-- ���� ���� (����Ŭ ���)
-- ���� ���̺� product_name Į�� ��� 
-- product, product_review Table ���� Ű : product_code
-- product_name : product / product_review
SELECT b.review_no, b.product_code, a.product_name, b.content, b.regdate
FROM product a, product_review b
WHERE a.product_code = b.product_code;
    -- �������̺�(b) ���� �� ������ �ϱ� b.*
    SELECT a.product_name, b.*
    FROM product a, product_review b
    WHERE a.product_code = b.product_code;

--ANSI(�̱���ȸ)���� - STANDARD JOIN(ǥ�� ����)
-- ��������(INNER JOIN) : FROM�� '='��� JOIN, 'WHERE'��� ON / INNER ��������
SELECT b.review_no, b.product_code, a.product_name, b.content, b.regdate
FROM product a JOIN product_review b
ON a.product_code = b.product_code; 

-- �ܺ�����(LEFT, RIGHT, OUTER ����) / OUTER ��������
-- ������ ������ ������� ��� ��ǰ�� ������ �˻�  
SELECT a.product_name, b.review_no, b.product_code, b.content, b.regdate
FROM product a LEFT JOIN product_review b
ON a.product_code = b.product_code; 

-- ���䰡 ���� ��ǰ�� �̸� �˻�
SELECT a.product_name "��ǰ �ıⰡ ���� ��ǰ"
FROM product a LEFT JOIN product_review b
ON a.product_code = b.product_code
WHERE b.content IS NULL;

-- ��ǰ �������̺�(product)review�� product_nameĮ�� �߰�
-- Subquery(��Į�� �������� ���): �� Į���� ��ȯ��(=A), SELECT������ ���
SELECT A.review_no, A.product_code,
(SELECT B.product_name FROM product B 
    WHERE A.product_code = B.product_code)product_name,
      A.content, A.member_id
FROM product_review A; -- �� Į��'A'�� ��ȯ��