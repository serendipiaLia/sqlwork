-- event ���̺� ����
CREATE TABLE event (
    event_no NUMBER PRIMARY KEY, -- �̺�Ʈ ��ȣ
    event_name VARCHAR2(50) NOT NULL, -- �̺�Ʈ ����
    start_date VARCHAR2(20) NOT NULL, -- �̺�Ʈ ���۳�¥
    end_date VARCHAR2(20) NOT NULL -- �̺�Ʈ ���ᳯ¥
);


-- �ڵ� �Ϸù�ȣ
CREATE SEQUENCE seq_eno NOCACHE;

INSERT INTO event(event_no, event_name, start_date, end_date)
VALUES (seq_eno.NEXTVAL, '20% ���� ���� ����', '2023-10-10', '2023-10-20');

INSERT INTO event(event_no, event_name, start_date, end_date)
VALUES (seq_eno.NEXTVAL, '���콺 �е� ����', '2023-11-15', '2023-11-25');

INSERT INTO event(event_no, event_name, start_date, end_date)
VALUES (seq_eno.NEXTVAL, '���� ���� �佺Ƽ��', '2023-12-10', '2023-12-30');

COMMIT;
SELECT * FROM event;

-- �̺�Ʈ �Ⱓ���ȿ� ���並 �ۼ��� ������ ����ǰ�� �ִ� ���
-- ���� ���̺�� �̺�Ʈ ���̺� ����
-- �ϴ�� (�̺�Ʈ�� ����)
-- �� ���� ����( >=, <=, between and)
SELECT a.event_name, b.member_id, b.content, b.regdate
FROM event a, product_review b
WHERE b.regdate 
BETWEEN a.start_date AND a.end_date;

-- ���� ���� (INNER JOIN)
SELECT a.event_name, b.member_id, b.content, b.regdate
FROM event a INNER JOIN product_review b
    ON b.regdate >= a.start_date AND b.regdate <= a.end_date;
        -- BETWEEN a.start_date AND a.end_date;






