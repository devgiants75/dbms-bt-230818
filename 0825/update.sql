### update ###

# update
# : 기존에 입력되어 있는 값을 수정하는 sql문

# 기본 형태
# update 테이블명
# 	set 열1 = 값1, 열2 = 값2, ...
#	where 조건;

# city_popul 테이블의 도시 이름(city_name) 중에서 'Seoul' > '서울' 변경
update city_popul
	set city_name = '서울'
    where city_name = 'Seoul';
select * from city_popul where city_name = '서울';

update city_popul
	set city_name = '뉴욕', population = 0
    where city_name = 'New York';
select * from city_popul where city_name = '뉴욕';

# 주의사항
# : update문에서 where절은 생략 가능
# : where절을 생략하는 경우 테이블의 모든 값이 변경
update city_popul
	set city_name = '서울';
    
select * from city_popul;

update city_popul
	set population = population / 10000;
select * from city_popul limit 5;