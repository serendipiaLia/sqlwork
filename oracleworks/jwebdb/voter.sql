--voter 테이블 생성
CREATE TABLE voter(
    vno NUMBER PRIMARY KEY,
    mid VARCHAR2(20), -- member.sql에서 가져온 FK
    bno NUMBER,
    FOREIGN KEY (mid) REFERENCES member(id) ON DELETE CASCADE,
    FOREIGN KEY (bno) REFERENCES board(bno) ON DELETE CASCADE
);
CREATE SEQUENCE seq_vno NOCACHE;

SELECT * FROM voter;
SELECT COUNT(*) FROM voter WHERE bno = 34 AND mid = 'Lia';

-- 해당 게시글의 총 개수
SELECT COUNT(*) FROM voter WHERE bno = 1;

COMMIT;

INSERT INTO voter(vno, bno, mid) VALUES(seq_vno.NEXTVAL, 1, 'khit');

-- 데이터만 삭제 : TRUNCATE
TRUNCATE TABLE voter;

-- 시퀀스 삭제
DROP SEQUENCE seq_vno;

DROP TABLE voter;