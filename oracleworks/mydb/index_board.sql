-- 실행 계획 : 옵티마이저
DESC PLAN_TABLE; 

SELECT * FROM board ORDER BY bno;

-- 작성자가 Lee인 게시글 검색
SELECT * FROM board WHERE bwriter='Lee';

-- 위에서 검색한 걸로 index 생성
-- 인덱스 생성 메서드: CREATE INDEX 인덱스이름 ON 테이블명(칼럼명)
CREATE INDEX idx_b1 ON board(bwriter);

-- 오라클 힌트 적용 : /* + INDEX(테이블명 인덱스명) */
SELECT /*+ INDEX(board idx_b1) */ * FROM board WHERE bwriter='Lee';

DROP INDEX idx_b1;