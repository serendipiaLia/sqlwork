--voter ���̺� ����
CREATE TABLE voter(
    vno NUMBER PRIMARY KEY,
    mid VARCHAR2(20), -- member.sql���� ������ FK
    bno NUMBER,
    FOREIGN KEY (mid) REFERENCES member(id) ON DELETE CASCADE,
    FOREIGN KEY (bno) REFERENCES board(bno) ON DELETE CASCADE
);
CREATE SEQUENCE seq_vno NOCACHE;

SELECT * FROM voter;
SELECT COUNT(*) FROM voter WHERE bno = 34 AND mid = 'Lia';

-- �ش� �Խñ��� �� ����
SELECT COUNT(*) FROM voter WHERE bno = 1;

COMMIT;

INSERT INTO voter(vno, bno, mid) VALUES(seq_vno.NEXTVAL, 1, 'khit');

-- �����͸� ���� : TRUNCATE
TRUNCATE TABLE voter;

-- ������ ����
DROP SEQUENCE seq_vno;

DROP TABLE voter;