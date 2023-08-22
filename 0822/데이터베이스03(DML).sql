# insert into 테이블명(열 이름1, 열 이름2, 열 이름3, ...)
# values (데이터값1, 데이터값2, 데이터값3, ...)
# : 테이블명과 열 이름 - 따옴표 지정 없이 작성
# : 데이터값: 문자열의 경우 따옴표 붙여서 작성

INSERT INTO member (member_id, member_name, member_addr)
values('human4', '이주헌', '부산시 남구');

INSERT INTO member
values('human5', '이성훈', '부산시 동구');

# 2. Update
# : update 구문을 사용하여 테이블의 내용 수정 가능
# 2-1. 기본형태
# update 테이블명
# set 컬럼명1 = 데이터값1, 컬럼명2 = 데이터값2, ...
# where 컬럼명 =  데이터 값 (조건입력 / 생략 가능) 
# : 조건을 만족하는 필드의 값만을 수정
# : 조건을 생략하는 경우 테이블의 모든 행이 수정

update product
set cost = 5000
where product_name = '바나나';

# 3. delete
# : delete문을 사용하여 테이블의 값 삭제 가능
# : where절 없이 delete를 사용하는 경우 테이블의 모든 데이터가 삭제

# 3-1. 기본형태
# delete from 테이블명
# where 조건;

delete from product
where product_name = '빼빼로';
