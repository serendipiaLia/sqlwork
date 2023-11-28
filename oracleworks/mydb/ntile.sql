-- 등급 매기기 ntile() 함수 사용! 
CREATE TABLE exam_score(
    name VARCHAR2(20),
    korean NUMBER,
    english NUMBER,
    math NUMBER
);
-- 점수 체계(만점) : 국어 120점, 영어 80점, 수학 80점
INSERT INTO exam_score VALUES('이나경', 116, 77, 75);
INSERT INTO exam_score VALUES('임예은', 101, 69, 80);
INSERT INTO exam_score VALUES('서지훈', 118, 62, 60);
INSERT INTO exam_score VALUES('이강인', 96, 72, 70);
INSERT INTO exam_score VALUES('손흥민', 103, 77, 55);
INSERT INTO exam_score VALUES('김민재', 78, 66, 61);
INSERT INTO exam_score VALUES('황희찬', 85, 72, 75);
INSERT INTO exam_score VALUES('오스틴', 99, 70, 53);
INSERT INTO exam_score VALUES('오지환', 105, 75, 69); 
INSERT INTO exam_score VALUES('정우영', 117, 68, 73);

COMMIT;
SELECT * FROM exam_score;

-- 국어 과목 등급 검색 
-- NTILE(수) OVER(ORDER BY 칼럼명)
SELECT name, korean, NTILE(8)OVER(ORDER BY korean DESC) 국어등급 FROM exam_score;

-- '오지환'을 제외한 국어 과목 등급 검색
SELECT name, korean, NTILE(8)OVER(ORDER BY korean DESC) 국어등급 FROM exam_score 
WHERE name <> '오지환';  -- <>는 =과 반대. (=같지 않음)


