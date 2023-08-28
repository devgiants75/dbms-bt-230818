### 조인 실습 ###

### 3개의 테이블을 사용하는 조인 실습 ###

create database practiceDB;
use practiceDB;

create table Students(
	student_id int primary key,
    student_name varchar(50),
    age int,
    major varchar(50)
);

create table Courses(
	course_id int primary key,
    course_name varchar(50),
    credit int
);

create table enrollments (
	enrollment_id int primary key,
    student_id int,
    course_id int,
    grade varchar(2),
    foreign key (student_id) references Students(student_id),
    foreign key (course_id) references Courses(course_id)
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