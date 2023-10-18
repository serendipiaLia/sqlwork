-- 조인 연습
-- product, product_review Table 활용
SELECT * FROM product;
SELECT * FROM product_review;

-- <리뷰가 있는 상품의 정보를 검색하시오>

-- 동등 조인 (오라클 방식)
-- 리뷰 테이블에 product_name 칼럼 출력 
-- product, product_review Table 연결 키 : product_code
-- product_name : product / product_review
SELECT b.review_no, b.product_code, a.product_name, b.content, b.regdate
FROM product a, product_review b
WHERE a.product_code = b.product_code;
    -- 리뷰테이블(b) 내용 다 나오게 하기 b.*
    SELECT a.product_name, b.*
    FROM product a, product_review b
    WHERE a.product_code = b.product_code;

--ANSI(미국협회)조인 - STANDARD JOIN(표준 조인)
-- 내부조인(INNER JOIN) : FROM절 '='대신 JOIN, 'WHERE'대신 ON / INNER 생략가능
SELECT b.review_no, b.product_code, a.product_name, b.content, b.regdate
FROM product a JOIN product_review b
ON a.product_code = b.product_code; 

-- 외부조인(LEFT, RIGHT, OUTER 조인) / OUTER 생략가능
-- 리뷰의 유무와 상관없이 모든 상품의 정보를 검색  
SELECT a.product_name, b.review_no, b.product_code, b.content, b.regdate
FROM product a LEFT JOIN product_review b
ON a.product_code = b.product_code; 

-- 리뷰가 없는 상품의 이름 검색
SELECT a.product_name "상품 후기가 없는 제품"
FROM product a LEFT JOIN product_review b
ON a.product_code = b.product_code
WHERE b.content IS NULL;

-- 상품 리뷰테이블(product)review에 product_name칼럼 추가
-- Subquery(스칼라 서브쿼리 사용): 한 칼럼만 반환됨(=A), SELECT절에서 사용
SELECT A.review_no, A.product_code,
(SELECT B.product_name FROM product B 
    WHERE A.product_code = B.product_code)product_name,
      A.content, A.member_id
FROM product_review A; -- 한 칼럼'A'만 반환됨