-- jweb, member 테이블 생성
CREATE TABLE member(
    mno INT,
    id VARCHAR2(20) NOT NULL UNIQUE,
    passwd VARCHAR2(20) NOT NULL,
    name VARCHAR2(30) NOT NULL,
    email VARCHAR2(50),
    gender VARCHAR2(6),
    joindate TIMESTAMP DEFAULT SYSTIMESTAMP,
    PRIMARY KEY(mno)
);

CREATE SEQUENCE seq_mno NOCACHE;

INSERT INTO member (mno, id, passwd, name, email, gender)
VALUES(seq_mno.NEXTVAL, 'khit', 'kh123456', '이광수', 'khit@academy.com', '남' );

COMMIT;
SELECT * FROM member;
SELECT * FROM member ORDER BY mno;

-- id가 'khit'인 회원의 정보 검색
SELECT * FROM member WHERE id = 'khit';

-- id와 passwd가 일치하는 회원 찾기
SELECT * FROM member WHERE id = 'khit' and passwd = 'kh123456';

-- result 별칭이지만 칼럼 역할 함
SELECT COUNT(*) as result FROM member WHERE id ='khit';

-- 아이디 개수가 1이면 true, 아니면(= 0) false 출력
-- DECODE 함수 사용
SELECT DECODE (COUNT(*), 1, 'true', 'false') as result
FROM member WHERE id = 'khit'; -- true (없는 아이디면 false)