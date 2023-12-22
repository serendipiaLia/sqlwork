-- board ���̺� ����
CREATE TABLE board(
    bno NUMBER PRIMARY KEY,
    title VARCHAR2(100) NOT NULL,
    content CLOB NOT NULL,
    createdate TIMESTAMP DEFAULT SYSTIMESTAMP,
    modifydate TIMESTAMP,
    hit NUMBER DEFAULT 0,
    filename VARCHAR2(50),
    id VARCHAR2(20) NOT NULL,
    FOREIGN KEY(id) REFERENCES member(id) ON DELETE CASCADE
);

CREATE SEQUENCE seq_bno NOCACHE;

INSERT INTO board (bno, title, content, id)
VALUES(seq_bno.NEXTVAL, '�� ����1', '�� ���� �Դϴ�1.', 'khit');

INSERT INTO board (bno, title, content, id)
VALUES(seq_bno.NEXTVAL, '�� ����2', '�� ���� �Դϴ�2.', 'khit');

INSERT INTO board (bno, title, content, id)
VALUES(seq_bno.NEXTVAL, '�� ����3', '�� ���� �Դϴ�3.', 'khit');

INSERT INTO board (bno, title, content, id)
VALUES(seq_bno.NEXTVAL, '�� ����4', '�� ���� �Դϴ�4.', 'khit');

-- ��� ����
insert into board(bno, title, content, id)
(select seq_bno.NEXTVAL, title, content, id from board);

-- ������ ó��
SELECT ROWNUM, board.* FROM board
WHERE ROWNUM >= 1 AND ROWNUM <=10; -- ROWNUM�� 1�� �����ؼ� �˻��ؾ���! �׷��� �� �޼���� ����x
    -- ������ ó��(��������)
    SELECT * FROM (SELECT ROWNUM RN, board.* FROM board ORDER BY bno DESC)
    WHERE RN >= 11 AND RN <=20;
-- ������ ó��(�������� deep 2�ܰ�..) >> ���� ���������� �Խñ� ��� �������� ���߿� ������ ���� ���� ����
 SELECT * FROM (SELECT ROWNUM RN, bo.*  -- board�� ��Ī bo ����
    FROM (SELECT * FROM board ORDER BY bno DESC)bo)
WHERE RN >= 1 AND RN <=10;
    
-- ��ü �Խñ� ��
SELECT COUNT(*) AS total FROM board;

-- ���ڿ� �˻� (����, ���̵�)
SELECT * FROM board WHERE id LIKE '%khit%'; -- ���̵�
--WHERE title LIKE '%2%'; //����

COMMIT;

SELECT * FROM board;
SELECT * FROM member;

-- �Խñ� 3�� ����
DELETE FROM board;

-- �Խñ� ���� : ��ȣ�� 1���� �Խñ��� ������ '�������� ����', ������ �������� ����'
UPDATE board SET title= '�������� ����', content='�������� �����ϱ�'
WHERE bno = 1;

-- �� ��ȣ�� 2���� �Խñ��� ��ȸ���� 1 ����(����)
UPDATE board SET hit = hit+1
WHERE bno = 2;

Delete from board;
drop sequence seq_bno;

