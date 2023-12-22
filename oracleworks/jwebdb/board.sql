-- board 테이블 생성
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
VALUES(seq_bno.NEXTVAL, '글 제목1', '글 내용 입니다1.', 'khit');

INSERT INTO board (bno, title, content, id)
VALUES(seq_bno.NEXTVAL, '글 제목2', '글 내용 입니다2.', 'khit');

INSERT INTO board (bno, title, content, id)
VALUES(seq_bno.NEXTVAL, '글 제목3', '글 내용 입니다3.', 'khit');

INSERT INTO board (bno, title, content, id)
VALUES(seq_bno.NEXTVAL, '글 제목4', '글 내용 입니다4.', 'khit');

-- 재귀 복사
insert into board(bno, title, content, id)
(select seq_bno.NEXTVAL, title, content, id from board);

-- 페이지 처리
SELECT ROWNUM, board.* FROM board
WHERE ROWNUM >= 1 AND ROWNUM <=10; -- ROWNUM은 1을 포함해서 검색해야함! 그래서 요 메서드는 실행x
    -- 페이지 처리(서브쿼리)
    SELECT * FROM (SELECT ROWNUM RN, board.* FROM board ORDER BY bno DESC)
    WHERE RN >= 11 AND RN <=20;
-- 페이지 처리(서브쿼리 deep 2단계..) >> 기존 서브쿼리는 게시글 목록 페이지당 나중에 쓰여진 글이 오는 오류
 SELECT * FROM (SELECT ROWNUM RN, bo.*  -- board의 별칭 bo 생성
    FROM (SELECT * FROM board ORDER BY bno DESC)bo)
WHERE RN >= 1 AND RN <=10;
    
-- 전체 게시글 수
SELECT COUNT(*) AS total FROM board;

-- 문자열 검색 (제목, 아이디)
SELECT * FROM board WHERE id LIKE '%khit%'; -- 아이디
--WHERE title LIKE '%2%'; //제목

COMMIT;

SELECT * FROM board;
SELECT * FROM member;

-- 게시글 3번 삭제
DELETE FROM board;

-- 게시글 수정 : 번호가 1번인 게시글의 제목을 '공지사항 수정', 내용을 공지사항 수정'
UPDATE board SET title= '공지사항 수정', content='공지사항 수정하기'
WHERE bno = 1;

-- 글 번호가 2번인 게시글의 조회수를 1 증가(변경)
UPDATE board SET hit = hit+1
WHERE bno = 2;

Delete from board;
drop sequence seq_bno;

