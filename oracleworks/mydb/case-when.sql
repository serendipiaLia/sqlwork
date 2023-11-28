-- ���� ó�� �Լ� (TABEL : mytest, mytest2)
CREATE TABLE mytest(
    class VARCHAR2(1), -- �� ��ȣ
    name VARCHAR2(6) -- �̸�
);

INSERT INTO mytest VALUES('A', '����');
INSERT INTO mytest VALUES('A', '����');
INSERT INTO mytest VALUES('A', '����');
INSERT INTO mytest VALUES('B', '����');
INSERT INTO mytest VALUES('B', '����');
INSERT INTO mytest VALUES('C', '����');
INSERT INTO mytest VALUES('C', '����');

COMMIT;
select * from mytest;

-- �� �� �ο��� ��� > GROUP BY()���
SELECT class, COUNT(*) "�� �� �ο���"
FROM mytest
GROUP BY class;

-- �� �� �ο���, �ݺ��Ǵ� �̸� ���� �� ��� -> �ߺ�����
SELECT class, COUNT(DISTINCT name) "�ߺ����� �ο���"
FROM mytest
GROUP BY class;


-- DECODE(Į����, ����, ��/����)����� �ο� �� ���
    SELECT COUNT(DECODE(class, 'A', 1)) "class A",
           COUNT(DECODE(class, 'B', 1)) "class B", 
           COUNT(DECODE(class, 'C', 1)) "class C" 
    FROM mytest;
    
   
-- CASE 
    -- ���� ���� (if ~ else�� ����)
    /*
        CASE WHEN ����1 THEN ���1 
             WHEN ����2 THEN ���2 
             ELSE ���3
        END Į����
    */ 
SELECT 
    COUNT (CASE WHEN class='A' THEN 1 END) "class A",
    COUNT (CASE WHEN class='B' THEN 1 END) "class B",
    COUNT (CASE WHEN class='C' THEN 1 END) "class C"      
FROM mytest;
-------------------------------------------------------------------------
CREATE TABLE mytest2(
    COL1 NUMBER(1)
);
INSERT INTO mytest2 VALUES(NULL);
INSERT INTO mytest2 VALUES(0);
INSERT INTO mytest2 VALUES(NULL);
INSERT INTO mytest2 VALUES(0);
INSERT INTO mytest2 VALUES(NULL);

select * from mytest2;
-- mytest2 ���� ó��
-- COL1�� �����Ͱ� null�̸� -1���� ǥ�� >> DECODE�Լ����
SELECT DECODE(COL1, NULL, -1, COL1) DATA1
FROM mytest2;
    -- ��Ī T ���
SELECT DECODE(T.COL1, NULL, -1, T.COL1) DATA1
FROM mytest2 T;

    -- CASE WHEN ǥ���� ���
SELECT DECODE(COL1, NULL, -1, COL1) DATA1,
CASE
    WHEN COL1 IS NULL THEN -1
    ELSE COL1
END DATA2 FROM mytest2;



