-- 날짜 칼럼
-- 1. creat_date DATE DEFAULT SYSDATE (현재 날짜와 시간)
-- 2. hire_date DATE (특정날짜)

-- 현재 날짜
SELECT SYSDATE  FROM dual;

-- 현재 날짜와 시간
SELECT SYSTIMESTAMP FROM dual;

-- 20일전의 날짜 출력
SELECT SYSDATE -20 FROM dual;

-- 특정날짜에서 20일 전의 날짜 출력
SELECT TO_DATE('2023-10-25') -20 FROM dual;

-- 서점의 주문 확정일자
SELECT orderid 주문번호,
       orderdate 주문일,
       To_date(orderdate) +10 확정일
FROM orders;

----test1-------------------
CREATE TABLE date_test1(
    reg_date DATE,
    hire_date DATE
);

-- 추가1
INSERT INTO date_test1 VALUES(SYSDATE, '2023-11-01');
INSERT INTO date_test1 VALUES(SYSDATE, to_date('2023-11-01'));

SELECT * FROM date_test1;
DROP TABLE date_test;

--test2 : 자바 클래스와 연동 시 사용 -----------------------------
CREATE TABLE date_test2(
    reg_date DATE,
    hire_date DATE
);
-- 추가2
INSERT INTO date_test2(hire_date) VALUES('2023-11-01');
INSERT INTO date_test2(hire_date) VALUES(To_date ('2023-11-01'));

SELECT * FROM date_test2;