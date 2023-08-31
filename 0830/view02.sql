### 뷰의 실제 작동 ###

# 뷰의 실제 생성, 수정, 삭제

use market_db;

# 1. 뷰 생성
# : create view구문 사용

create view v_viewtest1
as 
	select B.mem_id 'Member ID', M.mem_name as 'Member Name',
		B.prod_name "Product Name",
        concat(M.phone1, M.phone2) as "Office Phone"
	from buy B
		inner join members as M
        on B.mem_id = M.mem_id;
        
# 뷰를 조회하는 경우 열 이름에 공백이 있을 때 백틱(`)으로 묶어주어야 한다.
select distinct `Member ID`, `Member Name` from v_viewtest1;

# 2. 뷰 수정
# : alter view구문 사용

alter view v_viewtest1
as 
	select B.mem_id '회원 아이디', M.mem_name as '회원 이름',
		B.prod_name "제품 이름",
        concat(M.phone1, M.phone2) as "연락처"
	from buy B
		inner join members as M
        on B.mem_id = M.mem_id;

select distinct `회원 아이디`, `회원 이름` from v_viewtest1;


# 3. 뷰 삭제
# : drop view구문 사용

drop view v_viewtest1;

# 데이터베이스 개체는 서로 완전히 다른 기능을 하지만
# 생성/수정/삭제하는 문법은 거의 동일
# >>> 데이터베이스 개체: 데이터베이스 내에서 만들어지는 영역
#					EX) 테이블, 뷰, 스토어드 프로시저, 트리거 등

