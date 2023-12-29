-- case when
use mydb;

-- if문
select sal,
       if(sal >= 5000000, '과장', if(sal >= 4000000, '대리','사원')) 직급
from employee;


use mydb;
CREATE TABLE Mytest(
    class  VARCHAR(1),  -- 반
    name   VARCHAR(6)   -- 이름
);

INSERT INTO Mytest VALUES ('A', '조조');
INSERT INTO Mytest VALUES ('A', '조조');
INSERT INTO Mytest VALUES ('A', '조조');
INSERT INTO Mytest VALUES ('B', '유비');
INSERT INTO Mytest VALUES ('B', '관우');
INSERT INTO Mytest VALUES ('C', '여포');
INSERT INTO Mytest VALUES ('C', '여포');

select
   count(if(class='A', 1, null)) A,
   count(if(class='B', 1, null)) B,
   count(if(class='C', 1, null)) C
from mytest;

select * from employee;


