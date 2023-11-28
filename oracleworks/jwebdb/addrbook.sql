-- addrbook table 생성
CREATE TABLE addrbook(
    bnum NUMBER PRIMARY KEY,
    username VARCHAR2(20) NOT NULL,
    tel VARCHAR2(20),
    email VARCHAR2(30) UNIQUE, -- UNIQUE는 이메일 중복 방지!!
    gender VARCHAR2(6), -- 한글1자 = 3바이트
    regdate TIMESTAMP DEFAULT SYSTIMESTAMP
);

CREATE SEQUENCE seq_bnum NOCACHE; -- 자동 순번

-- DB테스트!
INSERT INTO addrbook(bnum, username, tel, email, gender) 
VALUES (seq_bnum.NEXTVAL, '이나경', '010-1234-5678', 'test@kh.kr', '여');
-- 이메일 중복 체크 (UNIQUE >> 무결성 제약 조건 위배)
INSERT INTO addrbook(bnum, username, tel, email, gender) 
VALUES (seq_bnum.NEXTVAL, '임예은', '010-1234-1234', 'test@kh.kr', '여');

COMMIT;

SELECT * FROM addrbook;

DROP TABLE addrbook;
DROP SEQUENCE seq_bnum;

-- 이메일이 khit@kh.kr 인 유저 찾기
SELECT email FROM addrbook
WHERE email = 'khit@kh.kr';

-- 상세보기 유저 삭제
DELETE FROM addrbook WHERE bnum = 6;

-- 상세보기 유저 수정
UPDATE addrbook SET email = 'lia@kh.kr'
WHERE bnum = 1;
