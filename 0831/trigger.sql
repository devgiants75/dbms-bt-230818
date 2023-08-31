### 트리거 trigger ###

# 트리거
# : insert, update, delete문이 작동할 때 자동으로 실행되는 프로그래밍 기능
# EX) 데이터가 삭제될 때 해당 데이터를 다른 곳에 자동 백업

# 트리거 사용 이유
# : 사용자의 추가 작업을 미리 지정하여 데이터의 오류가 발생하는 것을 방지
# : 데이터의 무결성에 도움

# 트리거의 기본 작동
# : DML(Data Manipulation Language)문의 이벤트가 발생할 때 작동
# : DML - insert, update, delete 등

# 스토어드 프로시저와 문법 유사
# 차이점
# : call문으로 직접 실행 불가
# : insert, update, delete 등의 이벤트가 발생할 경우에만 자동으로 실행

# 테스트용 테이블 생성
use market_db;
create table if not exists trigger_table (id int, txt varchar(10));

insert into trigger_table values(1, '레드벨벳');
insert into trigger_table values(2, '잇지');
insert into trigger_table values(3, '블랙핑크');

# 트리거 부착!
drop trigger if exists myTrigger; -- 트리거명을 myTrigger로 지정

delimiter $$
create trigger myTrigger
	after delete -- 이 트리거를 delete문이 발생된 이후에 작동하라는 의미
    on trigger_table -- 이 트리거를 부착할 테이블을 지정
    for each row -- 각 행마다 적용시킴을 의미(트리거에 항상 작성)
begin
	set @msg = '가수 그룹이 삭제됨' ; -- 트리거 실행 시 작동되는 코드
end $$ -- 트리거에서 실제로 작동할 부분 
delimiter ;

set @msg = '';

insert into trigger_table values(4, '마마무');
select @msg;

update trigger_table set txt = '블핑' where id = 3;
select @msg;

delete from trigger_table where id = 4;
select @msg; -- delete 트리거는 delete문의 이벤트가 발생될 때만 작동