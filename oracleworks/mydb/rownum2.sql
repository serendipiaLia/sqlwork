-- drink select 
select * from drink;

-- drink 테이블 복사 > drink2 테이블 생성
CREATE TABLE drink2 AS SELECT * FROM drink;

select * from drink2;
drop table drink2;

-- 재귀 복사(INSERT INTO ~ SELECT) : VALUES 사용X
INSERT INTO drink2 SELECT * FROM drink2; 

-- ROWNUM (SUDO COLUMN : 제공된 관리자 칼럼)
SELECT drink_code, drink_name FROM drink2
WHERE ROWNUM >= 1 AND ROWNUM <= 10;
    -- WHERE ROWNUM >= 11 AND ROWNUM <=20; -- 1이 포함 되어야 검색가능

-- FROM절 서브쿼리 사용 - 인라인 뷰 
SELECT *
FROM(SELECT ROWNUM rn, drink_code, drink_name FROM drink2)
    -- WHERE ROWNUM >= 1 AND ROWNUM <= 10;
    -- WHERE ROWNUM >= 11 AND ROWNUM <=20; -- ROWNUM사용: 검색 안됨
WHERE rn >= 11 AND rn <= 30; -- 별칭(변수)사용 : 검색됨
-- rn 사용 이유 : ROWNUM 자체가 1부터 검색이 가능하므로.. (별칭으로)