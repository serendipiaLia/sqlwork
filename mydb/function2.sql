-- 날짜와 시간 함수

-- 현재 날짜 출력 : SYSDATE
SELECT SYSDATE FROM dual; 

-- 현재 날짜와 시간 : SYSTIMESTAMP
SELECT SYSTIMESTAMP FROM dual;

-- 현재 날짜 형식 변환
SELECT TO_CHAR(SYSDATE, 'YYYY') AS 년도,
       TO_CHAR(SYSDATE, 'MM')AS 월,
       TO_CHAR(SYSDATE, 'DD')AS 일,
       TO_CHAR(SYSDATE, 'YYYY-MM-DD')AS today날짜
FROM dual;
-- 시간 형식 변환
SELECT TO_CHAR(SYSDATE, 'HH:MI:SS') AS 시간형식,
       TO_CHAR(SYSTIMESTAMP, 'YYYY/MM/DD_HH:MI:SS') AS 날짜와시간
FROM dual;

-- 현재날짜에서 10일전의 날짜 출력
SELECT SYSDATE -10 FROM dual;
    -- 10일후의 날짜
    SELECT SYSDATE +10 FROM dual;

-- 특정날짜,TO_DATE()에서 10일전의 날짜 출력
SELECT TO_DATE('2023-09-11') -10 FROM dual;
    -- 10일 후의 날짜
SELECT TO_DATE('2023-09-11') +10 FROM dual;

-- 월을 더하고 빼기 : ADD_MONTHS()
SELECT ADD_MONTHS(SYSDATE, 3)AS 결과 FROM dual; -- 24/01/13
SELECT ADD_MONTHS(SYSDATE, -3)AS 결과 FROM dual; -- 23/07/13
-- 특정한 날짜(월)에서 빼기
SELECT ADD_MONTHS(TO_DATE('2023/5/1'), -3)AS 결과 FROM dual; -- 23/02/01

-- 개월 수 계산하기 : MONTHS_BETWEEN(종료일, 시작일)
    -- 총 개월 수 반올림 : ROUND(숫자, 자리수) 사용
SELECT 
    ROUND(MONTHS_BETWEEN(SYSDATE, TO_DATE('2023-1-31')),0) AS 총_개월_수
FROM dual;
    
SELECT 
    ROUND(MONTHS_BETWEEN(TO_DATE('2023-12-31'), 
                         TO_DATE('2023-1-1')),0) AS 총_개월_수
FROM dual;


-- orders 테이블에서 날짜 시간함수 사용
 
-- 서점은 주문일로부터 10일 후 매출을 확정한다. 각 주문의 확정일자는?
SELECT orderid 주문번호, orderdate 주문일,
    TO_DATE(orderdate) +10 확정일 
FROM orders; 

-- 주문일에 3개월 더하고, 1개월 빼기
SELECT orderid 주문번호, orderdate 주문일,
    ADD_MONTHS(orderdate, 3) AS 세달후,
    ADD_MONTHS(orderdate, -1) AS 한달전
FROM orders; 

    -- 주문번호가 6에서 10번까지 출력
    SELECT orderid 주문번호, orderdate 주문일,
     ADD_MONTHS(orderdate, 3) AS 세달후,
     ADD_MONTHS(orderdate, -1) AS 한달전
    FROM orders WHERE orderid BETWEEN 6 AND 10;
             -- WHERE orderid >= 6 AND orderid <=10;
             
-- 주문번호가 10인 도서의 주문일로부터 오늘까지의 총 개월수를 구하시오
SELECT orderid 주문번호, orderdate 주문일,
    ROUND(MONTHS_BETWEEN(SYSDATE, orderdate)) ROUND_총개월수,
    FLOOR(MONTHS_BETWEEN(SYSDATE, orderdate)) FLOOR_총개월수,
    TRUNC(MONTHS_BETWEEN(SYSDATE, orderdate), 0) TRUNC_총개월수
FROM orders WHERE orderid = 10; 
  
-- <변환 함수> : TO_NUMBER() -> 문자를 숫자로 변환
SELECT TO_NUMBER('320')FROM dual; 



