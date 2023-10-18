-- 서브 쿼리(Sub Query): 부속 질의(중첩 질의)

-- 도서 중 가격이 가장 높은 가격을 검색
    -- MAX(price) : 35000
    SELECT MAX(price) FROM book;

--> 단일행 서브쿼리 (결과가 한개)
-- 도서 중에서 가장 비싼 도서의 이름을 검색
SELECT bookname, price FROM book
WHERE price = (SELECT MAX(price) FROM book);
    
-- 도서를 구매한 적이 있는 고객의 id 검색
SELECT custid FROM orders;   
-- 도서를 구매한 적이 있는 1번 고객의 이름 검색
SELECT name FROM customer
WHERE custid = 1;

--> 다중행 서브쿼리 (결과가 다수개)
-- 도서를 구매한 적이 있는 고객의 이름 검색
SELECT name FROM customer
WHERE custid IN(SELECT custid FROM orders);
    
-- 조인 방식
SELECT DISTINCT cus.name 
FROM customer cus, orders ord
WHERE cus.custid = ord.custid;
    
--> FROM절에 있는 서브쿼리 : 인라인뷰 라고도 함

-- 고객의 이름과 고객의 판매액 검색 (customer, orders)
-- 그룹별 : GROUP BY
-- 단, 고객 번호가 2 이하임

    -- 동등 조인 방식
    SELECT a.name, SUM(b.saleprice) FROM customer a, orders b
    WHERE a.custid = b.custid AND a.custid <= 2
    GROUP BY a.name;
        -- HAVING 추가
        SELECT a.name, SUM(b.saleprice) total
        FROM customer a, orders b
        WHERE a.custid = b.custid AND a.custid <= 2
        GROUP BY a.name HAVING SUM(b.saleprice) >= 30000;    
                    -- HAVING에 별칭 사용할 경우도 있음
       
    -- 서브 쿼리 방식
    SELECT a.name, SUM(b.saleprice) 
    FROM (SELECT * FROM customer WHERE custid <=2 ) a, orders b
    WHERE a.custid = b.custid
    GROUP BY a.name; 
       
        /*
         실행순서   
         1. FROM절 테이블명
         2. WHERE, GROUP BY
         3. SELECT절
         4. ORDER BY절
     */
     
   
--> product, product_review 활용
SELECT * FROM product;
SELECT * FROM product_review;
    -- 상품 리뷰 테이블에 있는 상품 이름 검색 / 스칼라 서브쿼리 사용
    -- 스칼라 서브쿼리 : select 절에 있는 select문을 말함
    SELECT r.product_code, 
    (SELECT p.product_name FROM product p 
        WHERE r.product_code = p.product_code)product_name,
        r.member_id, r.content
    FROM product_review r 



