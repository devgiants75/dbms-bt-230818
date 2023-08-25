### delete ###

# delete
# : 행 단위로 데이터를 삭제하는 sql문

# 기본 형태
# delete from 테이블명 where 조건;

select * from city_popul
	where city_name like 'New%';
    
delete from city_popul
	where city_name like 'New%';

# 주의 사항
# : where절이 생략되면 전체 행 데이터를 삭제 (update와 동일)

# New 글자로 시작하는 11건의 도시를 모두 지우는 것이 아니라
# 해당 데이터 중 상위 몇 건만 삭제하려면 limit구문과 함께 사용

delete from city_popul
	where city_name like 'New%'
	limit 5;
    
### 대용량 테이블의 삭제 ###

# ctrl + d: 줄 복사
create table big_table1 (select * from world.city, sakila.country);
create table big_table2 (select * from world.city, sakila.country);
create table big_table3 (select * from world.city, sakila.country);
select count(*) from big_table1;

# delete 
# : 삭제가 오래 걸림.
# : 테이블 형식을 그대로 두고 데이터만을 삭제
delete from big_table1;

# drop
# : 삭제 속도가 빠름.
# : 테이블 자체를 삭제
drop table big_table2;

# truncate
# : delete문과 동일한 효과
# : 삭제 속도가 빠름.
truncate table big_table3;

# 차이점
# truncate는 delete와 달리 where 조건문을 사용할 수 없다.
# : truncate는 조건 없이 전체 행을 삭제할 때만 사용