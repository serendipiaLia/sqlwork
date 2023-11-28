-- db생성
create database jwebdb;
use jwebdb;

-- student 테이블 생성
create table student(
	sid int primary key auto_increment,
    username varchar(20) not null,
    univ varchar(40),
    birth varchar(20),
	email varchar(40) not null unique
);

insert into student(username, univ, birth, email) 
values ('손흥민', '토트넘', '1992-07-08', 'tottenham@forward.com');

commit;

select * from student;