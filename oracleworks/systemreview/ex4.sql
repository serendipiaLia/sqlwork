-- ex4 테이블 생성

CREATE TABLE ex4(
    id VARCHAR2(10) PRIMARY KEY, -- 기본키 제약조건
    password VARCHAR2(10) NOT NULL
);

INSERT INTO ex4 VALUES ('sky2003', 'PW1234');
INSERT INTO ex4 VALUES ('sky2003', 'PW5678'); -- 무결성 제약조건 위배 - 삽입 불가
INSERT INTO ex4 VALUES ('today1006' , 'PW9000', 25); 
INSERT INTO ex4 (id, password) VALUES ('today321' , 'pw3456');
-- 자료형의 크기(10)보다 큰 데이터(11자 - pw345678910)입력 불가 
INSERT INTO ex4 (id, password, age) VALUES ('today321' , 'pw345678910', 23);
-- 하기에서 자료형 크기(12)변경후 출력
INSERT INTO ex4 (id, password, age) VALUES ('today1010' , 'pw789101234', 24); 


COMMIT;

-- 나이(age) 칼럼 추가
ALTER TABLE ex4 ADD age NUMBER(3);

-- 자료형의 크기 변경(Varchar2 10 -> 12)
ALTER TABLE ex4 MODIFY password VARCHAR2(12);

SELECT * FROM ex4;

