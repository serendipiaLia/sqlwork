-- 스키마 : system
-- 테이블
CREATE TABLE ex1(
    column1 CHAR(10),      -- 고정길이 문자(10Byte)
    column2 VARCHAR2(10)    -- 가변길이 문자(10Byte)
); 

-- 데이터 추가
INSERT INTO ex1(column1, column2) VALUES ('abc', 'abc'); -- SQL에서는 문자열 홀 따옴표 ' '사용
INSERT INTO ex1 VALUES ('당산', '당산');

-- 데이터 조회
SELECT column1, LENGTH (column1), column2, LENGTH(column2) FROM ex1;

-- 트랜잭션 : COMMIT,ROLL BACK
COMMIT;