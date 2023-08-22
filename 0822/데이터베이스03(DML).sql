### DML ###

# DML(Data Manipulation Language)
# : 실제 데이터를 처리하는 언어
# : INSERT, UPDATE, DELETE, SELECT

# 1. insert
# : insert into 구문을 사용하여 테이블에 새로운 레코드(값) 추가 가능

# 1-1. 형태
# : insert into 구문에서 열 이름은 생략 가능
# : - 이 경우에는 해당 데이터베이스의 테이블 지정 순서대로 필드의 값이 자동 지정
# insert into 테이블명(열 이름1, 열 이름2, 열 이름3, ...)
# values (데이터값1, 데이터값2, 데이터값3, ...)
# : 테이블명과 열 이름 - 따옴표 지정 없이 작성
# : 데이터값: 문자열의 경우 따옴표 붙여서 작성

INSERT INTO member (member_id, member_name, member_addr)
values('human4', '이주헌', '부산시 남구');

INSERT INTO member
values('human5', '이성훈', '부산시 동구');