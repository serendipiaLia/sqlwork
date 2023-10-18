-- 연예인 테이블
CREATE TABLE entertainers (
    name VARCHAR2(30),
    birthday VARCHAR2(20),
    job VARCHAR2(30)
);

INSERT INTO entertainers VALUES ('양동근', '1979-06-01', '배우, 가수');
INSERT INTO entertainers VALUES ('박은빈', '1992-09-04', '배우');
INSERT INTO entertainers VALUES ('장기하', '1982-02-20', '가수, 작가');

SELECT * FROM entertainers;

-- 제 1 정규화 대상
-- 속성 값이 원자 값이어야 함
-- 직업이 가수인 연예인을 검색
SELECT * FROM entertainers
WHERE job = '%가수%';  -- WHERE job LIKE '%가수%';

-- 연예인 테이블, 작업 테이블로 분해