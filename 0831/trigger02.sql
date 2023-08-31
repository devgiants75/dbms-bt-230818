### 트리거 활용 ###
# : 트리거는 테이블에 입력/수정/삭제되는 정보를 백업하는 용도로 활용 가능

# market_db의 고객 테이블(members)에 입력된 회원의 정보가 변경될 때
# 변경한 사용자, 시간, 변경 전의 데이터 등을 기록하는 트리거 생성alter

use market_db;
-- 테이블을 복사해서 새로운 테이블을 생성
-- 기본 키 정의는 복사되지 X
create table singer (
	select mem_id, mem_name, mem_number, addr from members
);

# 가수 테이블에서 insert나 update 작업이 일어나는 경우
# , 변경되기 전의 데이터를 저장할 백업 테이블 생성

# modType(수정 or 삭제), modDate(변경된 날짜), modUser(변경한 사용자)
create table backup_singer
(
	mem_id char(8) not null,
    mem_name varchar(10) not null,
    mem_number int not null,
    addr char(2) not null,
    modType char(2), -- 변경된 타입, '수정' 또는 '삭제'
    modDate DATE, -- 변경된 날짜
    modUser varchar(30) -- 변경한 사용자
);

drop trigger if exists singer_updateTrg;
delimiter $$
create trigger singer_updateTrg -- 트리거 이름 
	after update -- 변경 후에 작동하도록 지정
	on singer -- 트리거를 부착할 테이블 지정
    for each row
begin 
	insert into backup_singer 
    values ( OLD.mem_id, OLD.mem_name, OLD.mem_number, OLD.addr
		, '수정', curdate(), current_user() );
end $$
delimiter ;

-- OLD 테이블
# : update나 delete가 수행될 때, 
# : 변경되기 전의 데이터가 잠깐 저장되는 임시 테이블

# OLD 테이블에 update문이 작동되면 이 행에 의해서 업데이트되기 전까지의 데이터가
# 백업 테이블(backup_singer)에 입력 -- 원래 데이터가 보존됨.

# curdate(): 현재 날짜
# currend_user(): 현재 작업 중인 사용자를 알려주는 함수

drop trigger if exists singer_deleteTrg;
delimiter $$
create trigger singer_deleteTrg -- 트리거 이름
	after delete
    on singer
    for each row
begin
	insert into backup_singer
    values( OLD.mem_id, OLD.mem_name, OLD.mem_number, OLD.addr,
		'삭제', curdate(), current_user() );
end $$
delimiter ;

-- 하나의 테이블에 여러 개의 트리거 부착 가능

update singer set addr = '영국' where mem_id = 'BLK';

-- singer테이블에서 멤버수가 7명 이상인 데이터를 삭제
delete from singer where mem_number >= 7;

-- backup_singer테이블 조회
select * from backup_singer;

# 테이블의 모든 행 데이터를 삭제
# truncate 사용
truncate table singer;

select * from backup_singer;
-- truncate로 삭제된 데이터가 저장되어 있지 X
-- truncate table로 삭제할 경우 트리거가 작동되지 X
    
# 트리거가 사용하는 임시 테이블

# 테이블에 insert, update, delete작업이 수행될 경우 임시로 사용되는 시스템 테이블이 2개
# : NEW, OLD 테이블
# : mySQL 내장 테이블

# 1. NEW 테이블
# : insert문이 실행될 때 동작
# : insert문 실행 시 해당 데이터가 NEW 테이블에 저장되었다가
# : 사용자가 생성한 테이블로 이동
# : 자주 사용 X

# 2. OLD 테이블
# : update, delete문이 실행될 때 동작
# : update, delete문 실행 시 해당 데이터가 OLD 테이블에 저장되었다가
# : 지정된 동작 수행
# : 트리거 사용 시 사용 O