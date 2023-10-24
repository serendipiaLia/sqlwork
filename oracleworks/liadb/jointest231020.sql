--  개의 테이블을 조인하여 EMPNO, EMPNAME, DEPTNO, DEPTNAME 컬럼을 
-- ANSI 구문으로 조회

-- 1. 조인의 종류(10점) 와 2. 해당 문제가 발생한 원인(20점) 을 원인 란에 기술
-- 3. 해결할 수 있는 조치사항(20점), 4. 조치사항이 적용된 ANSI 구문(20점),
-- 5. 오라클 전용 구문으로 변경(30점) 하여 조치내용 란에 기술

CREATE TABLE department (
    deptcode NUMBER, --
    deptname VARCHAR2(10)
);
INSERT INTO department VALUES (1, '인사');
INSERT INTO department VALUES (2, '행정');
INSERT INTO department VALUES (3, '총무');

select *from department;

CREATE TABLE employee(
    empno NUMBER,
    empname VARCHAR2(10),
    deptno NUMBER --
);
INSERT INTO employee VALUES(101, 'lee' , 1);
INSERT INTO employee VALUES(102, 'rim' , 2);
INSERT INTO employee VALUES(103, 'seo', 2);
INSERT INTO employee VALUES(104, 'kang', 3);


-- 실행한 조인 쿼리
SELECT empno, empname, deptno, deptname FROM employee
JOIN department USING(deptno);

-- 동등조인 
SELECT a.empno, a,.empname, a.deptno, b.deptname 
FROM employee a, department b
WHERE a.deptno = b.deptcode;

-- 내부조인
SELECT a.empno, a.empname, a.deptno, b.deptname 
FROM employee a JOIN department b
ON a.deptno = b.deptcode;


-- 문제 상황
-- ORA-00904: "DEPARTMENT"."DEPTNO": invalid identifier