use practiceDB;
-- 모든 학생의 이름과 그들이 등록한 강좌의 이름을 조회하세요.
select s.student_name, c.course_name
from Students as s
	left join Enrollments as e 
		on s.student_id = e.student_id
    left join Courses as c
		on e.course_id = c.course_id;

-- 'Computer Science' 전공인 학생들이 등록한 강좌의 이름과 학점을 조회하세요.
select s.student_name, c.course_name, c.credit
from Students as s
join Enrollments as e on s.student_id = e.student_id
join Courses as c on e.course_id = c.course_id
where s.major = 'Computer Science';

-- 등록한 강좌가 3개 이상인 학생들의 이름을 조회하세요.
select s.student_name
from Students as s
join enrollments as e on s.student_id = e.student_id
group by s.student_name -- student_name으로 그룹화, 학생별로 등록한 강좌들의 정보가 하나의 그룹으로 묶임
having count(e.course_id) >= 3; -- 그룹화된 데이터에 조건을 적용

-- 강좌별로 등록한 학생 수를 조회하세요.
select c.course_name, count(e.student_id) as student_count
from Courses as c
join enrollments as e on c.course_id = e.course_id
group by c.course_name;
