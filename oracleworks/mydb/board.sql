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

-- 재귀 복사
INSERT INTO board(bno, btitle, bcontent, bwriter) 
(SELECT seq.NEXTVAL, btitle, bcontent, bwriter FROM board);


COMMIT;

SELECT * FROM board ORDER BY bno DESC;

-- ROWNUM을 이용한 페이지 처리
SELECT ROWNUM bno, btitle, bcontent, bwriter, bdate FROM board
WHERE ROWNUM >= 11 AND ROWNUM <= 20; -- 오류! rownum은 1번부터 가능
    -- 위의 오류 해결 : ROWNUM 별칭 rn 사용으로 페이지 처리
    SELECT * FROM
    (SELECT ROWNUM rn, bno, btitle, bcontent, bwriter, bdate FROM board)
    WHERE rn >= 11 AND rn <= 20;
    
--ROWID : 데이터를 구분할 수 있는 유일한 값, 데이터 파일의 저장 블록을 확인할 수 있음
SELECT ROWID, bno, btitle FROM board
WHERE ROWID = 'AAATOZAAHAAAAPDAAB';

DROP SEQUENCE seq;
DROP TABLE board;
TRUNCATE TABLE board;