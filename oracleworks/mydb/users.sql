-- 자바 프로젝트와 연동할 users(회원) 테이블 생성 
CREATE TABLE users(
    userid VARCHAR2(20) PRIMARY KEY,
    username VARCHAR2(30) NOT NULL, 
    userpassword VARCHAR2(20) NOT NULL,
    userage NUMBER(3) NOT NULL,
    useremail VARCHAR2(50) NOT NULL
);

-- 회원 추가
INSERT INTO users
VALUES ('today', '이강인', '12345', '25', 'todat@korea.kr');

COMMIT;

SELECT * FROM users;

SELECT * FROM users WHERE userid = 'today';