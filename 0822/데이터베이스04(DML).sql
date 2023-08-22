### DML ###

# select
# select 구문을 사용하여 테이블의 데이터를 선택 가능

# 기본형태
# select 컬럼명
# from 테이블명
# where 조건;

# select의 주요 특징
# select 키워드 뒤에 *(별표) 사용 시 테이블의 모든 열을 조회
# where 조건절을 사용하여 특정 조건을 만족하는 행만 출력

select * from member
where member_id = 'human1';

select member_id, member_addr from member
where member_name = '이승아';
