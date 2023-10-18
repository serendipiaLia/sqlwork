-- java 게시판 구현할 board 테이블 생성 
CREATE TABLE board(
    bno NUMBER PRIMARY KEY,
    btitle VARCHAR2(100) NOT NULL,
    bcontent CLOB NOT NULL, -- CLOB(Character Large Of Byte) 문자형
    bwriter VARCHAR2(50) NOT NULL,
    bdate DATE DEFAULT SYSDATE
);

CREATE SEQUENCE seq NOCACHE;

INSERT INTO board(bno, btitle, bcontent, bwriter) 
VALUES(seq.NEXTVAL, 'New post!', 'Hi :) Its a good day', 'Lee');

INSERT INTO board(bno, btitle, bcontent, bwriter) 
VALUES(seq.NEXTVAL, '공지사항', '천장 에어컨 청소합니다.', 'admin0000');

COMMIT;

SELECT * FROM board
ORDER BY bno DESC;

DROP SEQUENCE seq;

TRUNCATE TABLE board;