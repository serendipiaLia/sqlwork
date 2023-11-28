-- ��� �ű�� ntile() �Լ� ���! 
CREATE TABLE exam_score(
    name VARCHAR2(20),
    korean NUMBER,
    english NUMBER,
    math NUMBER
);
-- ���� ü��(����) : ���� 120��, ���� 80��, ���� 80��
INSERT INTO exam_score VALUES('�̳���', 116, 77, 75);
INSERT INTO exam_score VALUES('�ӿ���', 101, 69, 80);
INSERT INTO exam_score VALUES('������', 118, 62, 60);
INSERT INTO exam_score VALUES('�̰���', 96, 72, 70);
INSERT INTO exam_score VALUES('�����', 103, 77, 55);
INSERT INTO exam_score VALUES('�����', 78, 66, 61);
INSERT INTO exam_score VALUES('Ȳ����', 85, 72, 75);
INSERT INTO exam_score VALUES('����ƾ', 99, 70, 53);
INSERT INTO exam_score VALUES('����ȯ', 105, 75, 69); 
INSERT INTO exam_score VALUES('���쿵', 117, 68, 73);

COMMIT;
SELECT * FROM exam_score;

-- ���� ���� ��� �˻� 
-- NTILE(��) OVER(ORDER BY Į����)
SELECT name, korean, NTILE(8)OVER(ORDER BY korean DESC) ������ FROM exam_score;

-- '����ȯ'�� ������ ���� ���� ��� �˻�
SELECT name, korean, NTILE(8)OVER(ORDER BY korean DESC) ������ FROM exam_score 
WHERE name <> '����ȯ';  -- <>�� =�� �ݴ�. (=���� ����)


