-- DB자료가 저장되어 있으면, 해당 자료파일이 아니여도 어디서든 검색 가능
SELECT * FROM orders;

-- 주문 테이블의 칼럼, 자료형 구조
DESC orders;

-- 통계 함수 : 개수(COUNT), 합계(SUM), 평균(AVG), 최대값(MAX), 최소값(MIN)
    -- COUNT(*) : '*' 모든 칼럼 명
    -- COUNT(칼럼명) : 칼럼의 개수 
    SELECT COUNT(*) AS 총판매건수
    FROM orders; 
    
    SELECT COUNT(*) AS 총고객수, COUNT(phone) 
    AS 전화번호수 FROM customer;
    
    -- phone칼럼에 null자료 있으면 개수 오류
    SELECT COUNT(phone) AS 번호 FROM customer; 

-- 합계(SUM), 평균(AVG)
    SELECT SUM(saleprice) AS 총판매액,
           AVG(saleprice) AS 총평균액
           FROM orders;

