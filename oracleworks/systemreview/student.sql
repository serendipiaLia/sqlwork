-- �л� ���̺� ����
CREATE TABLE student (
    snumber NUMBER PRIMARY KEY,
    sname VARCHAR2(20) NOT NULL,
    age NUMBER(2) NOT NULL,
    gender VARCHAR2(6) NOT NULL,
    address VARCHAR2(50),
    mname VARCHAR2(30) NOT NULL,
    FOREIGN KEY (mname) REFERENCES major (mname) -- mname�� �ܷ�Ű ���� ����
);

-- �л� �ڷ� �߰� 
INSERT INTO student(snumber, sname, age, gender, address, mname)
VALUES (1001, '�̳���', 25, '����', '����� ������', '����Ʈ�����а�');

INSERT INTO student(snumber, sname, age, gender, address, mname)
VALUES (1002, '������', 30, '����', '��õ�� ����', '�������ڰ��а�');

INSERT INTO student(snumber, sname, age, gender, address, mname)
VALUES (1003, '�ӿ���', 24, '����', ' ', 'ȭ�а��а�'); -- Not null�� �ƴϹǷ� ''

-- �θ�Ű�� ���� �����ʹ� ���� �̻� �߻� (ȸ���а� ����)
INSERT INTO student(snumber, sname, age, gender, address, mname)
VALUES (1003, '�̰���', 22, '����', '����� ���빮��', 'ȸ���а�');

-- ��ü ������ ��ȸ
SELECT * FROM student;

COMMIT;

-- �̸��� �̳����� �л��� �̸��� ���̸� ��ȸ�ϱ� 
-- ���ǹ� WHERE
SELECT sname, age FROM student
WHERE sname = '�̳���';
    -- AS, ��Ī���
    SELECT sname AS �л��̸�, age AS ���� FROM student
    WHERE sname = '�̳���';

-- �̸��� '��'�� ���Ե� �л��� ��� ���� ��� (���ڿ� LIKE)
SELECT * FROM student
WHERE sname LIKE '��%'; -- '��' = '%��%' /'��' = '%��'

-- ���̰� 30�� �̻��̰�, ������ ������ �л��� ��� ���� ���
SELECT * FROM student
WHERE age >= 30 AND gender = '����';

-- �ּҰ� ���� �л��� ������ ��� �� ����
    -- '': NULL �����Ͱ����� / '(��ĭ���)' : �����Ͱ� ����
    SELECT * FROM student
    WHERE address = ' '; -- WHERE address IS NULL;

    -- �ּҰ� ' '�� �����Ϳ� '������ ���뱸'�� �Է�(����) : UPDATE
    UPDATE student SET address = '������ ���뱸'
    WHERE address = ' '; -- null�ϰ�� : WHERE address IS NULL;

-- �����ϱ� : ORDER BY (�������� : ASC, �������� : DESC)
    -- �л��� ���̰� ���� ������ �����Ͽ� ����ϱ�!
    SELECT * FROM student
    ORDER BY age ASC; -- ASC �����ص� ��������! 
    -- �л��� ���̰� ���� ������ �����Ͽ� ����ϱ�!
    SELECT * FROM student
    ORDER BY age DESC;

    -- �б����� '�������ڰ��а�' �л��߿��� ���̰� ���� ������ �����Ͽ� ����ϱ�
    SELECT * FROM student
    WHERE mname = '�������ڰ��а�'
    ORDER BY age DESC;
    
ROLLBACK; -- Ŀ���ϱ����� �����ϸ� ���, ������ ��

COMMIT;




