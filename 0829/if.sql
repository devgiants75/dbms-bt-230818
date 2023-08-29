### if문 ###

# 1. if 문 (만약 ~ 라면)
# : 조건문, 가장 많이 사용되는 프로그래밍 문법 중 하나

# if 문의 기본 형식
# : if 문은 조건식이 참이면 SQL 문장들을 실행
# : 그렇지 않으면 그냥 넘어감.

# if <조건식> then
# 	sql 문장 작성
#	-- sql 문장이 두 문장 이상일 경우 begin ~ end로 묶어야 한다.
# end if

drop procedure if exists ifProc1;

delimiter $$
create procedure ifProc1()
begin
	if 100 = 100 then -- sql에서는 같다는 의미로 =(등호 1개)를 사용
		select '100은 100과 같다.';
	end if;
end $$ -- sql의 끝인지, 스토어드 프로시저의 끝인지 구별하기 위해 $$ 사용
delimiter ; 

call ifProc1();

# 2. if ~ else문
# : 조건에 따라 다른 부분을 수행

# : 조건식이 참이라면 sql문장1
# : 조건식이 거짓이라면 sql문장2

drop procedure if exists ifProc2;
delimiter $$
create procedure ifProc2()
begin
	declare myNum int; -- declare 예약어를 사용해 myNum 변수를 선언
	set myNum = 200;
    if myNum = 100 then
		select 'myNum은 100입니다.';
	else
		select 'myNum은 100이 아닙니다.';
	end if;
end $$
delimiter ;
call ifProc2();

### if문 활용 ###
# 데뷔 일자가 5년이 넘었는지 확인,
# 5년이 넘었을 경우 축하 메시지를 출력

drop procedure if exists ifProc3;

delimiter $$ -- sql의 기본 구분자(세미콜론)를 일시적으로 변경하는 명령어
create procedure ifProc3()
begin 
	declare debutDate date; -- 데뷔일자
	declare currentDate date; -- 오늘
	declare days int; -- 활동한 일수
    
    select debut_date into debutDate
		from market_db.members
        where mem_id = 'ITZ';
	
    set currentDate = current_date(); -- 현재 날짜를 출력하는 함수
    set days = datediff(currentDate, debutDate); -- 날짜의 차이, 일 단위
    
    if (days/365) >= 5 then -- 5년이 지났다면
		select concat('데뷔한 지', days, '일이 지났습니다. 축하드립니다.');
	else 
		select '데뷔한 지' + days + '일입니다.';
	end if;
end $$
delimiter ; -- 다시 기본 구분자를 기본 형태인 세미콜론으로 변경

call ifProc3();