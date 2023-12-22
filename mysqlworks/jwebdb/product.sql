use jwebdb;

create table product(
	p_no int primary key auto_increment, -- 일련번호
    p_id varchar(10) unique, -- 상품 코드
	p_name varchar(30) not null, -- 상품 명
    p_price int not null,	-- 상품 가격
    p_description text not null, -- 상품 설명
    p_category varchar(30), -- 상품 분류
    p_stock long, -- 재고 수
    p_condition varchar(20), -- 상품 상태(신상품, 중고품)
    p_image varchar(30), -- 상품 이미지
    regdate datetime default now(), -- 등록일
    updatedate datetime -- 수정일
);

select * from product;

insert into product(p_id, p_name, p_price, p_description, p_category, p_stock, p_condition, p_image) 
values ('p1234', 'iPhone13pro', 1300000, '저장용량 256GB, 카메라 렌즈 3개(인덕션같음)', 'smart phone', '10000', '신상품', 'p1234.png'); 

truncate table product;