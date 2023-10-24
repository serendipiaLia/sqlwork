-- product_review ���̺� ����
CREATE TABLE product_review(
    review_no NUMBER PRIMARY KEY, -- �����ȣ / �ڵ����� �Ǳ⿡ number
    product_code CHAR(6) NOT NULL, -- ��ǰ�ڵ�
    member_id VARCHAR2(20) NOT NULL, -- ȸ�����̵�
    content CLOB NOT NULL, -- ���䳻�� / CLOB(Character Large Of Byte) ������ : 4GB���� ��밡��
    regdate DATE DEFAULT SYSDATE, --�ۼ���
    FOREIGN KEY(product_code) REFERENCES product(product_code) -- FK
);

-- ������ ���� (�ڵ�����)
CREATE SEQUENCE seq_rno NOCACHE;

-- ������ ����
INSERT INTO product_review
(review_no, product_code, member_id, content)
VALUES(seq_rno.NEXTVAL, '10001', 'today10', '�������ε� ������ ���� �ִ� ��...'); 

INSERT INTO product_review
(review_no, product_code, member_id, content)
VALUES(seq_rno.NEXTVAL, '10001', 'cloud100', '�����̶� ���� ���ϳ׿� :>'); 

INSERT INTO product_review
(review_no, product_code, member_id, content)
VALUES(seq_rno.NEXTVAL, '10002', 'sky123', '������ �� ���ϴ�!'); 

COMMIT;
SELECT * FROM product_review;

-- ��ǰ�ڵ尡 '10001'�̰�, ȸ�� ���̵� 'cloud100'�� ��ǰ�� ������ ����Ͻÿ�
SELECT * FROM product_review
WHERE product_code = '10001' AND member_id = 'cloud100';

-- ��ǰ ������ 3��, �����ִ� ������ 2��
-- ���䰡 �ִ� ��ǰ�� �˻��Ͻÿ� (���� ����) AND����
-- ������ġ : a���̺��� �⺻Ű = b���̺��� �ܷ�Ű
SELECT * FROM product a, product_review b
WHERE a.product_code = b.product_code;

-- ǥ�ع�� : ��������(INNER JOIN)
SELECT * FROM product a JOIN product_review b
ON a.product_code = b.product_code;

-- ������ ������ ������� ��ǰ�� ������ �˻��Ͻÿ�
    -- �������� ��� ��� : product�� ��ǰ�� ��� ���, review ���� �������
    SELECT * FROM product a, product_review b
    WHERE a.product_code = b.product_code(+); -- review ������ null�� ���
    
    -- ǥ�� ���(�ܺ� ���� : OUTER JOIN)
    -- OUTER ��������(LEFT JOIN / RIGHT JOIN)
    SELECT * FROM product a LEFT JOIN product_review b
    ON a.product_code = b.product_code;
    
    SELECT b.product_code, b.product_name, b.price, a.member_id, a.content, a.regdate
    FROM product_review a RIGHT JOIN product b
    ON a.product_code = b.product_code;
       
-- ���̺� ����, ������ ��ü����
TRUNCATE TABLE product_review;
-- ������ ����
DROP SEQUENCE seq_rno; 

