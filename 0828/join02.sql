### 외부 조인 ###

# 외부 조인의 기본 #
# 외부(outer) 조인
# : 두 테이블을 조인할 때 필요한 내용이 한쪽 테이블에만 있어도 결과를 추출 가능

# select <열 목록>
# from <첫 번째 테이블(LEFT 테이블)>
# 	<left | right | full> outer join <두 번째 테이블(right 테이블)>
# 	on <조인될 조건>
# [where 검색 조건]

# 전체 회원의 구매 기록(구매 기록이 없는 회원의 정보도 함께) 출력
select M.mem_id, M.mem_name, B.prod_name, M.addr
from members as M
	left outer join buy as B -- 왼쪽에 있는 회원 테이블을 기준으로 외부 조인
	on M.mem_id = B.mem_id
order by M.mem_id;

# left outer join을 줄여서 left join만 작성 가능
# : 왼쪽 테이블(members)의 내용은 모두 출력 되어야 한다.

# right outer join으로 위의 sql문과 동일한 결과 출력
select M.mem_id, M.mem_name, B.prod_name, M.addr
from buy as B
	right outer join members as M -- 오른쪽에 있는 구매 테이블을 기준으로 외부 조인
    on M.mem_id = B.mem_id
order by M.mem_id;

# full outer join
# : 왼쪽 외부 조인과 오른쪽 외부 조인이 합쳐진 것
# : 왼쪽이든 오른쪽이든 한쪽에 들어 있는 내용이면 모두 출력

# 회원으로 가입만 하고, 한 번도 구매한 적이 없는 회원의 목록을 추출
select distinct M.mem_id, B.prod_name, M.mem_name, M.addr
from members M
	left outer join buy B
    on M.mem_id = B.mem_id
where B.prod_name is null -- null의 경우 등호(=)가 아닌 is null 형태로 작성
order by M.mem_id;