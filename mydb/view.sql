-- VIEW(��) ����

-- �ּҿ� '���ѹα�'�� �����ϴ� ����� ������ �� �����

CREATE VIEW vw_customer
AS SELECT * FROM customer WHERE address LIKE '���ѹα�%';

SELECT * FROM vw_customer;

DROP VIEW vw_customer;