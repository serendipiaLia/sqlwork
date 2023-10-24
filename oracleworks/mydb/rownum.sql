-- ROWNUM (로우 번호, 행 번호)
-- 행 수를 제한하고 싶을 때 사용, SUDO COLUMN이라 함
-- ROWNUM은 무조건 1부터 제한 가능
CREATE TABLE ex_score(
    name VARCHAR2(10),
    score NUMBER(3) -- 100점까지..(3자리)
);

INSERT INTO ex_score VALUES('김하나', 92);
INSERT INTO ex_score VALUES('이나경', 100);
INSERT INTO ex_score VALUES('임예은', 97);
INSERT INTO ex_score VALUES('서지훈', 85);
INSERT INTO ex_score VALUES('이강인', 87);
INSERT INTO ex_score VALUES('손흥민', 91);
INSERT INTO ex_score VALUES('정우영', 85);
INSERT INTO ex_score VALUES('설영우', 80);
INSERT INTO ex_score VALUES('김민재', 95);
INSERT INTO ex_score VALUES('조현우', 93);

SELECT * FROM ex_score;

-- 1부터 5행까지 정보 출력 (BETWEEN 사용)
SELECT ROWNUM, name, score
FROM ex_score
--WHERE ROWNUM BETWEEN 1 AND 5;
WHERE ROWNUM >= 1 AND ROWNUM <= 5;

-- **ROWNUM은 항상 1부터 시작!
-- 2부터 6행까지 데이터 검색 >> 오류!
SELECT ROWNUM, name, score FROM ex_score
WHERE ROWNUM >=2 AND ROWNUM <= 6;

-- 점수를 내림차순 정렬하여 검색하시오
SELECT * FROM ex_score
ORDER BY score DESC;

-- 점수가 높은 순으로 5명을 검색하시오 (1-5행에서 점수가 높은순으로 출력된 결과)
SELECT ROWNUM, name, score FROM ex_score
WHERE ROWNUM <=5
ORDER BY score DESC;
    -- 성적을 내림차순으로 먼저 정렬한 후! 5개를 검색 (1-10행 사이
    SELECT * 
    FROM (SELECT * FROM ex_score ORDER BY score DESC)
    WHERE ROWNUM <=5;
    
-- ROWNUM과 관련 없지만, 성적 순위 검색! >> RANK()OVER
SELECT name, score,
RANK()OVER(ORDER BY score DESC) 순위
FROM ex_score;
    -- 중복된 값에 동일한 순위 부여후, 다음 순위 부여 DENSE_RANK()OVER()
    SELECT name, score,
    RANK()OVER(ORDER BY score DESC) 순위,
    DENSE_RANK() OVER(ORDER BY score DESC) 순위2
    FROM ex_score;






