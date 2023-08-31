### 트리거 복습 예제 ###

# after update, after delete 트리거 사용

# 1. employees 직원 테이블 생성
# employee_id 숫자(정수) 기본 키 설정
# first_name varchar(50)
# last_name varchar(50)
# salary 숫자(정수)

# 2. audit_log 테이블
# log_id 숫자(정수) 자동증가 기본 키 설정
# employee_id 숫자(정수)
# action varchar(50)
# timestamp timestamp default current_timestamp

# 트리거 설정
# after update
# : 직원 테이블이 수정될 경우
# : audit_log 테이블에 직원아이디와 활동을 저장
# : 직원 아이디는 New.employee_id
# : 활동 'Updated Salary'

# after delete
# :직원 테이블이 삭제될 경우
# : audit_log 테이블에 직원아이디와 활동을 저장
# : 해당 OLD테이블에서 직원 아이디 불러오기
# : 활동 'Deleted Employee'