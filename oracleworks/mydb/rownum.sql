-- ROWNUM (�ο� ��ȣ, �� ��ȣ)
-- �� ���� �����ϰ� ���� �� ���, SUDO COLUMN�̶� ��
-- ROWNUM�� ������ 1���� ���� ����
CREATE TABLE ex_score(
    name VARCHAR2(10),
    score NUMBER(3) -- 100������..(3�ڸ�)
);

INSERT INTO ex_score VALUES('���ϳ�', 92);
INSERT INTO ex_score VALUES('�̳���', 100);
INSERT INTO ex_score VALUES('�ӿ���', 97);
INSERT INTO ex_score VALUES('������', 85);
INSERT INTO ex_score VALUES('�̰���', 87);
INSERT INTO ex_score VALUES('�����', 91);
INSERT INTO ex_score VALUES('���쿵', 85);
INSERT INTO ex_score VALUES('������', 80);
INSERT INTO ex_score VALUES('�����', 95);
INSERT INTO ex_score VALUES('������', 93);

SELECT * FROM ex_score;

-- 1���� 5����� ���� ��� (BETWEEN ���)
SELECT ROWNUM, name, score
FROM ex_score
--WHERE ROWNUM BETWEEN 1 AND 5;
WHERE ROWNUM >= 1 AND ROWNUM <= 5;

-- **ROWNUM�� �׻� 1���� ����!
-- 2���� 6����� ������ �˻� >> ����!
SELECT ROWNUM, name, score FROM ex_score
WHERE ROWNUM >=2 AND ROWNUM <= 6;

-- ������ �������� �����Ͽ� �˻��Ͻÿ�
SELECT * FROM ex_score
ORDER BY score DESC;

-- ������ ���� ������ 5���� �˻��Ͻÿ� (1-5�࿡�� ������ ���������� ��µ� ���)
SELECT ROWNUM, name, score FROM ex_score
WHERE ROWNUM <=5
ORDER BY score DESC;
    -- ������ ������������ ���� ������ ��! 5���� �˻� (1-10�� ����
    SELECT * 
    FROM (SELECT * FROM ex_score ORDER BY score DESC)
    WHERE ROWNUM <=5;
    
-- ROWNUM�� ���� ������, ���� ���� �˻�! >> RANK()OVER
SELECT name, score,
RANK()OVER(ORDER BY score DESC) ����
FROM ex_score;
    -- �ߺ��� ���� ������ ���� �ο���, ���� ���� �ο� DENSE_RANK()OVER()
    SELECT name, score,
    RANK()OVER(ORDER BY score DESC) ����,
    DENSE_RANK() OVER(ORDER BY score DESC) ����2
    FROM ex_score;






