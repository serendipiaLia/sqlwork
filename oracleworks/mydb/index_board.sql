-- ���� ��ȹ : ��Ƽ������
DESC PLAN_TABLE; 

SELECT * FROM board ORDER BY bno;

-- �ۼ��ڰ� Lee�� �Խñ� �˻�
SELECT * FROM board WHERE bwriter='Lee';

-- ������ �˻��� �ɷ� index ����
-- �ε��� ���� �޼���: CREATE INDEX �ε����̸� ON ���̺��(Į����)
CREATE INDEX idx_b1 ON board(bwriter);

-- ����Ŭ ��Ʈ ���� : /* + INDEX(���̺�� �ε�����) */
SELECT /*+ INDEX(board idx_b1) */ * FROM board WHERE bwriter='Lee';

DROP INDEX idx_b1;