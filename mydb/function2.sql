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