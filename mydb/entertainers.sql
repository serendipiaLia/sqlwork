-- ������ ���̺�
CREATE TABLE entertainers (
    name VARCHAR2(30),
    birthday VARCHAR2(20),
    job VARCHAR2(30)
);

INSERT INTO entertainers VALUES ('�絿��', '1979-06-01', '���, ����');
INSERT INTO entertainers VALUES ('������', '1992-09-04', '���');
INSERT INTO entertainers VALUES ('�����', '1982-02-20', '����, �۰�');

SELECT * FROM entertainers;

-- �� 1 ����ȭ ���
-- �Ӽ� ���� ���� ���̾�� ��
-- ������ ������ �������� �˻�
SELECT * FROM entertainers
WHERE job = '%����%';  -- WHERE job LIKE '%����%';

-- ������ ���̺�, �۾� ���̺�� ����