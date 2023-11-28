-- addrbook table ����
CREATE TABLE addrbook(
    bnum NUMBER PRIMARY KEY,
    username VARCHAR2(20) NOT NULL,
    tel VARCHAR2(20),
    email VARCHAR2(30) UNIQUE, -- UNIQUE�� �̸��� �ߺ� ����!!
    gender VARCHAR2(6), -- �ѱ�1�� = 3����Ʈ
    regdate TIMESTAMP DEFAULT SYSTIMESTAMP
);

CREATE SEQUENCE seq_bnum NOCACHE; -- �ڵ� ����

-- DB�׽�Ʈ!
INSERT INTO addrbook(bnum, username, tel, email, gender) 
VALUES (seq_bnum.NEXTVAL, '�̳���', '010-1234-5678', 'test@kh.kr', '��');
-- �̸��� �ߺ� üũ (UNIQUE >> ���Ἲ ���� ���� ����)
INSERT INTO addrbook(bnum, username, tel, email, gender) 
VALUES (seq_bnum.NEXTVAL, '�ӿ���', '010-1234-1234', 'test@kh.kr', '��');

COMMIT;

SELECT * FROM addrbook;

DROP TABLE addrbook;
DROP SEQUENCE seq_bnum;

-- �̸����� khit@kh.kr �� ���� ã��
SELECT email FROM addrbook
WHERE email = 'khit@kh.kr';

-- �󼼺��� ���� ����
DELETE FROM addrbook WHERE bnum = 6;

-- �󼼺��� ���� ����
UPDATE addrbook SET email = 'lia@kh.kr'
WHERE bnum = 1;
