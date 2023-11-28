use mydb;
-- 날짜
select now()from dual;

create table date_test1(
	reg_date DATE,
    hire_date DATE
);

insert into date_test1 values (now(),'2023-10-01');
insert into date_test1 values (now(),'2023-10-11');
insert into date_test1 values (now(),'2023/10/11');
insert into date_test1 values (now(),'2023-07-31');

select * from date_test1;

create table date_test2(
	reg_date DATE default (current_date()),	-- 날짜
    create_date TIMESTAMP default now(),	-- 날짜와 시간
    hire_date DATE	-- 특정한 날짜
);
-- 날짜 입력 시 '-' 사용! 
insert into date_test2(hire_date) values('2023-07-31');
insert into date_test2(hire_date) values('2023-10-05');

select*from date_test2;

drop table date_test1;