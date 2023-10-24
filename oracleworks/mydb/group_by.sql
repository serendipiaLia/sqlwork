-- department 테이블 생성
CREATE TABLE department(
     deptno VARCHAR2(4) PRIMARY KEY,
     deptname VARCHAR2(20) NOT NULL,
     office VARCHAR2(20) 
);

INSERT INTO department VALUES ('1000', '인사팀', '서울');
INSERT INTO department VALUES ('1001', '전산팀', '인천');
INSERT INTO department VALUES ('1002', '전산팀', '수원');
INSERT INTO department(deptno, deptname) VALUES ('1003', '영업팀');

-- employee 테이블 생성
CREATE TABLE employee ( 
    empno NUMBER(3) PRIMARY KEY,
    empname VARCHAR2(20) NOT NULL,
    sal NUMBER(10),
    createdate DATE DEFAULT SYSDATE,
    deptno VARCHAR2(4),
    FOREIGN KEY(deptno) REFERENCES department(deptno) -- 외래키
);

INSERT INTO employee VALUES (100, '이강인', 2500000, SYSDATE, '1000'); 
INSERT INTO employee VALUES (101, '김산', 2000000, SYSDATE, '1001'); 
INSERT INTO employee VALUES (102, '박달', 3000000, SYSDATE, '1002'); 
INSERT INTO employee VALUES (103, '강태양', 3500000, SYSDATE, '1000'); 
INSERT INTO employee VALUES (104, '최우주', 5000000, SYSDATE, '1001'); 
INSERT INTO employee VALUES (105, '우영우', 4000000, SYSDATE, '1002'); 

COMMIT;
SELECT * FROM department;
SELECT * FROM employee;

-- 부서별 급여 총액을 구하시오
SELECT deptno, SUM(sal) 급여_총_액 FROM employee e
GROUP BY deptno;

-- 부서 이름과 부서별 급여 총액을 구하시오
-- 부서이름 department TABLE, 급여 employee TABLE -> 동등 조인 방식 사용!
SELECT d.deptno, d.deptname, SUM(e.sal) 급여_총_액 
FROM department d, employee e
WHERE d.deptno = e.deptno
GROUP BY d.deptno, d.deptname;

-- 1002번 전산팀을 총무팀으로 바꾸기
UPDATE department SET deptname = '총무팀'
WHERE deptno = '1002';

-- 103번 '강태양'사원의 급여를 3000000원으로 변경하기
UPDATE employee SET sal = '3000000'
WHERE empno = 103;

-- SUM(누적합계할 칼럼명) OVER(ORDER BY 정렬할 칼럼명) : 누적 합계
-- 칼럼명을 소문자로 표기시 ""로 묶기
SELECT empno, empname, sal, SUM(sal) OVER(ORDER BY empno) "sal_sumover"
FROM employee;

-- 순위 RANK()OVER(ORDER BY 순위정할 칼럼명) 함수
SELECT empno, empname, sal, SUM(sal) OVER(ORDER BY empno) "sal_sumover",
RANK()OVER(ORDER BY sal) SAL_RANK 
FROM employee;
    -- 중복된 값에 동일한 순위 부여후, 다음 순위 부여 DENSE_RANK()OVER()
    SELECT empno, empname, sal, 
    RANK()OVER(ORDER BY sal DESC) SAL_RANK,
    DENSE_RANK() OVER (ORDER BY sal DESC)
    FROM employee;

-- ROLLUP(칼럼1, 칼럼2) : GROUP BY절에서 소계, 총계를 만듬
select a.deptno, a.deptname, sum(b.sal) from department a, employee b
where a.deptno = b.deptno
group by ROLLUP(a.deptno, a.deptname);

-- CUBE(칼럼1, 칼럼2) : GROUP BY 절에서 모든 소계, 총계를 입체적으로 만듬
select a.deptno, a.deptname, sum(b.sal) from department a, employee b
where a.deptno = b.deptno
group by CUBE(a.deptno, a.deptname)
ORDER BY a.deptno;




