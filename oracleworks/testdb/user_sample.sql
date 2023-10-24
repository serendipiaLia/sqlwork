-- 계정만 삭제가 아니라 안의 DB도 삭제
DROP USER c##sample CASCADE;
DROP USER c##sample; -- table없으면 계정만 삭제, table있으면 오류!

-- 새로운 user 만들기
CREATE USER c##sample IDENTIFIED BY pw1234;

-- SESSION 권한 부여
GRANT CREATE SESSION TO c##sample;
