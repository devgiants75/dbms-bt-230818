### 실습 데이터베이스 생성 ###

# 인터넷 마켓 DB 구성도
# 회원테이블(member)
# : 아이디, 이름, 인원, 주소, 국번, 전화번호, 평균 키, 데뷔 일자

# 구매 테이블(buy)
# : 순번, 아이디, 물품명, 분류, 단가, 수량

drop database if exists market_db;
create database market_db;

-- use
-- : market_db 데이터베이스를 선택하는 명령어
-- : navigator에서 데이터베이스명을 더블 클릭한 동작과 동일한 효과
use market_db;

create table members -- 회원 테이블
( 
mem_id char(8) not null primary key, -- 회원아이디(PK)
mem_name varchar(10) not null, -- 이름
mem_number int not null, -- 인원수
addr char(6) not null, -- 주소(경기, 서울, 경남 식으로 2글자만 입력)
phone1 char(3), -- 연락처의 국번(02, 051, 031 등)
phone2 char(8), -- 연락처의 나머지 전화번호(하이픈 제외)
height smallint, -- 평균 키
debut_date date -- 데뷔 일자
);

-- 순번, 아이디, 물품명, 분류, 단가, 수량
create table buy -- 구매 테이블
(
num int auto_increment not null primary key, -- 순번(PK)
mem_id char(8) not null, -- 아이디 (FK)
prod_name char(6) not null, -- 제품 이름
group_name char(4), -- 분류
price int not null, -- 단가
amount smallint not null, -- 수량
foreign key (mem_id) references members(mem_id)
);

INSERT INTO members VALUES('TWC', '트와이스', 9, '서울', '02', '11111111', 167, '2015.10.19');
INSERT INTO members VALUES('BLK', '블랙핑크', 4, '경남', '055', '22222222', 163, '2016.08.08');
INSERT INTO members VALUES('WMN', '여자친구', 6, '경기', '031', '33333333', 166, '2015.01.15');
INSERT INTO members VALUES('OMY', '오마이걸', 7, '서울', NULL, NULL, 160, '2015.04.21');
INSERT INTO members VALUES('GRL', '소녀시대', 8, '서울', '02', '44444444', 168, '2007.08.02');
INSERT INTO members VALUES('ITZ', '잇지', 5, '경남', NULL, NULL, 167, '2019.02.12');
INSERT INTO members VALUES('RED', '레드벨벳', 4, '경북', '054', '55555555', 161, '2014.08.01');
INSERT INTO members VALUES('APN', '에이핑크', 6, '경기', '031', '77777777', 164, '2011.02.10');
INSERT INTO members VALUES('SPC', '우주소녀', 13, '서울', '02', '88888888', 162, '2016.02.25');
INSERT INTO members VALUES('MMU', '마마무', 4, '전남', '061', '99999999', 165, '2014.06.19');

INSERT INTO buy VALUES(NULL, 'BLK', '지갑', NULL, 30, 2);
INSERT INTO buy VALUES(NULL, 'BLK', '맥북프로', '디지털', 1000, 1);
INSERT INTO buy VALUES(NULL, 'APN', '아이폰', '디지털', 200, 1);
INSERT INTO buy VALUES(NULL, 'MMU', '아이폰', '디지털', 200, 5);
INSERT INTO buy VALUES(NULL, 'BLK', '청바지', '패션', 50, 3);
INSERT INTO buy VALUES(NULL, 'MMU', '에어팟', '디지털', 80, 10);
INSERT INTO buy VALUES(NULL, 'GRL', '갤럭시버즈', '서적', 15, 5);
INSERT INTO buy VALUES(NULL, 'APN', '갤럭시버즈', '서적', 15, 2);
INSERT INTO buy VALUES(NULL, 'APN', '청바지', '패션', 50, 1);
INSERT INTO buy VALUES(NULL, 'MMU', '지갑', NULL, 30, 1);
INSERT INTO buy VALUES(NULL, 'APN', '갤럭시버즈', '서적', 15, 1);
INSERT INTO buy VALUES(NULL, 'MMU', '지갑', NULL, 30, 4);
