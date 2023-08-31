### 트리거 복습 예제 ###

# after update, after delete 트리거 사용

# 1. employees 직원 테이블 생성
# employee_id 숫자(정수) 기본 키 설정
# first_name varchar(50)
# last_name varchar(50)
# salary 숫자(정수)
create table employees(
	employee_id int primary key,
	first_name varchar(50),
	last_name varchar(50),
    salary int
);

# 2. audit_log 테이블 생성
# log_id 숫자(정수) 자동증가 기본 키 설정
# employee_id 숫자(정수)
# action varchar(50)
# timestamp timestamp default current_timestamp
create table audit_log (
	log_id int auto_increment primary key,
    employee_id int,
    action varchar(50),
    timestamp TIMESTAMP default current_timestamp
    -- TIMESTAMP: 데이터 타입
    -- 		날짜와 시간을 저장하는데 사용(기본값 지정X - 현재 날짜와 시간)
);

# 트리거 설정
# after update
# : 직원 테이블이 수정될 경우
# : audit_log 테이블에 직원아이디와 활동을 저장
# : 직원 아이디는 New.employee_id
# : 활동 'Updated Salary'
delimiter //
create trigger after_employee_update
	after update
    on employees
    for each row
begin
	insert into audit_log(employee_id, action)
    values (new.employee_id, 'Updated Salary');
end;
//
delimiter ;

# after delete
# :직원 테이블이 삭제될 경우
# : audit_log 테이블에 직원아이디와 활동을 저장
# : 해당 OLD테이블에서 직원 아이디 불러오기
# : 활동 'Deleted Employee'

delimiter %%

create trigger after_employee_delete
	after delete
    on employees
    for each row
begin
	insert into audit_log (employee_id, action)
    values (old.employee_id, 'Deleted Employee');
end;

%%
delimiter ;

insert into employees
values
(1, 'Seung Ah', 'Lee', 50000),
(2, 'Jun Gook', 'Lee', 55000),
(3, 'Do Kyung', 'Lee', 60000);

update employees set salary = 65000 where employee_id = 1;

select * from audit_log;

insert into employees values (4, 'Hello', 'Lee', 45000);

delete from employees where employee_id = 4;

select * from audit_log;