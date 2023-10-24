-- 조건 관련 함수  
-- DECODE(칼럼명, 조건식, 참인 값, 거짓인 값) 
-- 성별이 남자이면 'M', 여자면 'F'로 출력
SELECT ename 사원이름, gender 성별, 
    DECODE(gender, '남자', 'M', 'F') gender
FROM emp; 

-- 조건 구문 (if ~ else와 유사)
/*
    CASE
        WHEN 조건1 THEN 결과1
        WHEN 조건2 THEN 결과2
        ELSE 결과3
    END 칼럼명
*/
SELECT ename 사원번호, gender 성별,
    CASE
        WHEN gender = '남자' THEN 'M'
        ELSE 'F'
    END gender
FROM emp;

SELECT * FROM emp;
-- > 급여에 따른 직급 표시
-- 급여가 350만원 이상이면 직급을 '과장'으로 표시하고
-- 급여가 250만원 이상이면 직급을 '대리'로 표시하고
-- 나머지는 '사원'으로 표시
SELECT ename, salary,
       CASE
           WHEN salary >= 3500000 THEN '과장'     
           WHEN salary >= 2500000 AND salary < 3000000 THEN '대리' 
           ELSE '사원'          -- AND salary < 3000000 생략가능!
       END
FROM emp;

-- salary의 개수
SELECT COUNT(salary)
FROM emp;

-- null값에 0을 표시 : 저장x, 보고서형식으로 출력시 정한 NVL값 보여짐
-- NVL(인수1, 인수2) : 인수1이 null이 아니면 인수1 출력, 인수1이 null이면 인수2 출력
SELECT ename 사원명,
    NVL(salary, 0) 급여
FROM emp;


-- > 실습 테이블 생성
CREATE TABLE K1 (
    ID VARCHAR2(3),
    CNT NUMBER(2)
);

INSERT INTO K1 VALUES('가', 5);
INSERT INTO K1 VALUES('나', NULL);
INSERT INTO K1 VALUES('다', 5);
INSERT INTO K1 VALUES('라', NULL);
INSERT INTO K1 VALUES('마', 10);

COMMIT;

SELECT * FROM K1; 
SELECT NVL(CNT, 0) FROM K1;

-- 개수 구하기 (그냥 카운트 한거, NVL처리하고 카운트한거 비교)
SELECT COUNT(CNT) FROM K1; -- 3
SELECT COUNT(NVL(CNT, 0)) FROM K1; -- 5

-- 평균 구하기
SELECT ROUND((SUM(CNT) / COUNT(CNT)), 1)FROM K1; -- 6.7
SELECT SUM(CNT) / COUNT(NVL(CNT,0)) FROM K1; --4

-- 최소값 구하기
SELECT MIN(NVL(CNT, 5)) FROM K1; -- 5


