-- 새로운 user 생성 : lia (사용자이름)
CREATE USER c##lia IDENTIFIED BY pw990618;

-- 내 이름에 SESSION 권한 부여(grant)
GRANT CREATE SESSION TO c##lia;

-- LIA의 info table 권한 부여
GRANT CREATE TABLE, RESOURCE TO c##lia;

-- table에 있는 DB 수정, 조회,삭제 권한 부여 (DBA database administorator)
GRANT CONNECT, DBA TO c##lia;