-- 조인Join : 두 테이블을 연결하는 기능
-- 동등조인(equi join/inner join) : 조인 조건이 정확히 일치하는 경우에 결과 출력
-- 외부조인(outer join) : 조인 조건이 정확히 일치하지 않아도 모든 결과를 출력 

-- 고객(customer)과 고객의 주문(orders)에 관한 데이터를 모두 검색
SELECT cus.name, ord.saleprice  
FROM customer cus, orders ord 
WHERE cus.custid = ord.custid
ORDER BY name; -- 이름으로 정렬(자동으로 그룹화 됨)

-- 외부조인(OUTER JOIN) 
-- JOIN 조건에 일치(충족)하지 않아도 모두 출력

    -- 주문하지 않은 데이터도 모두 검색
    SELECT cus.name, ord.saleprice  
    FROM customer cus, orders ord 
    WHERE cus.custid = ord.custid(+) -- (+) : 외부조인
    ORDER BY name;
    -- 고객(customer)과 고객의 주문(orders)에 관한 데이터중
    -- 주문되지 않은 데이터와 
    -- 도서의 판매가격을 검색
    SELECT cus.name, ord.saleprice
    FROM customer cus LEFT OUTER JOIN orders ord
        ON cus.custid = ord.custid
    ORDER BY cus.name;

-- 고객의 이름, 주문한 도서 이름, 주문일, 주문금액
SELECT cus.name, bk.bookname, ord.orderdate, ord.saleprice
FROM customer cus, book bk, orders ord
WHERE cus.custid = ord.custid AND bk.bookid = ord.bookid; -- 기본키 = 외래키

-- 고객(customer)과 고객의 주문(orders)에 관한 데이터를 모두 검색
    -- 조건 : '박지성' 고객의 주문내역을 검색
    SELECT cus.name, ord.saleprice
    FROM customer cus, orders ord
    WHERE cus.custid = ord.custid AND cus.name = '박지성'
    ORDER BY name;

    -- 주문 금액의 총액을 출력 (GROUP BY 결과)
    -- 김연아 고객의 주문 총 금액을 출력 (HAVING으로 제한)
    SELECT cus.custid, cus.name, SUM(ord.saleprice)
    FROM customer cus, orders ord
    WHERE cus.custid = ord.custid
    GROUP BY cus.custid, cus.name
        HAVING cus.name = '김연아'
    ORDER BY cus.name;

-- 표준 조인(ANSI SQL)
-- 내부 조인(INNER JOIN)

    -- 고객(customer)과 고객의 주문(orders)에 관한 데이터 중 
    -- 고객의 이름과 고객이 주문한 도서의 판매가격 검색
    SELECT cus.name, ord.saleprice
     FROM customer cus INNER JOIN orders ord
     ON cus.custid = ord.custid
        ORDER BY cus.name;
        

    