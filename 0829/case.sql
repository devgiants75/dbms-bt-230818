### case 문 ###

# case문
# : 여러 가지 조건 중에서 선택해야 하는 경우
# : case문을 사용해서 조건을 설정 가능
# : case문은 저장 프로시저 내부뿐만 아니라 일반적인 sql문 쿼리 안에서도 작성 가능

# case
# 	when 조건1 then
# 		조건이 1일 때 실행 할 sql문
# 	when 조건2 then
# 		조건이 2일 때 실행 할 sql문
# 	when 조건3 then
# 		조건이 3일 때 실행 할 sql문
# 	else
# 		조건 그 밖에 실행할 sql문
# end case;

# 시험점수와 학점 표시
# 90점 이상은 A,
# 80점 이상은 B,
# 70점 이상은 C,
# 60점 이상은 D,
# 60점 미만은 F

drop procedure if exists caseProc;

delimiter $$
create procedure caseProc()
begin
	declare point int;
    declare credit char(1);
    set point = 68;
    
    case 
		when point >= 90 then
			set credit = 'A';
		when point >= 80 then
			set credit = 'B';
		when point >= 70 then
			set credit = 'C';
		when point >= 60 then
			set credit = 'D';
		else 
			set credit = 'F';
	end case;
    select concat('취득 점수 >>> ', point), concat('학점 >>> ', credit);
end $$
delimiter ;
call caseProc();
        
### case문 활용 ###
# 회원의 총 구매액을 계산하여, 회원의 등급을 4단계로 나눠서 지정
# 1500 이상 - 최우수 고객
# 100 ~ 1499 - 우수 고객
# 1 ~ 999 - 일반 고객
# 0 이하(구매한 적 없음) - 유령 고객

# 구매 테이블(buy)에서 회원별로 총 구매액 산정
use market_db;
select M.mem_id, M.mem_name ,sum(price * amount) '총 구매액',
	case 
		when (sum(price * amount) >= 1500) then "최우수 고객"
		when (sum(price * amount) >= 1000) then '우수" 고객'
		when (sum(price * amount) >= 1) then '일반 고객'
		else '유령 고객'
	end '회원등급' -- 출력될 case문의 컬럼명을 지정
	from buy as B
		right join members as M 
        -- 구매 테이블에는 구매한 적이 없어도 
        -- 회원 테이블에 있는 회원은 모두 출력해야 하기 때문에 외부 조인을 사용
        on B.mem_id = M.mem_id
    group by M.mem_id
    order by sum(price * amount) desc;

-- persons 테이블에서 주어진 person_id를 가져와서
-- 그 나이에 따라 카테고리 분류
DELIMITER $$
CREATE PROCEDURE GetPersonCategory(IN person_id INT)
BEGIN
    DECLARE person_age INT;
    DECLARE person_category VARCHAR(20);

    SELECT age INTO person_age
    FROM persons
    WHERE id = person_id;

    SET person_category = 
    CASE
        WHEN person_age < 20 THEN 'Teenager'
        WHEN person_age BETWEEN 20 AND 30 THEN 'Young Adult'
        ELSE 'Adult'
    END;

    SELECT person_category;
END $$
DELIMITER ;