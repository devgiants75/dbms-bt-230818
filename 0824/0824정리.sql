### 0824 정리 ###

# 1. order by 
# : 결과가 출력되는 순서를 조절(정렬)
# : 오름차순(asc - 생략 가능), 내림차순(desc) 선택 가능

# 2. limit
# : 출력하는 개수를 제한
# : order by와 주로 함께 사용

# 3. distinct
# : 조회된 결과에서 중복된 것은 1개만 남기는 기능
# : 열 이름 앞에 붙여서 사용

# 4. group by
# : 데이터를 그룹으로 묶어주는 기능

# 5. having
# : 집계 함수와 관련된 조건을 제한
# : group by 다음에 작성

### 복습 문제 ###

# 1. group by를 사용하여 각 회원이 구매한 물품의 총 개수를 작성
select mem_id, count(prod_name) as total_products_purchased
	from buy
    group by mem_id;

# 2. group by와 having을 사용하여
# 3개 이상의 물품을 구매한 회원의 id와 해당 물품의 총 개수를 작성
select mem_id, count(prod_name) total_products_purchased
	from buy
    group by mem_id
    having total_products_purchased >= 3;
    
# 3. DISTINCT를 사용하여 buy 테이블에서 구매된 물품의 이름을 나타내시오.
select distinct prod_name
	from buy;

# 4. ORDER BY를 사용하여 members 테이블의 
# 		회원들을 데뷔 날짜에 따라 오름차순으로 나열하시오.
select mem_id, mem_name, debut_date
	from members
    order by debut_date asc;

# 5. LIMIT를 사용하여 buy 테이블에서 단가가 가장 높은 5개의 물품을 나타내시오.
select prod_name, price
	from buy
    order by price desc
    limit 5;

# 6. GROUP BY와 ORDER BY를 사용하여 각 분류별로 팔린 물품의 평균 가격을 나타내시오. 
# 		결과는 평균 가격이 높은 순으로 정렬하시오.
select group_name, avg(price) as average_price
	from buy
    group by group_name
    order by average_price desc;

# 7. GROUP BY, HAVING 및 LIMIT를 사용하여 
# 		평균 가격이 50 이상인 분류 중 상위 3개의 분류를 나타내시오.
select group_name, avg(price) as average_price
from buy
group by group_name
having average_price >= 50
order by average_price desc
limit 3;