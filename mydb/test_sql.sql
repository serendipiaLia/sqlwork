-- 실습 문제 
SELECT * FROM customer;

-- 1/ 모든 고객의 이름과 주소 검색
SELECT name, address FROM customer;

-- 2/ 모든 고객의 이름o, 주소, 전화번호 검색
SELECT name, address, phone FROM customer;

-- 3/ 주소가 '영국'인 고객 검색
SELECT custid,name,address FROM customer
WHERE address LIKE '%영국%';

-- 4/ 고객의 이름이 '김연아' 혹은 '안산'인 고객 검색
SELECT * FROM customer
WHERE name IN('김연아', '안산');

SELECT * FROM customer
WHERE name = '김연아' OR name = '안산';

-- 5/ 주소가 '대한민국'이 아닌 고객 검색
SELECT custid, name, address FROM customer
WHERE address NOT LIKE '%대한민국%';

-- 6/ 전화번호가 없는 고객 검색
SELECT * FROM customer
WHERE phone IS NULL;
    -- 전화번호가 있는 고객
    SELECT * FROM customer
    WHERE phone IS NOT NULL;

-- 7/ 고객을 이름순으로 정렬 (오름차순)
SELECT * FROM customer ORDER BY name;
    -- 내림차순
    SELECT * FROM customer ORDER BY name DESC;

-- 8/ 고객의 총 인원수
SELECT COUNT(*) AS 총인원수 FROM customer;
