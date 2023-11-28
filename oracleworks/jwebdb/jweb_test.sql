-- 테이블 생성 (resource 권한 부여 확인)
CREATE TABLE test(
    message VARCHAR2(30)
); 

-- DBA 권한 부여 확인
INSERT INTO test VALUES ('have a good one :D');

SELECT * FROM test;