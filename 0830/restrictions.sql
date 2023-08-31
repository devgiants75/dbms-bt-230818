### Restrictions ###

# 제약 조건(Constraint)
# : 데이터의 무결성을 지키기 위해 제한하는 조건

# 데이터의 무결성
# : '데이터에 결함이 없음'

# Primary Key 기본키
# : 데이터를 구분할 수 있는 식별자
# : 데이터 중복X, Null값 입력X
# : 테이블은 기본 키를 1개만 가질 수 있다.

# Create Table에서 설정 - 생성 시 지정
# 1. mem_id char(8) not null primary key -- 열 이름 뒤에 작성
# 2. primary key (mem_id) -- 제일 마지막 행에 추가 작성

# Alter Table에서 설정 - 수정하여 작성
drop table if exists member;
create table member
(
	mem_id char(8) not null,
    mem_name varchar(10) not null,
    height tinyint unsigned null
);
alter table member
	add constraint -- 제약 조건을 추가 
    primary key (mem_id);

# Foreign Key 외래키
# : 두 테이블 사이의 관계를 연결, 그 결과 데이터의 무결성을 보장
# : 외래 키가 설정된 열은 꼭 다른 테이블의 기본 키와 연결

# 기준 테이블: 기본 키가 있는 테이블 (member)
# 참조 테이블: 외래 키가 있는 테이블 (buy)
-- 기준 테이블의 열이 PK 또는 UQ가 아니라면 외래 키 관계는 설정 X

# Create Table - 테이블 생성 시 지정
drop table if exists member;
create table member
(
	mem_id char(8) not null primary key,
    mem_name varchar(10) not null,
    height tinyint unsigned null
);

drop table if exists buy;
create table buy
(
	num int auto_increment not null primary key,
    mem_id char(8) not null,
    prod_name char(6) not null,
    foreign key(mem_id) references member(mem_id)
);

# Alter Table -- 수정 시 작성
drop table if exists buy;
create table buy
(
	num int auto_increment not null primary key,
    mem_id char(8) not null,
    prod_name char(6) not null
);
alter table buy
	add constraint -- 제약 조건 추가
    foreign key (mem_id)
    references member(mem_id);

# Unique Key 
# : 열에 중복된 값을 가지지 않도록 하는 제약 조건
# : 하나의 테이블은 여러 개의 unique키를 가질 수 있다.

# PK와의 차이점
# : PK는 null값 허용 X(not null) 
#   / UQ는 null값 허용O(null 허용 가능) -- null 값은 중복 가능

# : PK는 테이블 내에서 1번만 지정 가능
#   / UQ는 테이블 내에서 여러 개의 UQ를 가질 수 있다.


# Check 
# : 입력되는 데이터를 점검하는 기능
drop table if exists member;
create table member
(
	mem_id char(8) not null primary key,
    mem_name varchar(10) not null,
    height tinyint unsigned null check (height >= 100),
    phone1 char(3) null
);

alter table member
	add constraint
    check (phone1 in ('02', '031', '041', '051', '052'));

# Default 정의
# : 값을 입력하지 않았을 때 자동으로 입력될 값을 미리 지정해 놓는 방법
drop table if exists member;
create table member
(
	mem_id char(8) not null primary key,
    mem_name varchar(10) not null,
    height tinyint unsigned null check (height >= 100) default 160,
    phone1 char(3) null
);

alter table member
	alter column phone1 set default '02';
    
insert into member values('RED', '레드벨벳', 161, '054');
insert into member values('SPC', '우주소녀', default, default);

select * from member;

# Null 값 허용
# : 값을 비워진 채로 둘것인지 아닌지 지정
# : PK가 설정된 열에는 null값이 있을 수 없음.
# : 생략하면 자동으로 not null로 인식