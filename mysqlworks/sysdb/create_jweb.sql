use mydb;
-- 계정 : jweb, 비번 : pwjweb
create user 'jweb'@'localhost' identified by 'pwjweb';

-- myuser에게 모든 권한 부여
grant all privileges on *.* to 'jweb'@'localhost';