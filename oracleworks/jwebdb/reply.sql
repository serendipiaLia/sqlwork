-- reply ���̺� ����
CREATE TABLE reply(
    rno NUMBER PRIMARY KEY, -- ��۹�ȣ
    bno NUMBER NOT NULL, -- �Խñ� ��ȣ
    rcontent VARCHAR2(2000)NOT NULL, -- ��۳���
    replyer VARCHAR2(20) NOT NULL, -- ��� �ۼ���
    rdate TIMESTAMP DEFAULT SYSTIMESTAMP, -- ����ۼ���
    rupdate TIMESTAMP, -- ��� ������
    FOREIGN KEY(bno) REFERENCES board(bno)ON DELETE CASCADE -- �ܷ�ŰFK
);

CREATE SEQUENCE seq_rno NOCACHE;

-- 1�� ��� �˻�
SELECT * FROM reply WHERE bno=1;

-- 1�� �Խñۿ� ��۴ޱ�
INSERT INTO reply(rno, bno, rcontent, replyer)
VALUES(seq_rno.NEXTVAL, 1, 'first comment', 'today');

INSERT INTO reply(rno, bno, rcontent, replyer)
VALUES(seq_rno.NEXTVAL, 1, 'second comment', 'hello');

-- 3��rno ��� �����
DELETE FROM reply;

COMMIT;

SELECT * FROM reply;
