
create database springdb;
use springdb;

-- 만약 전에 table이 만들어져 있으면 삭제..
drop table if exists boards; 
drop table if exists users;

-- boards table 생성
create table boards(
	id bigint primary key auto_increment,
    boardtitle varchar(100) not null,
    boardwriter varchar(20) not null,
    boardcontent text not null,
    hit int default 0,
    createdtime datetime default now(),
    updatedtime datetime
);

select * from boards;

-- users table 생성
create table users(
	id bigint primary key auto_increment,
    userid varchar(20) unique,
    userpasswd varchar(20) not null,
    username varchar(30) not null,
    userage int
);

select * from users;