drop database if exists naver_db;
create database naver_db;

# 테이블
# : 표 형태로 구성된 2차원 구조
# : 열(로우, 레코드)과 행(컬럼, 필드)으로 구성

# 테이블 구조 정의

# 회원 테이블(members)
# 아이디 mem_id char(8) not null (PK)
# 회원 이름 mem_name varchar(10) not null 
# 인원수 mem_numberr tinyint not null
# 주소 addr char(2) not null

# 연락처 국번 phone1 char(3) null허용
# 전화번호 phone2 char(8) null허용
# 평균 키 height tinyint null 허용 - unsigned (0 ~ 255)
# 데뷔 일자 debut_date date null 허용

use naver_db;

drop table if exists member;
create table member -- 회원 테이블
( mem_id        CHAR(8) NOT NULL PRIMARY KEY, -- 회원 아이디(PK)
  mem_name      VARCHAR(10) NOT NULL, -- 이름
  mem_number    TINYINT NOT NULL,  -- 인원수
  addr          CHAR(2) NOT NULL, -- 주소(경기,서울,경남 식으로 2글자만입력)
  phone1        CHAR(3) NULL, -- 연락처의 국번(02, 031, 055 등)
  phone2        CHAR(8) NULL, -- 연락처의 나머지 전화번호(하이픈제외)
  height        TINYINT UNSIGNED NULL,  -- 평균 키
  debut_date    DATE NULL  -- 데뷔 일자
);


# 구매 테이블(buy)

# 순번 num int not null 기본키(PK), 자동 증가
# 아이디 mem_id char(8) not null (FK)
# 제품 이름 prod_name char(6) not null
# 분류 group_name char(4) null 허용
# 가격 price int not null - unsigned
# 수량 amount smallint not null - unsigned

DROP TABLE IF EXISTS buy;
CREATE TABLE buy -- 구매 테이블
(  num         INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- 순번(PK)
   mem_id      CHAR(8) NOT NULL, -- 아이디(FK)
   prod_name     CHAR(6) NOT NULL, --  제품이름
   group_name     CHAR(4) NULL , -- 분류
   price         INT UNSIGNED NOT NULL, -- 가격
   amount        SMALLINT UNSIGNED  NOT NULL, -- 수량
   FOREIGN KEY(mem_id) REFERENCES member(mem_id)
);

INSERT INTO member VALUES('TWC', '트와이스', 9, '서울', '02', '11111111', 167, '2015-10-19');
INSERT INTO member VALUES('BLK', '블랙핑크', 4, '경남', '055', '22222222', 163, '2016-8-8');
INSERT INTO member VALUES('WMN', '여자친구', 6, '경기', '031', '33333333', 166, '2015-1-15');

INSERT INTO buy VALUES( NULL, 'BLK', '지갑', NULL, 30, 2);
INSERT INTO buy VALUES( NULL, 'BLK', '맥북프로', '디지털', 1000, 1);
INSERT INTO buy VALUES( NULL, 'APN', '아이폰', '디지털', 200, 1);