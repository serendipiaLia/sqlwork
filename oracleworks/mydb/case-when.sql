-- 조건 처리 함수 (TABEL : mytest, mytest2)
CREATE TABLE mytest(
    class VARCHAR2(1), -- 반 번호
    name VARCHAR2(6) -- 이름
);

INSERT INTO mytest VALUES('A', '조조');
INSERT INTO mytest VALUES('A', '조조');
INSERT INTO mytest VALUES('A', '조조');
INSERT INTO mytest VALUES('B', '유비');
INSERT INTO mytest VALUES('B', '관우');
INSERT INTO mytest VALUES('C', '여포');
INSERT INTO mytest VALUES('C', '여포');

COMMIT;
select * from mytest;

-- 반 별 인원수 계산 > GROUP BY()사용
SELECT class, COUNT(*) "반 별 인원수"
FROM mytest
GROUP BY class;

-- 반 별 인원수, 반복되는 이름 제거 후 계산 -> 중복제거
SELECT class, COUNT(DISTINCT name) "중복제거 인원수"
FROM mytest
GROUP BY class;


-- DECODE(칼럼명, 조건, 참/거짓)사용해 인원 수 계산
    SELECT COUNT(DECODE(class, 'A', 1)) "class A",
           COUNT(DECODE(class, 'B', 1)) "class B", 
           COUNT(DECODE(class, 'C', 1)) "class C" 
    FROM mytest;
    
   
-- CASE 
    -- 조건 구문 (if ~ else와 유사)
    /*
        CASE WHEN 조건1 THEN 결과1 
             WHEN 조건2 THEN 결과2 
             ELSE 결과3
        END 칼럼명
    */ 
SELECT 
    COUNT (CASE WHEN class='A' THEN 1 END) "class A",
    COUNT (CASE WHEN class='B' THEN 1 END) "class B",
    COUNT (CASE WHEN class='C' THEN 1 END) "class C"      
FROM mytest;
-------------------------------------------------------------------------
CREATE TABLE mytest2(
    COL1 NUMBER(1)
);
INSERT INTO mytest2 VALUES(NULL);
INSERT INTO mytest2 VALUES(0);
INSERT INTO mytest2 VALUES(NULL);
INSERT INTO mytest2 VALUES(0);
INSERT INTO mytest2 VALUES(NULL);

select * from mytest2;
-- mytest2 조건 처리
-- COL1의 데이터가 null이면 -1으로 표기 >> DECODE함수사용
SELECT DECODE(COL1, NULL, -1, COL1) DATA1
FROM mytest2;
    -- 별칭 T 사용
SELECT DECODE(T.COL1, NULL, -1, T.COL1) DATA1
FROM mytest2 T;

    -- CASE WHEN 표현식 사용
SELECT DECODE(COL1, NULL, -1, COL1) DATA1,
CASE
    WHEN COL1 IS NULL THEN -1
    ELSE COL1
END DATA2 FROM mytest2;



