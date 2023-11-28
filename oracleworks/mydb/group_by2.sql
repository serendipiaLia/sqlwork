-- ROLLUP(), CUBE(), GROUPING SETS()
CREATE TABLE table_dept(
    dept_no VARCHAR2(3),
    job_name VARCHAR2(30),
    salary NUMBER
);

INSERT INTO table_dept VALUES('100', '증권사', 3300000);
INSERT INTO table_dept VALUES('100', '관리자', 4300000);
INSERT INTO table_dept VALUES('100', '관리자', 2500000);
INSERT INTO table_dept VALUES('200', '증권사', 5000000);
INSERT INTO table_dept VALUES('200', '데이터분석가', 4000000);
INSERT INTO table_dept VALUES('200', '관리자', 6000000);

COMMIT;

SELECT * FROM table_dept;

-- 부서 전체의 인원수와 급여 합계
SELECT COUNT(*) "전체 인원수", SUM(salary) "급여 합계(원)" FROM table_dept;

-- 부서별(dept_no) 인원수 및 급여 합계
SELECT dept_no, COUNT(*) "전체 인원수", SUM(salary) "급여 합계(원)" FROM table_dept
GROUP BY dept_no;

-- 부서별(dept_no), 직업이름별(job_name) 인원수 및 급여 합계
SELECT dept_no, job_name, COUNT(*) "전체 인원수", SUM(salary) "급여 합계(원)" FROM table_dept
GROUP BY dept_no, job_name;

-- 부서별, 직업 이름별 인원수 및 급여 합계 (+ 소계, 총계) ROLLUP사용
SELECT dept_no, job_name, COUNT(*) "전체 인원수", SUM(salary) "급여 합계(원)" FROM table_dept
GROUP BY ROLLUP(dept_no, job_name);

-- CUBE 사용
SELECT dept_no, job_name, COUNT(*) "전체 인원수", SUM(salary) "급여 합계(원)" FROM table_dept
GROUP BY CUBE(dept_no, job_name) ORDER BY dept_no; 

-- GROUPING SETS 사용 (group별 소계, 총계 값이 나옴, 전체 총계 안나옴)
SELECT dept_no, job_name, COUNT(*) "전체 인원수", SUM(salary) "급여 합계(원)" FROM table_dept
GROUP BY GROUPING SETS(dept_no, job_name) ORDER BY dept_no; 
