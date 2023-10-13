-- 게시판 테이블 생성
CREATE TABLE boards(
    bno NUMBER PRIMARY KEY,
    btitle VARCHAR2(100) NOT NULL,
    bcontent CLOB NOT NULL, -- CLOB(Character Large Of Byte) 문자형
    bwriter VARCHAR2(50) NOT NULL,
    bdate DATE DEFAULT SYSDATE,
    bfilename VARCHAR2(50),
    bfiledata BLOB -- BLOB(Binary Large Of Byte) 이미지...
);

-- 시퀀스 생성
CREATE SEQUENCE seq_bno NOCACHE;

-- 게시글 추가
INSERT INTO boards (bno, btitle, bcontent, bwriter)
VALUES(seq_bno.NEXTVAL, 'smartPhone', '삼성 갤럭시 s21입니다.', 'today');
    -- bno 자동으로 번호 생기고 bdate 자동 생성)

INSERT INTO boards (bno, btitle, bcontent, bwriter, bdate, bfilename, bfiledata)
VALUES(seq_bno.NEXTVAL, 'smartPhone', '삼성 갤럭시 s21입니다.', 'today', SYSDATE, '', '');

COMMIT;

SELECT * FROM boards ORDER BY bno DESC;

SELECT * FROM boards WHERE bwriter = 'sky12345'
ORDER BY bno DESC;
