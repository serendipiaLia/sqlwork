-- �ǽ� ���� 
SELECT * FROM customer;

-- 1/ ��� ���� �̸��� �ּ� �˻�
SELECT name, address FROM customer;

-- 2/ ��� ���� �̸�o, �ּ�, ��ȭ��ȣ �˻�
SELECT name, address, phone FROM customer;

-- 3/ �ּҰ� '����'�� �� �˻�
SELECT custid,name,address FROM customer
WHERE address LIKE '%����%';

-- 4/ ���� �̸��� '�迬��' Ȥ�� '�Ȼ�'�� �� �˻�
SELECT * FROM customer
WHERE name IN('�迬��', '�Ȼ�');

SELECT * FROM customer
WHERE name = '�迬��' OR name = '�Ȼ�';

-- 5/ �ּҰ� '���ѹα�'�� �ƴ� �� �˻�
SELECT custid, name, address FROM customer
WHERE address NOT LIKE '%���ѹα�%';

-- 6/ ��ȭ��ȣ�� ���� �� �˻�
SELECT * FROM customer
WHERE phone IS NULL;
    -- ��ȭ��ȣ�� �ִ� ��
    SELECT * FROM customer
    WHERE phone IS NOT NULL;

-- 7/ ���� �̸������� ���� (��������)
SELECT * FROM customer ORDER BY name;
    -- ��������
    SELECT * FROM customer ORDER BY name DESC;

-- 8/ ���� �� �ο���
SELECT COUNT(*) AS ���ο��� FROM customer;
