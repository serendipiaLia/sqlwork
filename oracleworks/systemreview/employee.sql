-- 사원 테이블 생성
CREATE TABLE employee ( 
    empid NUMBER(3),
    empname VARCHAR2(20) NOT NULL,
    age NUMBER(3),
    deptid NUMBER,
    PRIMARY KEY(empid), -- 기본키
    FOREIGN KEY(deptid) REFERENCES department(deptid) -- 외래키
);

-- 사원 자료 추가
INSERT INTO employee (empid, empname, age, deptid)
VALUES (101,'이강인', 27, 10);
INSERT INTO employee(empid, empname, age, deptid)
VALUES (102, '손흥민', 31, 10); -- 부서 코드가 없어서 외래키 제약 (department에서 30지움)
INSERT INTO employee(empid, empname, deptid) -- age없이
VALUES (103, '정우영', 20);
INSERT INTO employee(empid, empname, age, deptid)
VALUES (104, '안재준', 21, 20);

-- 사원의 모든 정보 출력
SELECT * FROM employee;

-- 사원 이름과 나이 칼럼 출력
SELECT empname, age FROM employee;

-- 사원 이름이 '손흥민'인 데이터 출력
SELECT * FROM employee
WHERE empname = '손흥민';

-- 나이가 30이상인 사원을 검색
SELECT * FROM employee
WHERE age > 30;

-- 부서번호가 20인 사원 검색
SELECT * FROM employee
WHERE deptid = 20;

-- 나이가 입력되지 않은 사원 검색
SELECT * FROM employee
WHERE age IS NULL;

-- 문자열 검색(사원이름에서 '강'을 포함하거나(OR), 나이가 입력되지 않은 사원 검색)
-- A OR B : A포함하거나 B포함 / A AND B : A와 B 모두 포함 
SELECT * FROM employee
WHERE empname LIKE '%강%' OR age is NULL;

COMMIT;

DROP TABLE EMPLOYEE;