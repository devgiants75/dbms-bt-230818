### select ###

# 4. group by 절
# : 그룹으로 묶어주는 역할

# select 열_이름
# 	from 테이블_이름
# 	where 조건식
# 	group by 열_이름
# 	having 조건식
# 	order by 열_이름
# 	limit 숫자

-- 회원(mem_id)이 구매한 물품의 개수(amount) 조회
select mem_id, amount
	from buy
    order by mem_id;

# 4-1. 집계 함수
# : group by절과 함께 쓰이며, 데이터를 그룹화해주는 기능

# sum(): 합계
# avg(): 평균
# min(): 최소값
# max(): 최대값
# count(): 행의 개수를 셈
# count(distinct): 행의 개수를 셈(중복은 1개만 인정)

# 각 회원(mem_id)별로 구매한 개수(amount)를 합쳐서 출력
# sum() 집계 함수 & group by절을 함께 사용
select mem_id, sum(amount)
	from buy
    group by mem_id;

# 집계 함수 사용 시 별칭 사용(alias)
select mem_id "회원 아이디", sum(amount) "총 구매 개수"
	from buy
    group by mem_id;

# 회원이 구매한 금액의 총합을 출력
# 구매한 금액 = 가격(price) * 수량(amount)
# 구매한 금액을 sum() 집계 함수에서 사용

select mem_id "회원 아이디", sum(price * amount) "총 구매 금액"
	from buy
    group by mem_id;

# 전체 회원이 구매한 물품 개수(amount)의 평균
select avg(amount) "평균 구매 개수"
	from buy;
    
# 각 회원이 한 번 구매 시 평균 몇 개를 구매했는지 조회
# 회원(mem_id)별로 구매해야 하기 때문에 group by 사용
select mem_id, avg(amount) "평균 구매 개수"
	from buy
	group by mem_id;

# 회원 테이블(members)에서 연락처가 있는 회원의 수를 카운트
select count(*)
	from members;

# null값인 항목은 제외하고 카운트
# : 연락처가 있는 회원만 조회
select count(phone1) "연락처가 있는 회원"
	from members;

# count(*): 모든 행의 개수를 셈
# count(열_이름): 열 이름의 값이 null인 것을 제외한 행의 개수를 셈.
