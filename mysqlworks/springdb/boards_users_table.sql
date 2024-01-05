
create database springdb;
use springdb;

-- 만약 전에 table이 만들어져 있으면 삭제..
drop table if exists users; -- 회원
drop table if exists boards; -- 커뮤니티
drop table if exists reply; -- 댓글

-- users table 생성
create table users(
	id bigint primary key auto_increment,
    userid varchar(20) unique,
    userpasswd varchar(20) not null,
    username varchar(30) not null,
    userage int
);
select * from users;

-- users를 참조하는 boards table 생성
create table boards(
	id bigint primary key auto_increment,
    boardtitle varchar(100) not null,
    userid varchar(20) not null, -- boardWriter 대신..
    boardcontent text not null,
    hit int default 0,
    createdtime datetime default now(),
    updatedtime datetime,
    foreign key(userid) references users(userid) on delete cascade
);
select * from boards order by id desc;

-- boards를 참조하는 reply table 생성 >> 댓글
create table reply(
	id bigint primary key auto_increment,
    boardid bigint,
    replyer varchar(20) not null,
    replycontent varchar(1000) not null,
    createdtime datetime default now(),
    updatedtime datetime,
    foreign key(boardid) references boards(id) on delete cascade
);
select * from reply;

-- boards 테이블 구조 보기
desc boards; 

-- 재귀복사 
insert into boards (boardtitle, userid, boardcontent) (select boardtitle, userid, boardcontent from boards);

-- 전체 게시글 수
select count(id) from boards;

-- limit: limit 시작 인덱스, 게시글 수; 
	-- 예제 
select * from boards order by id asc limit 0, 5; -- 1,2,3,4,5 >> 1p에 5개의 글
select * from boards order by id asc limit 1, 5; -- 2,3,4,5,6 
select * from boards order by id asc limit 2, 5;

	-- 페이지 처리
select * from boards order by id desc limit 5, 5; 

