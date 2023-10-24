-- 새로운 사용자(user) 생성 : c##사용
CREATE USER c##mydb IDENTIFIED BY pwmydb;

-- 세션저장 유지 및 생성 권한 부여 : GRANT CREATE
GRANT CREATE SESSION TO c##mydb; 
-- 테이블 자원(resource) 생성 권한 부여 : GRANT CREATE
GRANT CREATE TABLE, RESOURCE TO c##mydb;
--DBA(DatabaseAgent = Oracle)에 접속(연결)할 권한 부여
GRANT CONNECT, DBA TO c##mydb;

