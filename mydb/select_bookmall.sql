-- DB�ڷᰡ ����Ǿ� ������, �ش� �ڷ������� �ƴϿ��� ��𼭵� �˻� ����
SELECT * FROM orders;

-- �ֹ� ���̺��� Į��, �ڷ��� ����
DESC orders;

-- ��� �Լ� : ����(COUNT), �հ�(SUM), ���(AVG), �ִ밪(MAX), �ּҰ�(MIN)
    -- COUNT(*) : '*' ��� Į�� ��
    -- COUNT(Į����) : Į���� ���� 
    SELECT COUNT(*) AS ���ǸŰǼ�
    FROM orders; 
    
    SELECT COUNT(*) AS �Ѱ���, COUNT(phone) 
    AS ��ȭ��ȣ�� FROM customer;
    
    -- phoneĮ���� null�ڷ� ������ ���� ����
    SELECT COUNT(phone) AS ��ȣ FROM customer; 

-- �հ�(SUM), ���(AVG)
    SELECT SUM(saleprice) AS ���Ǹž�,
           AVG(saleprice) AS ����վ�
           FROM orders;

