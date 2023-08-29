### 조인 실습 ###

### 3개의 테이블을 사용하는 조인 실습 ###

create database practiceDB;
use practiceDB;

-- Students 테이블 생성
-- 학생의 정보를 저장하는 테이블
create table Students( 
	student_id int primary key, -- 학생의 고유 ID(기본키)
    student_name varchar(50), 	-- 학생의 이름
    age int,					-- 학생의 나이
    major varchar(50)			-- 학생의 전공
);

-- Coureses 테이블 생성
-- 강좌의 정보를 저장하는 테이블
create table Courses(
	course_id int primary key, -- 강좌의 고유 ID(기본키)
    course_name varchar(50),   -- 강좌 이름
    credit int				   -- 강좌 학점
);

-- Enrollments 테이블 생성
-- 학생의 강좌 등록 정보를 저장하는 테이블
create table enrollments (
	enrollment_id int primary key,	-- 강좌 등록의 고유 ID(기본키)
    student_id int,					-- 학생 고유 ID(외래키)
    course_id int,					-- 강좌 고유 ID(외래키)
    grade varchar(2),				-- 학점
    foreign key (student_id) references Students(student_id),	-- Students 테이블 참조
    foreign key (course_id) references Courses(course_id)		-- Courses 테이블 참조
);

INSERT INTO Students (student_id, student_name, age, major)
VALUES (1, 'John Doe', 20, 'Computer Science'),
       (2, 'Jane Doe', 22, 'Mathematics'),
       (3, 'Jim Brown', 21, 'Physics');

INSERT INTO Courses (course_id, course_name, credit)
VALUES (101, 'Calculus', 3),
       (102, 'Physics', 4),
       (103, 'Programming', 3);

INSERT INTO Enrollments (enrollment_id, student_id, course_id, grade)
VALUES (1, 1, 101, 'A'),
       (2, 1, 103, 'B'),
       (3, 2, 101, 'B'),
       (4, 2, 102, 'A'),
       (5, 3, 102, 'C');

-- 실습을 위한 추가 데이터 삽입 (0829)
insert into enrollments (enrollment_id, student_id, course_id, grade)
VALUES	(6, 1, 102, 'B'),
		(7, 2, 102, 'B'),
        (8, 2, 103, 'A'),
        (9, 3, 102, 'B');
