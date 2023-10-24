-- <숫자 타입> 내장 함수
-- 제공 테이블 : dual

-- 절대값 구하기 : ABS()
SELECT ABS(-10) FROM dual; -- 10

-- 반올림 : ROUND(숫자, 자리수)
SELECT ROUND(127.67, 1)FROM dual; -- 소수 첫째 자리로 반올림 / 127.7
SELECT ROUND(127.67, 0)FROM dual; -- 0의자리 = 정수 / 128
SELECT ROUND(127.67, -1)FROM dual; -- 일의 자리로 반올림 / 130
SELECT ROUND(127.67, -2)FROM dual; -- 십의 자리로 반올림 / 100

-- 버림(내림): TRUNC(숫자, 자리수)
SELECT TRUNC(127.67, 1)FROM dual; --- 소수첫째 자리까지 표시(이후 버림) / 127.6
SELECT TRUNC(127.67, 0)FROM dual; -- 127
SELECT TRUNC(127.67, -1)FROM dual; -- 120
SELECT TRUNC(127.67, -2)FROM dual; -- 100

-- 정수로 내림(소수 버림) : FLOOR(실수)
SELECT FLOOR(127.67)FROM dual; -- 127
SELECT FLOOR(127.6)FROM dual; -- 127

-- 거듭제곱 : POWER(밑, 지수)
SELECT POWER(2, 3)FROM dual; -- 8


-- <문자 타입>
-- 제공 테이블 : dual

-- 값을 소문자로 변경하기 : LOWER('문자')
SELECT LOWER('ABCD')FROM dual; -- abcd
-- 값을 대문자로 변경하기 : UPPER('문자')
SELECT UPPER('abcd')FROM dual; -- ABCD

-- 문자열의 일부분을 추출 : SUBSTR('문자열', 인덱스, 자리수)
SELECT SUBSTR('ABCD', 1, 2)FROM dual; -- AB

-- 특정 문자열을 찾아 바꾸기 : REPLACE('문자열',변경 전 문자, 변경 후 문자)
SELECT REPLACE('ABCD', 'C', 'E')FROM dual; -- ABED

-- 문자열의 길이 구하기 : LENGTH('문자열')
SELECT LENGTH('ABCD')FROM dual; -- 4

-- 특정문자로 자리 채우기(ex.주민번호 마스킹) : 
    -- 왼쪽부터 채우기 : LPAD('문자열',특정문자포함길이, 특정문자)
SELECT LPAD ('today', 10, '*')FROM dual; -- *****today
    -- 오른쪽부터 채우기 : RPAD('문자열',특정문자포함길이, 특정문자)
SELECT RPAD ('apple', 10, '*')FROM dual; -- apple*****


-- <orders주문테이블>

--고객별 평균 주문 금액을 100원 단위로 반올림
SELECT custid AS 고객번호,
    SUM(saleprice)AS 합계금액, 
    COUNT(saleprice)AS 주문건수,
    ROUND(AVG(saleprice), -2) AS 평균주문금액 
FROM orders
GROUP BY custid;

-- <book 테이블>

-- 책 제목의 글자 수 LENGTH(bookname)
-- 책 제목의 바이트 수 LENGTHB(bookname) 한글:3byte, 영어/특수문자:1byte
SELECT bookname AS 책제목, 
    LENGTH(bookname)AS 글자수,
    LENGTHB(bookname) AS 바이트수
FROM book;

-- '축구'를 '농구'로 변경하여 검색
SELECT bookname AS 책_제목,
    REPLACE(bookname, '축구', '농구')AS 변경_후_책제목
FROM book;

-- <customer 테이블>

-- 고객 이름별 같은 성을 가진 고객의 인원수를 구하시오.
SELECT SUBSTR(name, 1, 1)AS 성,
    COUNT(*) AS 인원
FROM customer
GROUP BY SUBSTR(name, 1, 1);