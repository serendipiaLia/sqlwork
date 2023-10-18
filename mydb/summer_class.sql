-- ���� �б� ���̺�
CREATE TABLE summer_class(
    stuid NUMBER, -- �й�
    subject VARCHAR2(20), -- ��������
    price NUMBER -- ������
);

INSERT INTO summer_class VALUES (100, 'C', 30000);
INSERT INTO summer_class VALUES (101, 'Java', 45000);
INSERT INTO summer_class VALUES (200, 'Python', 40000);
INSERT INTO summer_class VALUES (201, 'Java', 45000);

-- �����б⸦ �����ϴ� �л��� �й��� �����ϴ� ������?
SELECT stuid AS �й�, subject AS ��������
FROM summer_class;

-- 'Python' ������ �������?
SELECT subject ��������, price ������ FROM summer_class 
WHERE subject LIKE 'Python'; 
    -- WHERE subject = 'Python';

-- �����б⸦ ��� �л����� ������ �Ѿ���? 
SELECT COUNT(stuid) �л���, SUM(price) ������
FROM summer_class;


-- <�̻� ����(anormaly)>
-- 200�� �л��� �������(����) -> pythone���� ������ : �����̻�**
DELETE FROM summer_class 
WHERE stuid = 200;
    -- 'Python' ������ �������? -> ��°�x, ����ȭ �ʿ�!

-- C++ ���� ���� : �����̻�**
INSERT INTO summer_class VALUES (NULL, 'C++', 35000);
    -- �л�stuid 3��, Ʃ���� 4���� ����ġ �߻�
    SELECT COUNT(stuid) �����ο� FROM summer_class; -- 3
    SELECT COUNT(*) Ʃ��_�����ο� FROM summer_class;
    
-- Java �����ᰡ 45000������ 40000������ ����� : �����̻�**
UPDATE summer_class SET price = 40000
WHERE subject = 'Java';
    -- ���� ���� UPDATE���� �̻� ����
    -- 1�Ǹ� ����
    UPDATE summer_class SET price = 40000
    WHERE subject = 'Java' AND stuid = 101;
    -- Java ������� ? 
    SELECT price FROM summer_class WHERE subject = 'Java';
        -- 40000, 45000

SELECT * FROM summer_class;

