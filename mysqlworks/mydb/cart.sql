-- 먼저 db를 선택함
use mydb;

create table cart(
	ino int primary key auto_increment,
	item varchar(20),
    price int
);

insert into cart(item, price) values ('두부', 2000);
insert into cart(item, price) values ('신라면', 5000);
insert into cart(item, price) values ('생연어', 20000);
insert into cart(item, price) values ('삼겹살', 10000);
insert into cart(item, price) values ('파채', 3000);
insert into cart(item, price) values ('상추', 4000);

select * from cart;

-- 가격별로 정렬하시오
select * from cart ORDER BY price;

-- 아이템의 총개수, 가격의 평균 구하기
select count(*) "품목 총 개수",
	   round(avg(price), -2) "가격 평균(won)"
from cart;
 

