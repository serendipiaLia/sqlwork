-- ī�� ����� (�ֹ� / ����)
-- �ֹ� ���̺� cafe_order
CREATE TABLE cafe_order(
    order_no VARCHAR2(10) PRIMARY KEY, -- �ֹ���ȣ
    drink_code VARCHAR2(3) NOT NULL , -- �����ڵ�
    order_cnt NUMBER NOT NULL   -- �ֹ�����
);

INSERT INTO cafe_order VALUES ('2023100101', 'A01', 3);
INSERT INTO cafe_order VALUES ('2023100102', 'B01', 1);
INSERT INTO cafe_order VALUES ('2023100123', 'A01', 2);

-- ���� ���̺� drink
CREATE TABLE drink(
    drink_code VARCHAR2(3) PRIMARY KEY, -- �����ڵ�
    drink_name VARCHAR2(30) NOT NULL -- �����
);

INSERT INTO drink VALUES ('A01', '�Ƹ޸�ī��');
INSERT INTO drink VALUES ('B01', 'ī���');

COMMIT;
SELECT * FROM cafe_order;
SELECT * FROM drink;

-- �ֹ���ȣ, �����ڵ�, �����, �ֹ����� ��� ��� 
-- �������� 
SELECT a.order_no, a.drink_code, b.drink_name, a.order_cnt
FROM cafe_order a, drink b
WHERE a.drink_code = b.drink_code;

-- ��������(INNER JOIN)
SELECT a.order_no, a.drink_code, b.drink_name, a.order_cnt
FROM cafe_order a JOIN drink b
ON a.drink_code = b.drink_code;

    -- USING
    SELECT a.order_no, drink_code, b.drink_name, a.order_cnt
    FROM cafe_order a JOIN drink b
    USING (drink_code); 





