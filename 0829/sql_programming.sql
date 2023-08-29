### SQL 프로그래밍 ###
# sql_programming

# 스토어드 프로시저
# : MySQL에서 프로그래밍 기능이 필요할 때 사용하는 데이터베이스 개체
# : SQL 프로그래밍은 기본적으로 스토어드 프로시저 안에 작성되어야 한다.

delimiter $$ -- 기호 2개를 연속해서 사용하는 것이 일반적 
create procedure sqlProgramming()
begin 
	-- 이 부분에 SQL 프로그래밍 코딩
end $$ -- 스토어드 프로시저 종료
-- 스토어드 프로시저의 코딩 부분
delimiter ;

call sqlProgramming(); -- 스토어드 프로시저 실행