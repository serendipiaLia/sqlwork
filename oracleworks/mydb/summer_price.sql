-- 수강료 테이블
CREATE TABLE summer_price(
    subject VARCHAR2(20) PRIMARY KEY,
    price NUMBER 
);

INSERT INTO summer_price VALUES ('C', 30000);
INSERT INTO summer_price VALUES ('Java', 45000);
INSERT INTO summer_price VALUES ('Python', 40000);

-- 여름학기 등록 테이블
CREATE TABLE summer_register(
    stuid NUMBER PRIMARY KEY,
    subject VARCHAR2(20),
    FOREIGN KEY(subject)REFERENCES summer_price(subject)
);

INSERT INTO summer_register VALUES (100, 'C');
INSERT INTO summer_register VALUES (101, 'Java');
INSERT INTO summer_register VALUES (200, 'Python');
INSERT INTO summer_register VALUES (201, 'Java');

COMMIT;
SELECT * FROM summer_price;
SELECT * FROM summer_register;

--> 삭제 이상 없음 **
-- 200번 학생의 수강 신청 취소
DELETE FROM summer_register
WHERE stuid = 200;
    -- Python 과목의 수강료는?
    SELECT price FROM summer_price
    WHERE subject = 'Python';

--> 삽입 이상 없음 **
-- 수강료 테이블에 'C++' 강좌를 35000원 으로 삽입
INSERT INTO summer_price VALUES('C++', 35000);
    -- 수강 신청 정보 확인하기
    SELECT * FROM summer_price;

--> 수정 이상 없음 **
-- Java 수강료를 45000원에서 40000원으로 변경하기
UPDATE summer_price SET price = 40000
WHERE subject = 'Java';
    -- 수강료 변경 확인
    SELECT * FROM summer_price;

-- 수강료가 가장 저렴한 과목은? (subquery)
SELECT MIN(price) FROM summer_price; 
-- 메인 쿼리(SELECT 서브쿼리)
SELECT subject, price FROM summer_price
WHERE price = (SELECT MIN(price) FROM summer_price);


DROP TABLE summer_register;