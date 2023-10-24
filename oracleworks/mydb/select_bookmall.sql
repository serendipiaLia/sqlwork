-- DB자료가 저장되어 있으면, 해당 자료파일이 아니여도 어디서든 검색 가능 !!
SELECT * FROM orders;
SELECT * FROM customer;

-- 주문 테이블의 칼럼, 자료형 구조
DESC orders;

-- 통계 함수 : 개수(COUNT), 합계(SUM), 평균(AVG), 최대값(MAX), 최소값(MIN)
    -- COUNT(*) : '*' 모든 칼럼 개수
    -- COUNT(칼럼명) : 칼럼의 개수 
    SELECT COUNT(*) AS 총판매건수 FROM orders; 
    
    SELECT COUNT(*) AS 총고객수, COUNT(phone) AS 전화번호수 FROM customer;
    
    -- phone칼럼에 null자료 있으면 개수 오류
    SELECT COUNT(phone) AS 번호 FROM customer; 

-- 합계(SUM), 평균(AVG)
 SELECT SUM(saleprice) AS 총판매액,
        AVG(saleprice) AS 총평균액
        FROM orders;
    -- 고객이 주문한 도서의 총 판매액 계산
    SELECT SUM(saleprice) AS 총판매액 FROM orders;
    -- 고객별로 주문한 도서의 총 판매액 계산 : GROUP BY 사용
        -- GROUP BY 칼럼명 : 그룹으로 묶을 때 사용 
        SELECT custid, 
             COUNT(*) AS 도서수량,
             SUM(saleprice) AS 총판매액 
             FROM orders GROUP BY custid;
    -- 도서수량이 3권 이상인 자료 검색
        -- GROUP BY 절에서 조건이 있을때 HAVING절 사용
        SELECT custid, 
             COUNT(*) AS 도서수량,
             SUM(saleprice) AS 총판매액 
             FROM orders GROUP BY custid
             HAVING COUNT(*) >= 3;
             -- AND SUM(saleprice) > 35000;

-- 도서 중에서 최고가격(MAX), 최저가격(MIN) 알기
    SELECT MAX(price) AS 최고가격, MIN(price) AS 최저가격 FROM book;
 
-- '3번 고객'(안산)이 주문한 도서의 총 판매액 구하기
SELECT SUM(saleprice) AS 총판매액 FROM orders WHERE custid = 3;
-- '3번 고객'의 아이디와 주문 가격 목록을 검색
SELECT custid, saleprice FROM orders WHERE custid = 3;

  
-- JOIN 
-- 동등 조인(EQUL JOIN) : equal(=)을 사용하는 조인
-- 테이블A.칼럼명 = 테이블B.칼럼명 (칼럼명-FK)
    
    -- '3번 고객'의 아이디와 주문 가격 목록을 검색 + 구매한 책 이름도 검색
    -- bookname은 다른 테이블에 있으므로 join해주기!
    SELECT custid, bookname, saleprice FROM orders, book 
    WHERE orders.bookid = book.bookid AND custid = 3;
    
    -- 고객의 이름과 고객이 주문한 책의 가격을 검색 (customer,order Join!)
    SELECT customer.name, orders.saleprice FROM customer, orders
    WHERE customer.custid = orders.custid;
    
    -- 별칭 사용(cus, ord) Join + ORDER BY 정렬(고객이름 ASC, 주문가격DESC) 
    SELECT cus.name, ord.saleprice
    FROM customer cus, orders ord
    WHERE cus.custid = ord.custid
    ORDER BY cus.name, ord.saleprice DESC;

