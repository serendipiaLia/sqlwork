-- 계절학기 수강료, 등록 테이블
SELECT * FROM summer_price;
SELECT * FROM summer_register;

-- 학생의 모든 정보 출력
    -- subject칼럼은 연결키 
SELECT b.stuid, b.subject, a.price
FROM summer_price a, summer_register b
WHERE a.subject = b.subject;
    -- 내부조인 (JOIN ~ ON)
    SELECT b.stuid, b.subject, a.price
    FROM summer_price a JOIN summer_register b
    ON a.subject = b.subject;
    -- 조인 후 USING 사용 : JOIN ~ USING(같은 조인칼럼이름);
    SELECT b.stuid, b.subject, a.price
    FROM summer_price a JOIN summer_register b
    USING (subject); -- using 사용 시, 별칭 사용 X

-- 과목별 수강료 합계
INSERT INTO summer_register VALUES (301, 'Python');

SELECT b.subject, SUM(a.price)
FROM summer_price a, summer_register b
WHERE a.subject = b.subject
GROUP BY b.subject;

-- java 과목의 수강료 합계 
SELECT b.stuid, b.subject, SUM(a.price)
FROM summer_price a, summer_register b
WHERE a.subject = b.subject AND b.subject = 'Java'
GROUP BY b.subject;

-- 과목별 수강료 합계 및 전체 총 계 구하기
-- ROLLUP(), CUBE() 사용
-- NVL(과목, '총 계') : 과목이 NULL이 아니면 과목 출력, NULL이면 '총 계'출력
SELECT NVL(b.subject, '총 계') 수강과목, SUM(a.price) 수강료합계
FROM summer_price a, summer_register b
WHERE a.subject = b.subject
GROUP BY ROLLUP(b.subject);