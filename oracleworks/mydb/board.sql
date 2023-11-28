-- java �Խ��� ������ board ���̺� ���� 
CREATE TABLE board(
    bno NUMBER PRIMARY KEY,
    btitle VARCHAR2(100) NOT NULL,
    bcontent CLOB NOT NULL, -- CLOB(Character Large Of Byte) ������
    bwriter VARCHAR2(50) NOT NULL,
    bdate DATE DEFAULT SYSDATE
);

CREATE SEQUENCE seq NOCACHE;

INSERT INTO board(bno, btitle, bcontent, bwriter) 
VALUES(seq.NEXTVAL, 'New post!', 'Hi :) Its a good day', 'Lee');

INSERT INTO board(bno, btitle, bcontent, bwriter) 
VALUES(seq.NEXTVAL, '��������', 'õ�� ������ û���մϴ�.', 'admin0000');

-- ��� ����
INSERT INTO board(bno, btitle, bcontent, bwriter) 
(SELECT seq.NEXTVAL, btitle, bcontent, bwriter FROM board);


COMMIT;

SELECT * FROM board ORDER BY bno DESC;

-- ROWNUM�� �̿��� ������ ó��
SELECT ROWNUM bno, btitle, bcontent, bwriter, bdate FROM board
WHERE ROWNUM >= 11 AND ROWNUM <= 20; -- ����! rownum�� 1������ ����
    -- ���� ���� �ذ� : ROWNUM ��Ī rn ������� ������ ó��
    SELECT * FROM
    (SELECT ROWNUM rn, bno, btitle, bcontent, bwriter, bdate FROM board)
    WHERE rn >= 11 AND rn <= 20;
    
--ROWID : �����͸� ������ �� �ִ� ������ ��, ������ ������ ���� ����� Ȯ���� �� ����
SELECT ROWID, bno, btitle FROM board
WHERE ROWID = 'AAATOZAAHAAAAPDAAB';

DROP SEQUENCE seq;
DROP TABLE board;
TRUNCATE TABLE board;