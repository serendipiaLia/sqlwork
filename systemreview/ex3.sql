-- ex3 테이블 샏ㅇ성
CREATE TABLE ex3(
    col_null VARCHAR2(10), -- NULL 허용
    col_not_null VARCHAR2(10) NOT NULL -- NULL 불허
);

INSERT INTO ex3 VALUES (' ', 'THX');
INSERT INTO ex3 VALUES ('Hello', ' '); -- null 에러

COMMIT;

SELECT * FROM ex3;

