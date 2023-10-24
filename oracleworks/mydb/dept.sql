-- <dept> 테이블
CREATE TABLE dept (
    deptid NUMBER PRIMARY KEY,
    deptname VARCHAR2(20) NOT NULL, -- NULL 불허
    location VARCHAR2(20) NOT NULL
);

-- 부서 자료 추가
INSERT INTO dept(deptid, deptname, location)
VALUES (10, '전산팀', '서울');
INSERT INTO dept(deptid, deptname, location)
VALUES (20, '관리팀', '인천');
INSERT INTO dept(deptid, deptname, location)
VALUES (30, '마케팅팀', '성남');

SELECT * FROM dept;

-- 부서이름에서 팀(deptname)을 제외한 이름 출력
-- 문자열의 일부분을 추출 : SUBSTR('문자열', 인덱스, 자리수)
-- 특정 문자열을 찾아 바꾸기 : REPLACE('문자열',변경 전 문자, 변경 후 문자)
SELECT deptname AS 부서이름,
    LENGTH(deptname) AS 글자수,
    SUBSTR(deptname, 1, LENGTH(deptname)-1) AS SUBSTR_팀명,
    REPLACE(deptname, '팀', '') AS REPLACE_팀명
FROM dept;
