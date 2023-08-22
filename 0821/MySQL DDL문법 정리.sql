-- DDL 문법 정리 --
-- CREATE, ALTER, DROP

-- 1. 테이블 생성 (CREATE)
-- 1-1. GUI 방식으로 스키마 & 테이블 생성 (student)

-- : 왼쪽 상단의 아이콘 메뉴바 네 번째의 스키마 아이콘 선택
-- : 스키마명 입력 후 > 인코딩 설정을 utf8, utf8_general_ci로 설정

-- : 왼쪽 네비게이션 패널에서 생성하고자하는 위치의 스키마 선택
-- : 선택된 스키마 Tables에서 마우스 오른쪽 클릭 > Create Table 선택
-- : 테이블 설정(테이블명, 컬럼명, 컬럼 조건 지정)
-- : 반드시 Apply 버튼 클릭하여 생성

-- 1-2. SQL문 작성 방식으로 테이블 생성 (company)
-- SQL Editor 열기: 상단 메뉴 File > New Qeury Tab 선택 또는 파일 아이콘 선택

-- 스키마 생성 SQL문: create database 스키마(데이터베이스)명;
create database company; 

-- 테이블 생성 SQL문: create table 스키마명.테이블명 (
-- 컬럼1 데이터타입 옵션,
-- 컬럼2 데이터타입 옵션,
-- ...
-- PRIMARY KEY(컬럼명)
-- )
-- DEFAULT CHARACTER SET = utf8;

create table `company`.`human_resoureces` (
	employee_number INT AUTO_INCREMENT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    employee_age INT NOT NULL,
    employee_score INT NOT NULL,
    employee_email VARCHAR(100)
)
DEFAULT CHARACTER SET = utf8;

-- 2. 테이블 수정(ALTER)
-- 2-1. GUI방식으로 열 추가/수정/삭제
-- 좌측 상단의 Navigator 패널에서 변경하려는 테이블을 우클릭하고
-- Alter Table을 선택
-- 해당 페이지에서 열 추가/수정/삭제 후 반드시 apply 버튼을 클릭하여 적용

-- 2-2. SQL문 방식으로 열 추가/수정/삭제
-- 열 추가
alter table `human_resoureces`
add column employee_vacation_date DATE;

-- 열 수정
alter table `human_resoureces`
modify column employee_email VARCHAR(150) NOT NULL;

-- 열 삭제
alter table `human_resoureces`
drop column employee_test;

-- 열 이름 변경 [기존열이름 새열이름 데이터타입 (옵션)]
alter table `human_resoureces`
change column `employee_number` `employee_num` int;

-- 제약 조건 수정
-- 제약 조건 수정 시에는 열 이름을 소괄호 안에 작성
-- add unique (employee_phone_number);

-- unique 제약조건 추가
alter table `human_resoureces`
add primary key (employee_num);

-- 3. 스키마/테이블 삭제(drop)
-- 3-1. GUI 방식으로 스키마/테이블 삭제
-- 좌측 navigator 패널에서 schemas 섹션에 삭제하고자하는 스키마/테이블 확인
-- 삭제하고자하는 스키마/테이블명 우클릭
-- Drop Schemas/Table 옵션 선택

-- 3-2. SQL문을 사용한 스키마/테이블 삭제
-- 스키마 삭제 문법
drop database `company`;
-- 테이블 삭제 문법
-- 데이터베이스명.테이블명 / 데이터베이스 선택 시에는 테이블명만 작성 가능
drop table `company`.`human_resoureces`;