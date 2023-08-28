### join ###

# 조인(join)
# : 두 개의 테이블을 서로 묶어서 하나의 결과를 만들어 내는 것

# 회원 테이블: 회원이름, 연락처 등
# 구매 테이블: 회원이 구매한 물건 등

# 물건을 배송하는 경우
# : 회원테이블의 회원이름과 연락처
# , 구매 테이블의 회원이 구매한 물건에 대한 정보가 함께 필요

### (내부) 조인 ###

# 두 테이블을 조인시키기 위해서는 
# 일(1)대다(多) 관계(one to many)로 연결되어 있어야 한다.
# 두 테이블 모두 있는 내용만 출력

# : 한쪽 테이블에는 하나의 값만 존재해야 하지만,
# : 연결된 다른 테이블에는 여러 개의 값이 존재할 수 있는 관계를 뜻함.

# 회원 테이블의 mem_id의 블랙핑크 아이디는 'BLK'는 1명 밖에 없음.
# : 따라서 mem_id가 기본키(PK)로 설정

# 구매 테이블의 mem_id의 블랙핑크 아이디 'BLK'가 3개의 데이터가 존재.
# : 따라서 mem_id 가 외래 키(Foreign Key)

# 즉, 회원은 1명이지만 이 회원은 구매를 여러 번 가능

# 일대다 관계는 주로 기본키(PK)와 외래키(FK) 관계로 이루어져 있다.

# 내부 조인의 기본 #

# select <열 목록>
# from <첫 번째 테이블>
#	inner join <두 번째 테이블> -- inner join을 join으로 작성 가능
# 	on <조인될 조건>
# [where 검색 조건]

use market_db;
select *
from buy
	inner join members
    on buy.mem_id = members.mem_id
where buy.mem_id = 'GRL'; 
# 조인하는 두 개의 테이블의 열 이름이 동일한 경우에는 
# 반드시 테이블명.열이름 형식으로 표기!

select B.mem_id, M.mem_name, B.prod_name, M.addr, 
	concat(M.phone1, M.phone2) as '연락처'
from buy as B
	inner join members as M -- 여러 개의 테이블이 관련된 조인에서는 별칭 사용을 적극권장
    on buy.mem_id = members.mem_id;

# '전체 회원'의 아이디/이름/구매한 제품/주소 출력
select M.mem_id, M.mem_name, B.prod_name, M.addr
From buy as B
	inner join members as M
    on B.mem_id = M.mem_id
order by M.mem_id;
-- 결과가 '전체 회원'이 아닌 '구매한 기록이 있는 회원들'의 목록
-- 내부 조인은 두 테이블에 모두 있는 내용만 조인되는 방식
-- 만약, 양쪽 중에 한곳이라도 내용이 있을 때 조인할 경우
-- : 외부 조인(outer join)을 사용

# 중복된 결과 1개만 출력하기
# : 내부조인과 distinct 사용

select distinct M.mem_id, M.mem_name, M.addr
from buy as B
	inner join members M
    on B.mem_id = M.mem_id
order by M.mem_id;