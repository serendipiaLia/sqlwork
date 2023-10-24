-- product ���̺� ����
CREATE TABLE product(
    product_code CHAR(6) PRIMARY KEY, -- ��ǰ�ڵ�
    product_name VARCHAR2(50) NOT NULL, -- ��ǰ��
    price NUMBER -- ����
);

INSERT INTO product(product_code, product_name, price) 
VALUES ('10001', '������ ���� ���콺', 25000);

INSERT INTO product(product_code, product_name, price) 
VALUES ('10002', '���� ���̹� Ű����', 30000);

INSERT INTO product(product_code, product_name, price) 
VALUES ('10003', '������ �г� ���þ߰� �����', 120000);

COMMIT;
SELECT * FROM product;

-- ��ǰ�� �� ���� �� ��ǰ ������ ����� ���Ͻÿ�
-- COUNT(), AVG(), SUM()
SELECT COUNT(*) AS �Ѱ���,
    ROUND(AVG(price), -2) ��հ��� -- 100�� ������ �ݿø�
FROM product;

-- ��ǰ �߿��� ���콺 �˻��ϱ�
SELECT product_name, price FROM product
WHERE product_name LIKE '%���콺%';

-- ��ǰ�� ���ݼ����� �����Ͻÿ� (�������� DESC)
SELECT * FROM product ORDER BY price DESC;



