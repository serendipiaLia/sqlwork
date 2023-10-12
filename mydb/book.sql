-- bookmall 구축
-- book 테이블 생성
CREATE TABLE book (
    bookid NUMBER PRIMARY KEY,
    bookname VARCHAR2(60) NOT NULL,
    publisher VARCHAR2(60) NOT NULL,
    price NUMBER NOT NULL
);

-- 도서 자료 추가
INSERT INTO book VALUES (1, '축구의 역사', '굿스포츠', 7000);
INSERT INTO book VALUES (2, '축구아는 여자', '나무수', 13000);
INSERT INTO book VALUES (3, '축구의 이해', '대한미디어', 22000);
INSERT INTO book VALUES (4, '골프 바이블', '대한미디어', 35000);
INSERT INTO book VALUES (5, '피겨 교본', '굿스포츠', 8000);
INSERT INTO book VALUES (6, '양궁의 실제', '굿스포츠', 6000);
INSERT INTO book VALUES (7, '야구의 추억', '이상미디어', 20000);
INSERT INTO book VALUES (8, '야구를 부탁해', '이상미디어', 13000);
INSERT INTO book VALUES (9, '올림픽 이야기', '삼성당', 7500);
INSERT INTO book VALUES (10, 'Olympic Champions', 'Person', 13000);

COMMIT;

-- <검색>
-- 전체 도서 검색
SELECT * FROM book;

-- 모든 도서의 이름과 가격 검색
SELECT bookname AS 도서명, price AS 도서가격 FROM book;

-- 도서 테이블에 있는 모든 출판사 검색 
SELECT publisher AS 출판사 FROM book;
    -- 중복 제거 : DISTINCT
    SELECT DISTINCT publisher FROM book;

-- 가격이 20000원 미만인 도서검색 + 오름차순정렬 ASC
SELECT * FROM book
WHERE price < 20000
 -- ASC
  ORDER BY price;
  
-- 가격이 10000원 이상, 20000원 이하인 도서 검색 
SELECT * FROM book
WHERE price >= 10000 AND price <= 20000;
    -- BETWEEN A AND B : A이상 B이하 비교구문 숙어, 미만초과 아님!
    SELECT * FROM book
    WHERE price BETWEEN 10000 AND 20000;

-- '축구의 역사'를 출간한 출판사 검색
SELECT publisher FROM book
WHERE bookname = '축구의 역사';
    -- LIKE사용 : ~가 포함된 내용 검색 
    SELECT publisher FROM book
    WHERE bookname LIKE '축구의 역사';

-- 도서 이름에 '축구'가 포함된 출판사 검색
SELECT bookname, publisher FROM book
WHERE bookname LIKE '%축구%';
 
-- 축구에 관한 도서 중 가격이 20000원 이상인 도서 검색
SELECT * FROM book
WHERE bookname LIKE '%축구%' AND price >= 20000;

-- <정렬>
-- 도서를 이름 순으로 정렬(오름차순) 
SELECT * FROM book
ORDER BY bookname ASC; --ASC 생략가능
    --내림차순
    SELECT * FROM book
    ORDER BY bookname DESC; 
    
-- 도서를 가격순으로 검색(오름차순)
SELECT * FROM book
ORDER BY price ASC; --내림차순 : ORDER BY price DESC;
    --가격이 같으면 내림차순으로
    SELECT * FROM book
    ORDER BY price ASC, bookname DESC;
