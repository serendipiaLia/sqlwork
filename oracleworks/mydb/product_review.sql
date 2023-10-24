-- product_review 테이블 생성
CREATE TABLE product_review(
    review_no NUMBER PRIMARY KEY, -- 리뷰번호 / 자동순번 되기에 number
    product_code CHAR(6) NOT NULL, -- 상품코드
    member_id VARCHAR2(20) NOT NULL, -- 회원아이디
    content CLOB NOT NULL, -- 리뷰내용 / CLOB(Character Large Of Byte) 문자형 : 4GB까지 사용가능
    regdate DATE DEFAULT SYSDATE, --작성일
    FOREIGN KEY(product_code) REFERENCES product(product_code) -- FK
);

-- 시퀀스 생성 (자동순번)
CREATE SEQUENCE seq_rno NOCACHE;

-- 데이터 생성
INSERT INTO product_review
(review_no, product_code, member_id, content)
VALUES(seq_rno.NEXTVAL, '10001', 'today10', '무소음인데 소음이 조금 있는 듯...'); 

INSERT INTO product_review
(review_no, product_code, member_id, content)
VALUES(seq_rno.NEXTVAL, '10001', 'cloud100', '무선이라 정말 편하네요 :>'); 

INSERT INTO product_review
(review_no, product_code, member_id, content)
VALUES(seq_rno.NEXTVAL, '10002', 'sky123', '게임할 맛 납니다!'); 

COMMIT;
SELECT * FROM product_review;

-- 상품코드가 '10001'이고, 회원 아이디가 'cloud100'인 상품의 정보를 출력하시오
SELECT * FROM product_review
WHERE product_code = '10001' AND member_id = 'cloud100';

-- 상품 아이템 3개, 리뷰있는 아이템 2개
-- 리뷰가 있는 상품을 검색하시오 (동등 조인) AND조건
-- 조건일치 : a테이블의 기본키 = b테이블의 외래키
SELECT * FROM product a, product_review b
WHERE a.product_code = b.product_code;

-- 표준방식 : 내부조인(INNER JOIN)
SELECT * FROM product a JOIN product_review b
ON a.product_code = b.product_code;

-- 리뷰의 유무에 관계없이 상품의 정보를 검색하시오
    -- 동등조인 방식 사용 : product의 상품은 모두 출력, review 유무 관계없음
    SELECT * FROM product a, product_review b
    WHERE a.product_code = b.product_code(+); -- review 없으면 null로 출력
    
    -- 표준 방식(외부 조인 : OUTER JOIN)
    -- OUTER 생략가능(LEFT JOIN / RIGHT JOIN)
    SELECT * FROM product a LEFT JOIN product_review b
    ON a.product_code = b.product_code;
    
    SELECT b.product_code, b.product_name, b.price, a.member_id, a.content, a.regdate
    FROM product_review a RIGHT JOIN product b
    ON a.product_code = b.product_code;
       
-- 테이블 유지, 데이터 전체삭제
TRUNCATE TABLE product_review;
-- 시퀀스 삭제
DROP SEQUENCE seq_rno; 

