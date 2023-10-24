-- drink select 
select * from drink;

-- drink ���̺� ���� > drink2 ���̺� ����
CREATE TABLE drink2 AS SELECT * FROM drink;

select * from drink2;
drop table drink2;

-- ��� ����(INSERT INTO ~ SELECT) : VALUES ���X
INSERT INTO drink2 SELECT * FROM drink2; 

-- ROWNUM (SUDO COLUMN : ������ ������ Į��)
SELECT drink_code, drink_name FROM drink2
WHERE ROWNUM >= 1 AND ROWNUM <= 10;
    -- WHERE ROWNUM >= 11 AND ROWNUM <=20; -- 1�� ���� �Ǿ�� �˻�����

-- FROM�� �������� ��� - �ζ��� �� 
SELECT *
FROM(SELECT ROWNUM rn, drink_code, drink_name FROM drink2)
    -- WHERE ROWNUM >= 1 AND ROWNUM <= 10;
    -- WHERE ROWNUM >= 11 AND ROWNUM <=20; -- ROWNUM���: �˻� �ȵ�
WHERE rn >= 11 AND rn <= 30; -- ��Ī(����)��� : �˻���
-- rn ��� ���� : ROWNUM ��ü�� 1���� �˻��� �����ϹǷ�.. (��Ī����)