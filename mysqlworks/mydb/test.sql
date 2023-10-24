
-- mydb 생성
create database mydb;

-- 작업 전에 사용 db 실행필수 !
use mydb;

create table test(
	no int,
    msg varchar(100)
);

insert into test values (1, 'have a good one :>');
insert into test values (2, 'good luck :D');


select * from test;

commit;