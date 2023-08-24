### select ###

# 2. limit
# : 출력의 개수를 제한
# : 데이터를 정렬한 후 앞에서 몇 건을 추출하는 방식으로 주로 사용
# limit 시작, 개수

select *
	from members;

# EX) 회원 테이블(members)을 조회, 전체 중 앞에서 3건만 조회
select *
	from members
    limit 3;
    
# 데뷔 일자(debut_date)가 빠른 회원 3건만 추출
select mem_name, debut_date
	from members
    order by debut_date
    limit 3; -- limit 시작, 개수 / limit 0, 3과 동일

# 평균 키(height)가 큰 순으로 정렬하되, 3번째부터 2건만 조회
select mem_name, height
	from members
    order by height desc
    limit 2, 2; 
-- 시작의 수를 0부터 세기 때문에 3의 수는 4번째 데이터를 의미

# 3. distinct
# : 조회된 결과에서 중복된 데이터를 1개만 남김.
# : 중복된 결과를 제거

select addr from members;

select addr 
	from members
    order by addr;

-- 조회할 열 이름 앞에 distinct 키워드를 붙이면, 중복된 값이 1개만 출력
select distinct addr from members;