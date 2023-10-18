-- ������ ���̺�
CREATE TABLE summer_price(
    subject VARCHAR2(20) PRIMARY KEY,
    price NUMBER 
);

INSERT INTO summer_price VALUES ('C', 30000);
INSERT INTO summer_price VALUES ('Java', 45000);
INSERT INTO summer_price VALUES ('Python', 40000);

-- �����б� ��� ���̺�
CREATE TABLE summer_register(
    stuid NUMBER PRIMARY KEY,
    subject VARCHAR2(20),
    FOREIGN KEY(subject)REFERENCES summer_price(subject)
);

INSERT INTO summer_register VALUES (100, 'C');
INSERT INTO summer_register VALUES (101, 'Java');
INSERT INTO summer_register VALUES (200, 'Python');
INSERT INTO summer_register VALUES (201, 'Java');

COMMIT;
SELECT * FROM summer_price;
SELECT * FROM summer_register;

--> ���� �̻� ���� **
-- 200�� �л��� ���� ��û ���
DELETE FROM summer_register
WHERE stuid = 200;
    -- Python ������ �������?
    SELECT price FROM summer_price
    WHERE subject = 'Python';

--> ���� �̻� ���� **
-- ������ ���̺� 'C++' ���¸� 35000�� ���� ����
INSERT INTO summer_price VALUES('C++', 35000);
    -- ���� ��û ���� Ȯ���ϱ�
    SELECT * FROM summer_price;

--> ���� �̻� ���� **
-- Java �����Ḧ 45000������ 40000������ �����ϱ�
UPDATE summer_price SET price = 40000
WHERE subject = 'Java';
    -- ������ ���� Ȯ��
    SELECT * FROM summer_price;

-- �����ᰡ ���� ������ ������? (subquery)
SELECT MIN(price) FROM summer_price; 
-- ���� ����(SELECT ��������)
SELECT subject, price FROM summer_price
WHERE price = (SELECT MIN(price) FROM summer_price);


DROP TABLE summer_register;