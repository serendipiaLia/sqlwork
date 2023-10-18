-- 계절학기 수강료, 등록 테이블
SELECT * FROM summer_price;
SELECT * FROM summer_register;

-- 학번stuid, 과목subject, 수강료price 검색
    -- subject칼럼은 연결키 
SELECT b.stuid, b.subject, a.price
FROM summer_price a, summer_register b
WHERE a.subject = b.subject;

-- 과목별 수강료 합계
INSERT INTO summer_register VALUES (301, 'Python');
INSERT INTO summer_price VALUES (301, 'Python');

-- java 과목의 수강료 합계 
SELECT b.stuid, b.subject, SUM(a.price)
FROM summer_price a, summer_register b
WHERE a.subject = b.subject 