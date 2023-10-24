-- �����б� ������, ��� ���̺�
SELECT * FROM summer_price;
SELECT * FROM summer_register;

-- �л��� ��� ���� ���
    -- subjectĮ���� ����Ű 
SELECT b.stuid, b.subject, a.price
FROM summer_price a, summer_register b
WHERE a.subject = b.subject;
    -- �������� (JOIN ~ ON)
    SELECT b.stuid, b.subject, a.price
    FROM summer_price a JOIN summer_register b
    ON a.subject = b.subject;
    -- ���� �� USING ��� : JOIN ~ USING(���� ����Į���̸�);
    SELECT b.stuid, b.subject, a.price
    FROM summer_price a JOIN summer_register b
    USING (subject); -- using ��� ��, ��Ī ��� X

-- ���� ������ �հ�
INSERT INTO summer_register VALUES (301, 'Python');

SELECT b.subject, SUM(a.price)
FROM summer_price a, summer_register b
WHERE a.subject = b.subject
GROUP BY b.subject;

-- java ������ ������ �հ� 
SELECT b.stuid, b.subject, SUM(a.price)
FROM summer_price a, summer_register b
WHERE a.subject = b.subject AND b.subject = 'Java'
GROUP BY b.subject;

-- ���� ������ �հ� �� ��ü �� �� ���ϱ�
-- ROLLUP(), CUBE() ���
-- NVL(����, '�� ��') : ������ NULL�� �ƴϸ� ���� ���, NULL�̸� '�� ��'���
SELECT NVL(b.subject, '�� ��') ��������, SUM(a.price) �������հ�
FROM summer_price a, summer_register b
WHERE a.subject = b.subject
GROUP BY ROLLUP(b.subject);