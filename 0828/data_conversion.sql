### SQL 변수 사용 ###

use market_db;

set @count = 3; -- @count 변수에 3을 대입

-- select mem_name, height
-- 	   from members
--     order by height
--     limit @count;

# select문에서 limit에 변수를 사용할 경우
# : prepare, execute 키워드를 사용하여 해결

# prepare
# : 실행하지 않고 SQL문 만 준비
# execute
# : 실행하는 방식

prepare mySQL -- mySQL이라는 이름으로 SQL문 준비
	from 'select mem_name, height 
			from members 
            order by height 
            limit ?'; -- 현재는 모르지만 나중에 채워질 값
execute mySQL using @count; 
-- mySQL에 저장된 select문을 실행할 때,
-- using으로 물음료(?)에 @count값을 대입

### 데이터 형 변환 ###

# 데이터 타입: 문자, 숫자(정수, 실수), 날짜 등 
# 형 변환
#: 문자형을 정수형으로 바꾸거나, 반대로 정수형을 문자형 등으로 바꾸는 것을 뜻함.

# 1. 명시적인 변환
# : 직접 함수를 사용해서 변환해야 함.
# cast(), convert() - 형식만 다르고 동일한 동작

# 형 변환 함수(cast, convert)에서 사용할 수 있는 데이터 타입
# : char, signed, unsigned, date, time, datetime 등

# cast(값 as 데이터_형식 [길이])
# convert(값, 데이터_형식 [길이])

# market_db의 구매 테이블(buy)에서 평균 가격을 구하는 SQL문
select avg(price) as '평균 가격' from buy; -- 결과값: 142.9167(실수)

select cast(avg(price) as signed) '평균 가격' from buy; -- 결과값: 143
select convert(avg(price), signed) '평균 가격' from buy; -- 결과값: 143
# signed
# : 어떤 정수 값이 부호(음수 또는 양수)를 가질 수 있음을 나타내는 데이터 타입
# : 부호가 없는 정수 - unsigned

select cast('2023$08$28' as date);
select cast('2023/08/28' as date);
select cast('2023%08%28' as date);
select cast('2023@08@28' as date);
# date타입: 2023-08-28

# 형 변환을 사용하여 SQL의 결과를 원하는 형태로 표현
# : 가격(price), 수량(amount)을 곱한 실제 구매액을 작성
select num, 
	concat(cast(price as char), -- 123 >> '123'
    'X', 
    cast(amount as char),
    '=') '가격X수량', 
    price*amount '구매액' 
    from buy;
# concat() 
# : 문자를 이어주는 역할 

# 2. 암시적인 변환
# : 별도의 지시 없이 자연스럽게 변환됨.
# : cast, convert함수 사용없이 형 변환

select '100' + '200';
# 문자는 더할 수 없기 때문에 프로그램이 자동으로 숫자 100과 200으로 변환해서 덧셈 수행

select concat('100', '200');
# 100200

# 실수형으로의 형 변환
# decimal
# : 고정 소수점 숫자를 저장
# : 소수점 아래의 정확한 자리 수를 유지
# : 금융 계산, 과학적 계산에 사용되는 데이터 타입
# decimal(m, d)
# m은 전체 자릿수
# d는 소수점 이하의 자릿수

select cast(10 as decimal(10, 2));
select convert(10, decimal(10, 2)); -- 소수점 앞에 8자리, 뒤에 2자리 가진 수

# mySQL 8.0이상
# : 전체 자릿수 - 최대 65
# : 소수점 이하의 자릿수 - 최대 30
select cast(123123123123 as decimal(65, 30));