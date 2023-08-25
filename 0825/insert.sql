### insert: 데이터 입력 ###

# insert
# : 테이블에 행 데이터를 입력하는 sql문

# 1. 기본 문법
# insert into 테이블명 (열1, 열2, 열3, ...) values (값1, 값2, 값3, ...)

# 테이블명 뒤에 나오는 열은 생략 가능
# - 생략할 경우 values 뒤에 나오는 값들의 순서 및 개수는
# - 테이블을 정의할 때의 열 순서 및 개수와 동일해야 한다.

# market_db 데이터베이스를 선택
use market_db;

# practice1 테이블 생성 
# - toy_id int
# - toy_name char(4)
# - age int
create table practice1 (toy_id int, toy_name char(4), age int);

# practice1 테이블에 데이터를 1, '우디', 25
insert into practice1 values (1, '우디', 25);

# 열 데이터를 생략할 경우 생략한 열(나이, age)에는 
# 아무것도 없다는 의미의 null 값이 들어간다.
insert into practice1 (toy_id, toy_name) values (2, '버즈');

# 열 순서를 바꿔서 입력할 경우
insert into practice1 (toy_name, age, toy_id) values ('제시', 20, 3);

# 2. auto_increment
# : 열을 정의할 때 1부터 자동으로 증가하는 값을 입력
# : insert문을 작성할 때는 해당 열이 없다고 생각하고 입력
# : - auto_increment로 지정하는 열은 반드시 primary key로 지정!

create table practice2 (
	toy_id int auto_increment primary key,
    toy_name char(4),
    age int
);

# 자동으로 증가하는 부분은 insert문을 사용할 때 null값으로 채워 놓는다.
insert into practice2 values (null, '보핍', 25);
insert into practice2 values (null, '슬링키', 22);
insert into practice2 values (null, '렉스', 21);

select * from practice2;
    
# auto_increment로 증가된 수 확인: last_insert_id()
select last_insert_id();

# auto_increment로 증가되는 값의 시작을 지정
alter table practice2 auto_increment=100;
insert into practice2 values (null, '제님', 35);

select * from practice2;

# auto_increment로 증가되는 값을 지정
# : 시스템 변수인 @@auto_increment_increment를 변경

# 시스템 변수
# : MySQL에서 자체적으로 가지고 있는 설정값이 저장된 변수
# : 앞에 @@가 붙는 것이 특징

create table practice3 (
	toy_id int auto_increment primary key,
    toy_name char(4),
    age int
);
alter table practice3 auto_increment=1000;
set @@auto_increment_increment=3;

insert into practice3 values (null, '토마스', 20);
insert into practice3 values (null, '제임스', 23);
insert into practice3 values (null, '고든', 25);

select * from practice3;

# 3. 다른 테이블의 데이터를 한 번에 입력
# : insert into ~ select

# 3-1. 기본 형태
# inser into 테이블명 (열_이름1, 열_이름2, ...)
# 	select문;

# 3-2. 주의할 점
# : select문의 열 개수는 insert할 테이블의 열 개수와 같아야 한다.

# world 데이터베이스의 city 테이블의 개수 조회
# 열의 개수를 셀 경우 count(*)
# 데이터베이스명.테이블명: 다른 데이터베이스의 테이블에 접근 가능
select count(*) from world.city;

# desc명령: 테이블의 구조를 출력해주는 기능
# describe 약자 (묘사하다)
# descending: 내림차순 정렬 방식

desc world.city;

# city 테이블 데이터 확인
select * from world.city limit 5;

# city 테이블에서 도시 이름(Name), 인구(Population) 가져오기
create table city_popul (city_name char(35), population int);

insert into city_popul
	select Name, Population from world.city;

select * from city_popul limit 10;