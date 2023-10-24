-- �౸���� ���� ���̺� (U-23, ������ǥ)
CREATE TABLE soccerplayer(
    name VARCHAR2(20),   -- �̸�
    team VARCHAR2(100),   -- ���� �Ҽ���
    teambyage VARCHAR2(50)  -- u-23���� ����(A��ǥ)���� 
);

INSERT INTO soccerplayer VALUES ('�����', '��Ʈ��', 'A��ǥ');
INSERT INTO soccerplayer VALUES ('�̰���', 'PSG', 'A��ǥ, U-23');
INSERT INTO soccerplayer VALUES ('�����', '����', 'A��ǥ');
INSERT INTO soccerplayer VALUES ('���쿵', 'VfB', 'A��ǥ, U-23');

select * from soccerplayer;

-- �౸���� team ���̺�
CREATE TABLE team(
    name VARCHAR2(20),
    team VARCHAR2(100)
);

INSERT INTO team VALUES ('�̰���', 'PSG');
INSERT INTO team VALUES ('���쿵', 'VfB');
INSERT INTO team VALUES ('�����', '��Ʈ��');
INSERT INTO team VALUES ('�����', '����');

select * from team;

-- �౸���� teambyage���̺�
CREATE TABLE tba(
    name VARCHAR2(20),
    teambyage VARCHAR2(50)
);

INSERT INTO tba VALUES ('�̰���', 'A��ǥ');
INSERT INTO tba VALUES ('�̰���', 'U-23');
INSERT INTO tba VALUES ('���쿵', 'A��ǥ');
INSERT INTO tba VALUES ('���쿵', 'U-23');
INSERT INTO tba VALUES ('�����', 'A��ǥ');
INSERT INTO tba VALUES ('�����', 'A��ǥ');

select * from tba;

-- <join ���>
-- �������� : �����̸�, ��, ���ɺ� ��ǥ������ ���� �������
SELECT a.name, a.team, b.teambyage FROM team a, tba b
WHERE a.name = b.name;


-- ��������(INNER JOIN)
SELECT a.name, a.team, b.teambyage FROM team a JOIN tba b
ON a.name = b.name;


-- USING���
SELECT name, a.team, b.teambyage FROM team a JOIN tba b
USING(name);


-- <select ���� 1 : A��ǥ�� ���� ���� ���� ���>
SELECT a.name, a.team, b.teambyage FROM team a JOIN tba b
ON a.name = b.name
WHERE b.teambyage LIKE '%��ǥ%';











