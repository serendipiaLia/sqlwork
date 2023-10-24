-- 축구선수 통합 테이블 (U-23, 국가대표)
CREATE TABLE soccerplayer(
    name VARCHAR2(20),   -- 이름
    team VARCHAR2(100),   -- 본인 소속팀
    teambyage VARCHAR2(50)  -- u-23인지 국대(A대표)인지 
);

INSERT INTO soccerplayer VALUES ('손흥민', '토트넘', 'A대표');
INSERT INTO soccerplayer VALUES ('이강인', 'PSG', 'A대표, U-23');
INSERT INTO soccerplayer VALUES ('김민재', '뮌헨', 'A대표');
INSERT INTO soccerplayer VALUES ('정우영', 'VfB', 'A대표, U-23');

select * from soccerplayer;

-- 축구선수 team 테이블
CREATE TABLE team(
    name VARCHAR2(20),
    team VARCHAR2(100)
);

INSERT INTO team VALUES ('이강인', 'PSG');
INSERT INTO team VALUES ('정우영', 'VfB');
INSERT INTO team VALUES ('손흥민', '토트넘');
INSERT INTO team VALUES ('김민재', '뮌헨');

select * from team;

-- 축구선수 teambyage테이블
CREATE TABLE tba(
    name VARCHAR2(20),
    teambyage VARCHAR2(50)
);

INSERT INTO tba VALUES ('이강인', 'A대표');
INSERT INTO tba VALUES ('이강인', 'U-23');
INSERT INTO tba VALUES ('정우영', 'A대표');
INSERT INTO tba VALUES ('정우영', 'U-23');
INSERT INTO tba VALUES ('손흥민', 'A대표');
INSERT INTO tba VALUES ('김민재', 'A대표');

select * from tba;

-- <join 방식>
-- 동등조인 : 선수이름, 팀, 연령별 대표종류에 대한 정보출력
SELECT a.name, a.team, b.teambyage FROM team a, tba b
WHERE a.name = b.name;


-- 내부조인(INNER JOIN)
SELECT a.name, a.team, b.teambyage FROM team a JOIN tba b
ON a.name = b.name;


-- USING사용
SELECT name, a.team, b.teambyage FROM team a JOIN tba b
USING(name);


-- <select 문제 1 : A대표에 들어가는 선수 정보 출력>
SELECT a.name, a.team, b.teambyage FROM team a JOIN tba b
ON a.name = b.name
WHERE b.teambyage LIKE '%대표%';











