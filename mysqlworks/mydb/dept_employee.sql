-- <부서, 사원 테이블 생성>
-- 부서 테이블 생성
create table department(
	deptid int primary key,
    deptname varchar(30) not null,
    location varchar(20) not null
);

insert into department values(10, '개발팀', '서울');
insert into department values(20, '디자인팀', '부천');

-- 사원 테이블 생성
create table employee(
	empid int primary key,
    empname varchar(30) not null,
    age int not null , 
    sal int,
    deptid int not null,
    foreign key(deptid) references department(deptid)
);

insert into employee values (101, '한강', 27, 2100000, 10);
insert into employee values (102, '이사원', 32, 3200000, 20);
insert into employee values (103, '손과장', 45, 5500000, 10);
insert into employee values (104, '설대리', 38, 4300000, 10);
insert into employee values (105, '강신입', 25, null, 10);

select * from department;
select * from employee;



