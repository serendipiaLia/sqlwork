-- 카페 만들기 (주문 / 음료)
-- 주문 테이블 cafe_order
CREATE TABLE cafe_order(
    order_no VARCHAR2(10) PRIMARY KEY, -- 주문번호
    drink_code VARCHAR2(3) NOT NULL , -- 음료코드
    order_cnt NUMBER NOT NULL   -- 주문수량
);

INSERT INTO cafe_order VALUES ('2023100101', 'A01', 3);
INSERT INTO cafe_order VALUES ('2023100102', 'B01', 1);
INSERT INTO cafe_order VALUES ('2023100123', 'A01', 2);

-- 음료 테이블 drink
CREATE TABLE drink(
    drink_code VARCHAR2(3) PRIMARY KEY, -- 음료코드
    drink_name VARCHAR2(30) NOT NULL -- 음료명
);

INSERT INTO drink VALUES ('A01', '아메리카노');
INSERT INTO drink VALUES ('B01', '카페라떼');

COMMIT;
SELECT * FROM cafe_order;
SELECT * FROM drink;

-- 주문번호, 음료코드, 음료명, 주문수량 모두 출력 
-- 동등조인 
SELECT a.order_no, a.drink_code, b.drink_name, a.order_cnt
FROM cafe_order a, drink b
WHERE a.drink_code = b.drink_code;

-- 내부조인(INNER JOIN)
SELECT a.order_no, a.drink_code, b.drink_name, a.order_cnt
FROM cafe_order a JOIN drink b
ON a.drink_code = b.drink_code;

    -- USING
    SELECT a.order_no, drink_code, b.drink_name, a.order_cnt
    FROM cafe_order a JOIN drink b
    USING (drink_code); 





