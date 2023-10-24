-- 여름 학기 테이블
CREATE TABLE summer_class(
    stuid NUMBER, -- 학번
    subject VARCHAR2(20), -- 수강과목
    price NUMBER -- 수강료
);

INSERT INTO summer_class VALUES (100, 'C', 30000);
INSERT INTO summer_class VALUES (101, 'Java', 45000);
INSERT INTO summer_class VALUES (200, 'Python', 40000);
INSERT INTO summer_class VALUES (201, 'Java', 45000);

-- 계절학기를 수강하는 학생의 학번과 수강하는 과목은?
SELECT stuid AS 학번, subject AS 수강과목
FROM summer_class;

-- 'Python' 강좌의 수강료는?
SELECT subject 수강과목, price 수강료 FROM summer_class 
WHERE subject LIKE 'Python'; 
    -- WHERE subject = 'Python';

-- 여름학기를 듣는 학생수와 수강료 총액은? 
SELECT COUNT(stuid) 학생수, SUM(price) 수강료
FROM summer_class;


-- <이상 현상(anormaly)>
-- 200번 학생의 수강취소(삭제) -> pythone과목 삭제됨 : 삭제이상**
DELETE FROM summer_class 
WHERE stuid = 200;
    -- 'Python' 강좌의 수강료는? -> 출력값x, 정규화 필요!

-- C++ 강좌 개설 : 삽입이상**
INSERT INTO summer_class VALUES (NULL, 'C++', 35000);
    -- 학생stuid 3명, 튜플은 4개인 불일치 발생
    SELECT COUNT(stuid) 수강인원 FROM summer_class; -- 3
    SELECT COUNT(*) 튜플_수강인원 FROM summer_class;
    
-- Java 수강료가 45000원에서 40000원으로 변경됨 : 수정이상**
UPDATE summer_class SET price = 40000
WHERE subject = 'Java';
    -- 만약 다음 UPDATE문의 이상 현상
    -- 1건만 수정
    UPDATE summer_class SET price = 40000
    WHERE subject = 'Java' AND stuid = 101;
    -- Java 수강료는 ? 
    SELECT price FROM summer_class WHERE subject = 'Java';
        -- 40000, 45000

SELECT * FROM summer_class;

