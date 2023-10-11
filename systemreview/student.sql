-- 학생 테이블 생성
CREATE TABLE student (
    snumber NUMBER PRIMARY KEY,
    sname VARCHAR2(20) NOT NULL,
    age NUMBER(2) NOT NULL,
    gender VARCHAR2(6) NOT NULL,
    address VARCHAR2(50),
    mname VARCHAR2(30) NOT NULL,
    FOREIGN KEY (mname) REFERENCES major (mname) -- mname이 외래키 임을 밝힘
);

-- 학생 자료 추가 
INSERT INTO student(snumber, sname, age, gender, address, mname)
VALUES (1001, '이나경', 25, '여자', '서울시 강서구', '소프트웨어학과');

INSERT INTO student(snumber, sname, age, gender, address, mname)
VALUES (1002, '서지훈', 30, '남자', '인천시 남구', '전기전자공학과');

INSERT INTO student(snumber, sname, age, gender, address, mname)
VALUES (1003, '임예은', 24, '여자', ' ', '화학공학과'); -- Not null이 아니므로 ''

-- 부모키에 없는 데이터는 삽입 이상 발생 (회계학과 없음)
INSERT INTO student(snumber, sname, age, gender, address, mname)
VALUES (1003, '이강인', 22, '남자', '서울시 동대문구', '회계학과');

-- 전체 데이터 조회
SELECT * FROM student;

COMMIT;

-- 이름이 이나경인 학생의 이름과 나이를 조회하기 
-- 조건문 WHERE
SELECT sname, age FROM student
WHERE sname = '이나경';
    -- AS, 별칭사용
    SELECT sname AS 학생이름, age AS 나이 FROM student
    WHERE sname = '이나경';

-- 이름에 '임'이 포함된 학생의 모든 정보 출력 (문자열 LIKE)
SELECT * FROM student
WHERE sname LIKE '임%'; -- '예' = '%예%' /'은' = '%은'

-- 나이가 30세 이상이고, 성별이 남자인 학생의 모든 정보 출력
SELECT * FROM student
WHERE age >= 30 AND gender = '남자';

-- 주소가 없는 학생의 정보를 출력 및 수정
    -- '': NULL 데이터가없음 / '(한칸띄기)' : 데이터가 공백
    SELECT * FROM student
    WHERE address = ' '; -- WHERE address IS NULL;

    -- 주소가 ' '인 데이터에 '수원시 영통구'로 입력(수정) : UPDATE
    UPDATE student SET address = '수원시 영통구'
    WHERE address = ' '; -- null일경우 : WHERE address IS NULL;

-- 정렬하기 : ORDER BY (오름차순 : ASC, 내림차순 : DESC)
    -- 학생의 나이가 적은 순으로 정렬하여 출력하기!
    SELECT * FROM student
    ORDER BY age ASC; -- ASC 생략해도 오름차순! 
    -- 학생의 나이가 많은 순으로 정렬하여 출력하기!
    SELECT * FROM student
    ORDER BY age DESC;

    -- 학교명이 '전기전자공학과' 학생중에서 나이가 많은 순으로 정렬하여 출력하기
    SELECT * FROM student
    WHERE mname = '전기전자공학과'
    ORDER BY age DESC;
    
ROLLBACK; -- 커밋하기전에 실행하면 취소, 복원이 됨

COMMIT;




