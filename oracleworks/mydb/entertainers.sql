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
WHERE job = '%가수%';  

-- 연예인 테이블, 직업 테이블로 분해
CREATE TABLE entertainer(
    name VARCHAR2(20),
    birthday VARCHAR2(20)
);

INSERT INTO entertainer VALUES ('양동근', '1979-06-01');
INSERT INTO entertainer VALUES ('박은빈', '1992-09-04');
INSERT INTO entertainer VALUES ('장기하', '1982-02-20');
--------------
CREATE TABLE job(
    ename VARCHAR2(20),
    jobname VARCHAR2(30)
);

INSERT INTO job VALUES ('양동근', '배우');
INSERT INTO job VALUES ('양동근', '가수');
INSERT INTO job VALUES ('박은빈', '배우');
INSERT INTO job VALUES ('장기하', '가수');
INSERT INTO job VALUES ('장기하', '작가');

SELECT * FROM entertainer;
SELECT * FROM job;

-- 연예인의 이름과 생년월일, 직업정보를 검색
    -- 동등조인
    SELECT a.name, a.birthday, b.jobname
    FROM entertainer a, job b
    WHERE a.name = b.ename;
    
    -- 내부조인(INNER JOIN) = ANSI
    SELECT a.name, a.birthday, b.jobname
    FROM entertainer a JOIN job b
    ON a.name = b.ename;
    
    



