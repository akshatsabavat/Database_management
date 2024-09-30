-- Assignment 01

-- PART 01
select name from instructor where dept_name="Finance";
select title as course_name, credits as course_credits from course where dept_name="Biology" and credits=4;
select * from course where title like "I%";
select course.course_id, course.title as course_title from takes Join course on course.course_id = takes.course_id where takes.ID = 12345;
select course.course_id, title as course_name from course join teaches on teaches.course_id = course.course_id where dept_name="History"
