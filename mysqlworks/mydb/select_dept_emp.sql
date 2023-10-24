select * from department;
select * from employee;

-- 삽입 오류
insert into employee values (106, '강신입', 25, null, 30);
	-- dept_employee 부모테이블에 deptid가 '30'이 없음 >> 에러! 

-- 급여(sal)가 300만원 이상이고, 부서번호(deptid)가 10인 사원을 검색하시오
-- 급여 employee table, 부서번호 department PK - employee FK
select * from employee 
where sal <= 30000000 AND a.deptid = 10;

-- 급여가 많은 순으로 정렬 하시오 (DESC)
select * from employee order by sal desc;

-- 급여가 null인 사원을 구하시오
select * from employee where sal IS NULL;

-- 사원의 총인원, 급여 총액과 급여 평균을 구하시오.
select count(*) 총사원수, sum(sal) 급여총액, round(avg(sal), 0) 급여평균 
FROM employee;
		
-- 부서별 급여 총액을 구하시오.
select deptid, sum(sal) 급여총액, round(avg(sal), -2) 급여평균 from employee group by deptid;

-- 부서이름을 포함한 사원의 모든 정보를 검색하시오 (조인 방식)
-- 동등조인
select a.deptname, a.location, b.* from department a, employee b
where a.deptid = b.deptid; 
        
-- 내부조인
select a.deptname, a.location, b.* from department a join employee b
on a.deptid = b.deptid; 

-- using 사용
select a.deptname, a.location, b.* from department a join employee b
using (deptid); 

-- 부서별, 부서이름별 급여 총액 
select a.deptid, a.deptname, sum(b.sal) 급여총액, round(avg(sal), -2) 급여평균
from department a join employee b on a.deptid = b.deptid
group by deptid, deptname with rollup;

-- 최고 급여를 받는 사원의 정보를 검색하시오 
select * from employee where sal = (select MAX(sal) from employee); 

-- 최고급여를 받는 사원과 최저급여를 받는 사원의 정보를 검색하시오
select * from employee where sal = (select MAX(sal) from employee)
	or sal = (select MIN(sal) from employee);
    
-- '이사원' 사원의 급여를 430만원으로 수정하세요
update employee set sal = 4300000 where empid = 102; -- PK만 수정가능 

select * from employee; -- 이사원 급여 변경 확인 

-- 사원의 급여 순위를 구하세요
select empname, sal, rank()over(order by sal DESC) from employee;
	-- dense rank 사용
    select empname, sal, rank()over(order by sal DESC) 순위,
    dense_rank()over(order by sal desc) 순위2 from employee;

