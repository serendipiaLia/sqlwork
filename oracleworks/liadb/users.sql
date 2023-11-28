-- LIA > users

-- 자바 프로젝트와 연동할 users table 생성 
CREATE TABLE users(
    userid VARCHAR2(20) PRIMARY KEY,
    username VARCHAR2(30) NOT NULL, 
    userpassword VARCHAR2(20) NOT NULL,
    userage NUMBER(3) NOT NULL,
    useremail VARCHAR2(50) NOT NULL
);
-- 회원추가 
INSERT INTO users
VALUES ('Lia', '이나경', 'pw990618','25', 'nagyung@gmail.com');

COMMIT;

SELECT*FROM users;


