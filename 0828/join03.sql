### 기타 조인 ###

# 1. 상호 조인(cross join)
# : 한쪽 테이블의 모든 행과 다른 쪽 테이블의 모든 행을 조인시키는 기능
# : 상호 조인 결과의 전체 행 개수 = 두 테이블의 각 행의 개수를 곱한 개수
select *
from buy
	cross join members;

# on 구문을 사용할 수 없다.
# 결과의 내용에 의미가 없다. (랜덤으로 조인)
# 상호 조인의 주 용도는 테스트를 하기 위해 대용량의 테이블을 생성할 때 사용

select count(*) '데이터 개수'
from sakila.inventory
	cross join world.city;
    
create table cross_table
	select *
		from sakila.actor -- 200건
			cross join world.country; -- 239건
select * from cross_table limit 5;

# 2. 자체 조인
# : 1개의 테이블을 사용해 자신이 자신과 조인

# 직업(emp) - 기본 키
# 직속 상관(manager)
# 사내 연락처

# 관리이사는 직원 - 직원 열
# 관리이사는 경리부장과 인사부장의 상관 - 직속 상관 열
# A라는 직원이 경리부장의 직속상관인 관리이사의 사내 연락처

use market_db;
create table emp_table (emp char(4), manager char(4), phone varchar(8));

insert into emp_table values('대표', null, '0000');
insert into emp_table values('영업이사', '대표', '1111');
insert into emp_table values('관리이사', '대표', '2222');
insert into emp_table values('정보이사', '대표', '3333');
insert into emp_table values('영업과장', '영업이사', '1111-1');
insert into emp_table values('경리부장', '관리이사', '2222-1');
insert into emp_table values('인사부장', '관리이사', '2222-2');
insert into emp_table values('개발팀장', '정보이사', '3333-1');

# 자체조인의 형식 #
# select <열 목록>
# from <테이블> 별칭A -- 테이블이 1개지만 다른 별칭을 사용해서 서로 다른 것처럼 사용
# 	inner join <테이블> 별칭B 
# 	on <조인될 조건>
# [where 검색 조건]

select A.emp '직원', B.emp '직속상관', B.phone '직속상관연락처'
from emp_table as A
	inner join emp_table as B
    on A.manager = B.emp
where A.emp = '경리부장';


