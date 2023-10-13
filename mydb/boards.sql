-- �Խ��� ���̺� ����
CREATE TABLE boards(
    bno NUMBER PRIMARY KEY,
    btitle VARCHAR2(100) NOT NULL,
    bcontent CLOB NOT NULL, -- CLOB(Character Large Of Byte) ������
    bwriter VARCHAR2(50) NOT NULL,
    bdate DATE DEFAULT SYSDATE,
    bfilename VARCHAR2(50),
    bfiledata BLOB -- BLOB(Binary Large Of Byte) �̹���...
);

-- ������ ����
CREATE SEQUENCE seq_bno NOCACHE;

-- �Խñ� �߰�
INSERT INTO boards (bno, btitle, bcontent, bwriter)
VALUES(seq_bno.NEXTVAL, 'smartPhone', '�Ｚ ������ s21�Դϴ�.', 'today');
    -- bno �ڵ����� ��ȣ ����� bdate �ڵ� ����)

INSERT INTO boards (bno, btitle, bcontent, bwriter, bdate, bfilename, bfiledata)
VALUES(seq_bno.NEXTVAL, 'smartPhone', '�Ｚ ������ s21�Դϴ�.', 'today', SYSDATE, '', '');

COMMIT;

SELECT * FROM boards ORDER BY bno DESC;

SELECT * FROM boards WHERE bwriter = 'sky12345'
ORDER BY bno DESC;
