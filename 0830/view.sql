### View (뷰) ###

# 뷰(View)
# : 가상의 테이블
# : 뷰를 사용하는 경우 사용자에게 테이블의 필요한 내용만 보이도록 작성 가능
# : select문으로 조회되는 영역을 뷰의 실체
# : 뷰는 이름만 보고도 뷰인지 알아볼 수 있도록 이름 앞에 v_ 를 붙이는 것이 관례

# 단순뷰 
# : 하나의 테이블과 연관된 뷰

# 복합뷰
# : 2개 이상의 테이블과 연관된 뷰

use market_db;
-- mem_id, mem_name, addr 3개의 열을 가진 테이블
select mem_id, mem_name, addr from members; 

# 뷰 생성방법
# create view 뷰_이름
# as
# 	select문;

# 뷰 생성 후 뷰에 접근 방식은 테이블과 동일하게 select문을 사용
# : 전체에 접근, 필요하면 조건식도 테이블과 동일하게 사용

use market_db;
create view v_members
as
	select mem_id, mem_name, addr from members;

select * from v_members;
select mem_name, addr from v_members
	where addr in ('서울', '경기');

# 뷰의 작동
# 뷰는 기본적으로 '읽기 전용'으로 사용
# 뷰를 사용하여 테이블의 데이터를 수정하는 것이 가능(무조건 가능한 것은 아님)

# 뷰를 사용하는 이유

# 1. 보안(security)에 도움
# : 데이터의 보안사항을 제외한 뷰를 생성해서
# : 데이터를 추출하거나 데이터를 열람, 확인하는 방식으로 사용

# 2. 복잡한 SQL을 단순하게 사용 가능
create view v_memberbuy
as
	select B.mem_id, M.mem_name, B.prod_name, M.addr,
			concat(M.phone1, M.phone2) '연락처'
	from buy as B
		inner join members as M
		on B.mem_id = M.mem_id;

# v_memberbuy 테이블을 사용
select * from v_memberbuy
	where mem_name = '블랙핑크';