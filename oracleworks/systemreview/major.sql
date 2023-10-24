-- 학교 데이터베이스 구축
-- 학과 테이블 생성
CREATE TABLE major (
    mname   VARCHAR2(20) PRIMARY KEY,
    mphone  VARCHAR2(20) NOT NULL, --Not null : 필수 입력!
    location    VARCHAR2(30) NOT NULL
); 

-- 학과 추가
INSERT INTO major (mname, mphone, location)
VALUES ('소프트웨어학과', '02-1234-5678', 'B동 3층');

INSERT INTO major (mname, mphone, location)
VALUES ('화학공학과', '02-2222-7777', 'B동 4층');

INSERT INTO major (mname, mphone, location)
VALUES ('전기전자공학과', '02-4444-7777', 'B동 5층');


-- 학과명 자료 크기를 변경 (기존 20 -> 변경 30)
    -- 20했을때 한글바이트가 너무 커서 insert가 안됨
ALTER TABLE major MODIFY mname VARCHAR(30);

COMMIT;

-- 전체 데이터 조회
SELECT * FROM major;


-- 학과명과 전화번호만 출력
SELECT mname, mphone FROM major;
-- 별칭 사용할 때 AS사용
SELECT mname AS 학과명, mphone AS 전화번호 FROM major; 

DROP TABLE major;