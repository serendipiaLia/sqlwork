-- bookmall
select * from book;

-- 도서를 이름 순으로 정렬
select * from book order by bookname;

-- 도서를 가격이 높은 순으로 정렬
select * from book order by price DESC;

-- 도서 이름에 '축구'가 포함된 출판사 검색
select publisher from book where bookname like '%축구%';

-- 도서 이름에 '축구'가 포함되고, 가격이 10000원 이상인 도서검색
select * from book where bookname like '%축구%' and price >= 10000;

-- 도서 테이블에 있는 중복된 이름은 제외한 모든 출판사를 검색
select distinct publisher from book;

-- 도서 가격이 10000원 이상이고 20000원 이하인 도서 검색
select * from book where price >= 10000 and price <=20000;  

select * from book where price between 10000 and 20000;

-- 가격이 13000원이 아닌 책
select * from book where price <> 13000;
select * from book where price != 13000;


select * from customer;
-- 고객을 이름순으로 정렬하시오 (오름차순)
select * from customer order by name;

-- 전화번호가 없는 고객을 검색하시오
select * from customer where phone = '';

-- 주소가 대한민국인 고객을 검색하시오
select * from customer where address like '%대한민국%';
	-- 주소가 대한민국이 아닌 고객을 검색하시오
	select * from customer where address not like '%대한민국%';

-- 고객의 총 인원을 구하시오
select count(*) as 총_인원 from customer;

-- 도서 가격이 가장 높은 도서를 검색하시오 -> 서브쿼리 
select * from book where price = (select max(price) from book);

