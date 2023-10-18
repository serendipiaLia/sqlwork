-- VIEW(뷰) 생성
-- UPDATE, DELETE를 사용할 수 있음

-- 주소에 '대한민국'을 포함하는 고객들로 구성된 뷰 만들기

CREATE VIEW vw_customer
AS SELECT * FROM customer WHERE address LIKE '대한민국%';

SELECT * FROM vw_customer;

-- 이름이 김연아를 신유빈으로 변경함
UPDATE vw_customer
    SET name = '신유빈'
    WHERE name = '김연아';

-- 고객 아이디가 3인 고객을 삭제 
DELETE FROM vw_customer
WHERE custid = 3; -- 참조하고 있는 orders테이블이 있어서 삭제 불가 :(

COMMIT;
ROLLBACK;

-- 고객과 고객의 주문에 관한 정보를 검색
CREATE VIEW vw_book_order AS 
SELECT cs.name, bk.bookname, od.saleprice
FROM book bk, customer cs, orders od
WHERE bk.bookid = od.bookid
    AND cs.custid = od.custid;

SELECT * FROM vw_book_order;

-- 뷰 테이블 삭제
DROP VIEW vw_customer;
-- 뷰 테이블 유지, 데이터삭제
TRUNCATE TABLE vw_customer;


