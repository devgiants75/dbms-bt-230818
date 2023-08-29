### while 문 ###

# 1. while문
# : 조건식이 참인 동안에 반복해서 실행하는 반복문

# 1에서 100까지 합계를 계산(4의 배수는 제외)
# 1 + 2 + 3 + 5 + 6 + 7 + 9 + ...
# 1000이 넘는 경우 프로그램을 종료

# while문의 기본 형태
# while <조건식> do
#  	sql문장
# end while;

# iterate, leave문을 활용
# iterate [레이블]: 지정한 레이블로 가서 계속 진행
# leave [레이블]: 지정한 레이블을 빠져 나감. 즉 while문 종료

drop procedure if exists whileProc;

delimiter $$
create procedure whileProc()
begin 
	declare i int; -- 1에서 100까지 증가할 변수
    declare hap int; -- 더한 값을 누적할 변수
    set i = 1;
    set hap = 0;
    
    myWhile: -- 레이블 지정, 콜론(:)으로 해당 레이블 지정
    while (i <= 100) do -- i가 100이하인 동안에 계속 반복
		-- x % y: x를 y로 나눈 나머지 
		if (i % 4 = 0) then
			set i = i + 1;
            iterate myWhile; -- 지정한 레이블로 가서 계속 진행
		end if;
		-- hap의 원래 값에 i를 더해서 다시 hap에 넣으라는 의미
		set hap = hap + i;
        -- i의 원래 값에 1을 더해서 다시 i에 넣으라는 의미
        if (hap > 1000) then
			leave myWhile; -- 지정한 레이블을 떠남. 즉 while문 즉시 종료
		end if;
        set i = i + 1;
	end while;
    
    select '1부터 100까지의 합(4의 배수는 제외), 1000이 넘으면 종료 >>', hap;
end $$
delimiter ;
call whileProc();