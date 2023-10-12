-- bookmall ����
-- book ���̺� ����
CREATE TABLE book (
    bookid NUMBER PRIMARY KEY,
    bookname VARCHAR2(60) NOT NULL,
    publisher VARCHAR2(60) NOT NULL,
    price NUMBER NOT NULL
);

-- ���� �ڷ� �߰�
INSERT INTO book VALUES (1, '�౸�� ����', '�½�����', 7000);
INSERT INTO book VALUES (2, '�౸�ƴ� ����', '������', 13000);
INSERT INTO book VALUES (3, '�౸�� ����', '���ѹ̵��', 22000);
INSERT INTO book VALUES (4, '���� ���̺�', '���ѹ̵��', 35000);
INSERT INTO book VALUES (5, '�ǰ� ����', '�½�����', 8000);
INSERT INTO book VALUES (6, '����� ����', '�½�����', 6000);
INSERT INTO book VALUES (7, '�߱��� �߾�', '�̻�̵��', 20000);
INSERT INTO book VALUES (8, '�߱��� ��Ź��', '�̻�̵��', 13000);
INSERT INTO book VALUES (9, '�ø��� �̾߱�', '�Ｚ��', 7500);
INSERT INTO book VALUES (10, 'Olympic Champions', 'Person', 13000);

COMMIT;

-- <�˻�>
-- ��ü ���� �˻�
SELECT * FROM book;

-- ��� ������ �̸��� ���� �˻�
SELECT bookname AS ������, price AS �������� FROM book;

-- ���� ���̺� �ִ� ��� ���ǻ� �˻� 
SELECT publisher AS ���ǻ� FROM book;
    -- �ߺ� ���� : DISTINCT
    SELECT DISTINCT publisher FROM book;

-- ������ 20000�� �̸��� �����˻� + ������������ ASC
SELECT * FROM book
WHERE price < 20000
 -- ASC
  ORDER BY price;
  
-- ������ 10000�� �̻�, 20000�� ������ ���� �˻� 
SELECT * FROM book
WHERE price >= 10000 AND price <= 20000;
    -- BETWEEN A AND B : A�̻� B���� �񱳱��� ����, �̸��ʰ� �ƴ�!
    SELECT * FROM book
    WHERE price BETWEEN 10000 AND 20000;

-- '�౸�� ����'�� �Ⱓ�� ���ǻ� �˻�
SELECT publisher FROM book
WHERE bookname = '�౸�� ����';
    -- LIKE��� : ~�� ���Ե� ���� �˻� 
    SELECT publisher FROM book
    WHERE bookname LIKE '�౸�� ����';

-- ���� �̸��� '�౸'�� ���Ե� ���ǻ� �˻�
SELECT bookname, publisher FROM book
WHERE bookname LIKE '%�౸%';
 
-- �౸�� ���� ���� �� ������ 20000�� �̻��� ���� �˻�
SELECT * FROM book
WHERE bookname LIKE '%�౸%' AND price >= 20000;

-- <����>
-- ������ �̸� ������ ����(��������) 
SELECT * FROM book
ORDER BY bookname ASC; --ASC ��������
    --��������
    SELECT * FROM book
    ORDER BY bookname DESC; 
    
-- ������ ���ݼ����� �˻�(��������)
SELECT * FROM book
ORDER BY price ASC; --�������� : ORDER BY price DESC;
    --������ ������ ������������
    SELECT * FROM book
    ORDER BY price ASC, bookname DESC;
