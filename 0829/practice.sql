use practiceDB;
# 1. 문제: John Doe 학생이 Programming 강좌에 등록되어 있는지 확인하고, 
# 등록되어 있으면 그의 grade를 출력하고, 
# 등록되어 있지 않으면 "Not Enrolled"를 출력하세요.

-- if문
set @student_id = 1; -- students 테이블
set @course_id = 103; -- courses 테이블

select
	if(
		exists( -- exists 함수를 사용하여 해당 조건의 행이 존재하는지 확인
			select * from enrollments where student_id = @student_id and course_id = @course_id
		),
        (select grade from enrollments where student_id = @student_id and course_id = @course_id),
        'Not Enrolled' -- 해당 조건의 행이 존재하지 않을 경우 실행할 문장
	) as output; -- 선택된 결과의 별칭

# 2. 문제: 각 학생의 전공에 따라, 그들이 수강한 강좌의 총 학점을 계산하세요. 
# 만약 학생의 전공이 'Computer Science'라면, 그의 총 학점을 2배로 계산하세요.

-- case문
select 
	student_name,
    major,
    sum(
		case
			when major = 'Computer Science'
            then credit * 2
            else credit
		end
    ) as total_credits
from Students
join Enrollments on Students.student_id = Enrollments.student_id
join Courses on Enrollments.course_id = Courses.course_id
group by student_name, major; 
-- group by절을 사용할 때 select절의 모든 열이 포함되어 있어야 한다.
-- sum()과 같은 집계함수를 사용할 경우 예외

# 3. 문제: 1부터 5까지의 학생ID에 대해 각 학생이 등록한 강좌의 수를 출력하세요.
# 프로시져 사용

drop procedure if exists GetEnrollmentCount;
-- 프로시저를 생성하고 호출한 후에는 반드시 삭제하는 것이 좋다.

delimiter //
create procedure GetEnrollmentCount()
begin
	declare i int default 1;
    while i <= 5 do
		select student_id, count(*) as course_count
        from enrollments
        group by student_id;
        -- where student_id = i;
        -- set i = i + 1;
	end while;
end;
//
delimiter ;

call GetEnrollmentCount();
