# 0823 정리 #

# use: 데이터베이스를 선택하는 구문으로 한 번 지정하면 계속 유지

# 관계연산자
# : where절에서 크다/작다/같다 등을 지정하는 기호 (>, <=, =)

# 논리연산자
# : 관계 연산자가 2개 이상 나오는 경우 and, or 등으로 참/거짓을 판별

# like
# : 문자열 비교 시 모두 허용할 때 %(퍼센트)
# : 하나로 지정할 경우에는 _(언더바)

# 주소의 지역이 서울 또는 경기인 회원을 추출하는 SQL문
select * 
	from members
    where addr = '서울' or addr = '경기';
    
# 1. addr in('서울', '경기')
# 2. addr between '서울' and '경기' -- 숫자 데이터의 범위
# 3. addr = '서울' or addr = '경기'
# 4. addr = '서울' and addr = '경기' -- 두 가지의 데이터 모두 포함

# 복습 문제 #

use market_db;

-- 1. 기본 조건 조회:
-- '서울'에 거주하는 회원의 정보를 조회하세요.
-- 단가가 100 이상인 구매 내역을 조회하세요.

select * 
	from members 
    where addr = '서울';
    
select *
	from buy
    where price >= 100;

-- 2. 다중 조건 조회:
-- '서울'에 거주하면서 평균 키가 165cm 이상인 회원의 정보를 조회하세요.
-- '디지털' 분류에 속하면서 단가가 150 이상인 구매 내역을 조회하세요.

select *
	from members
    where addr = '서울' and height >= 165;
    
select *
	from buy
    where group_name = '디지털' and price >= 150;

-- 3. 문자열 검색 조건:
-- 회원 이름에 '소녀'가 포함된 회원의 정보를 조회하세요.
-- '갤럭시'라는 단어가 포함된 제품을 구매한 구매 내역을 조회하세요 

select *
	from members
    where mem_name like '%소녀%';
    
select *
	from buy
    where prod_name like '%갤럭시%';

-- 4. 범위 조건 조회:
-- 평균 키가 160cm에서 165cm 사이인 회원의 정보를 조회하세요.
-- 단가가 30 이상 100 이하인 구매 내역을 조회하세요.

select *
	from members
    where height between 160 and 165;
    
select *
	from buy
    where price between 30 and 100;

-- 5. 조건 조합 조회:
-- '서울'에 거주하면서 연락처 국번(phone1)이 '02'가 아닌 회원의 정보를 조회하세요.
-- 단가가 50 초과이며, 수량이 3개 이상인 구매 내역을 조회하세요.

select *
	from members
    where addr = '서울' and phone1 <> '02';
    
select *
	from buy
    where price > 50 and amount >= 3;

-- 6. null 검사 조건:

# null: '알 수 없다'
# null에 대해서 비교연산자(=, <>, >=, < ...)를 사용할 경우 
# 프로그램은 unknown(불명확)으로 간주합니다.

-- 연락처 국번(phone1)이 null인 회원의 정보를 조회하세요.
select *
	from members
    where phone1 is null;

-- 분류(group_name)가 null 인 구매 내열을 조회하세요.
select *
	from buy
    where group_name is null;

-- is null : null인 값을 조건
-- is not null: null이 아닌 값을 조건

-- addr가 서울이면서 phone1의 값이 02가 아니거나 null인 행을 모두 조회
select *
	from members
    where addr = '서울' and (phone1 <> '02' or phone1 is null);
    
-- 7. 날짜 데이터 조건 조회
-- debut_date의 형식은 DATE타입: YYYY-MM-DD (2023-08-24)

-- 2015년에 데뷔한 회원의 정보를 조회
select *
	from members
    where year(debut_date) = 2015; -- 연도 조회: year / 달: month / 일: day
    
-- 2015년 1월 1일 이후에(>) 데뷔한 회원의 정보를 조회
select *
	from members
    where debut_date > '2015-01-01';