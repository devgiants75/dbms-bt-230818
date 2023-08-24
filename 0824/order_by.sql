### select문 ###

# 1. order by 절
# : 결과의 값이나 개수에 대해서는 영향을 미치지 않지만,
# : 결과가 출력되는 순서를 조절(정렬)

select mem_id, mem_name, debut_date
	from members;

# EX) 데뷔 일자(debut_date)가 빠른 순서대로 출력
# 오름차순 정렬: asc(ascending) - 생략 가능
select mem_id, mem_name, debut_date
	from members
    order by debut_date asc;

# 데뷔 일자가 늦은 순서대로 출력
# 내림차순 정렬: desc(descending) - 생략 불가!
select mem_id, mem_name, debut_date
	from members
    order by debut_date desc;

-- order by를 where조건식과 함께 사용
select mem_id, mem_name, debut_date, height
	from members
    where height >= 164
    order by height desc;

# select절의 형식

# select 열_이름(*)
# 	from 테이블_이름
# 	where 조건식
# 	group_by 열_이름
# 	having 조건식
#  	order_by 열_이름
#	limit 숫자

# 평균 키가 큰 순서대로 정렬(desc)
# 평균 키가 같으면 데뷔 일자가 빠른 순서로 정렬(asc)
select mem_id, mem_name, debut_date, height
	from members
    where height >= 164
    order by height desc, debut_date asc;