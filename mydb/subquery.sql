-- 서브 쿼리(Sub Query): 부속 질의(중첩 질의)

-- 도서 중 가격이 가장 높은 가격을 검색
    -- MAX(price) : 35000
    SELECT MAX(price) FROM book;
    
-- 도서 중에서 가장 비싼 도서의 이름을 검색
SELECT bookname, price FROM book
WHERE price = (SELECT MAX(price) FROM book);
    
-- 도서를 구매한 적이 있는 고객의 이름 검색
SELECT custid FROM orders;   
/* SELECT name
FROM customer
WHERE custid IN (1, 2, 3, 4); */
SELECT name
FROM customer
WHERE custid IN (SELECT custid FROM orders);
    -- 조인 방식
    SELECT DISTINCT cus.name 
    FROM customer cus, orders ord
    WHERE cus.custid = ord.custid;