-- �����б� ������, ��� ���̺�
SELECT * FROM summer_price;
SELECT * FROM summer_register;

-- �й�stuid, ����subject, ������price �˻�
    -- subjectĮ���� ����Ű 
SELECT b.stuid, b.subject, a.price
FROM summer_price a, summer_register b
WHERE a.subject = b.subject;

-- ���� ������ �հ�
INSERT INTO summer_register VALUES (301, 'Python');
INSERT INTO summer_price VALUES (301, 'Python');

-- java ������ ������ �հ� 
SELECT b.stuid, b.subject, SUM(a.price)
FROM summer_price a, summer_register b
WHERE a.subject = b.subject 