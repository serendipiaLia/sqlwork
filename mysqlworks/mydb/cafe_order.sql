-- 제2 정규화 (음료, 주문테이블)
CREATE TABLE drink(
	drink_code varchar(3) primary key, -- PK 음료 코드
    drink_name varchar(20) not null -- 음료 이름
);

CREATE TABLE cafe_order(
	order_no int primary key auto_increment, -- 주문 번호 
    drink_code varchar(3) not null, -- 음료 코드 FK
    order_cnt int not null, -- 주문 수량
    foreign key(drink_code) references drink(drink_code) -- FK 사용문
    on delete cascade -- 부모키의 데이터가 삭제되면 자식 데이터도 삭제 됨
);

-- drink 데이터 자료 추가
 INSERT INTO drink VALUES ('A01', 'iced-Americano');
 INSERT INTO drink VALUES ('B01', 'hot-cafe latte');
 INSERT INTO drink VALUES ('C01', 'hot-Yuja mint tea');
 
 -- cafe_order 자료 추가
 INSERT INTO cafe_order(drink_code, order_cnt) VALUES('A01', 3);
 INSERT INTO cafe_order(drink_code, order_cnt) VALUES('B01', 1);
 INSERT INTO cafe_order(drink_code, order_cnt) VALUES('A01', 2);
 
 
 select * from drink;
 select * from cafe_order;
 
 -- 음료 테이블의 음료'B01' 삭제
 DELETE FROM drink WHERE drink_code = 'B01';
 
-- 내부조인
select a.*, b.order_no, b.order_cnt from drink a join cafe_order b 
ON a.drink_code = b.drink_code; 

-- 외부조인(left, right join ~ on)
-- 주문에 관계없이 주문정보와 음료정보를 모두 출력하시오
select a.*, b.order_no, b. order_cnt
 from drink a left join cafe_order b ON a.drink_code = b.drink_code;
 
 -- 주문이 없는 상품을 검색하시오('C01'이 나와야함)
 select a.* from drink a left join cafe_order b
 ON a.drink_code = b.drink_code where b.order_no is null;
 
 
 