use  student_society;


-- practice 
SELECT course , COUNT(*) from student
GROUP BY course;

-- 1. Retrieve names of students enrolled in any society. 

SELECT distinct count(student.name)
FROM student
JOIN enrollment
ON student.rollno = enrollment.rollno;


SELECT distinct student.name
FROM student
JOIN enrollment
ON student.rollno = enrollment.rollno;



-- 2. Retrieve all society names. -- 
select distinct count(socname)
from society;

select distinct socname
from society;


-- 3. Retrieve students' names starting with letter ‘A’. 
select distinct count(name) from student
where name  like"A%";

select distinct * from student
where name  like"A%";

-- 4. Retrieve students' details studying in courses ‘computer science’ or ‘chemistry’.  
   --   (note i make course like bsc bca so i use this hear instead of cemistry or computer science)
select * from student 
where course = "BSc CS" 
	OR course = "BCA";
 
-- 5. Retrieve students’ names whose roll no either starts with ‘X’ or ‘Z’ and ends with ‘9’

select student.name, student.rollno from student 
 --   where name like "X%"
--    or name like "Z%"     --   thier is no student who name start with x or z 
   -- and 
    where rollno like "%9";
    
-- 6. Find society details with more than N TotalSeats where N is to be input by the user  
-- let we N == 100 

select society.socname from society
where totalseat >= 100;


-- 7. Update society table for mentor name of a specific society 

update society
set mentorname = "gagandeep"
where socID = "SOC001";
 
 select * from society 
 where mentorname = "gagandeep";
 
 
 -- 8. Find society names in which more than five students have enrolled 
SELECT society.socname, COUNT(enrollment.rollno) AS total_students
FROM society
INNER JOIN enrollment
ON society.socID = enrollment.socID
GROUP BY society.socID, society.socname
HAVING COUNT(enrollment.rollno) > 5;


-- 9. Find the name of youngest student enrolled in society ‘NSS’ -- -- 
select student.name from student
join enrollment
on student.rollno = enrollment.rollno
join society
on enrollment.socID = society.socID
where society.socname = "NSS"
order by  student.dob DESC
limit 1; 

select * from student
join enrollment
on student.rollno = enrollment.rollno
join society
on enrollment.socID = society.socID
where society.socname = "NSS"
order by  student.dob DESC;
    
    
-- 10. Find the name of most popular society (on the basis of enrolled students) 

select society.socname ,count(enrollment.rollno) from society
join enrollment
on society.socID = enrollment.socID
group by society.socID,society.socname
order by count(enrollment.rollno) desc;    
    
SELECT society.socname, COUNT(enrollment.rollno) AS total_students
FROM society
JOIN enrollment
ON society.socID = enrollment.socID
GROUP BY society.socID, society.socname
ORDER BY total_students DESC
LIMIT 1;    

-- 11. Find the name of two least popular societies  (on the basis of enrolled students)
SELECT society.socname, COUNT(enrollment.rollno) AS total_students
FROM society
JOIN enrollment
ON society.socID = enrollment.socID
GROUP BY society.socID, society.socname
ORDER BY total_students asc
LIMIT 2; 

-- 12. Find the student names who are not enrolled in any society 

select count(student.name) from student
left join enrollment
on student.rollno = enrollment.rollno
where enrollment.rollno is null;
SELECT *
FROM   student
LEFT JOIN enrollment
ON     student.rollno = enrollment.rollno
WHERE enrollment.rollno IS NULL;
SELECT student.name
FROM student
LEFT JOIN enrollment
ON student.rollno = enrollment.rollno
WHERE enrollment.rollno IS NULL;

-- 13. Find the student names enrolled in at least two societies 
-- 14. Find society names in which maximum students are enrolled 
-- 15. Find names of all students who have enrolled in any society and society names in which at 
least one student has enrolled  
select student.name ,count(student.rollno) as total_enrollments from student 
join enrollment 
ON student.rollno = enrollment.rollno
group by  student.name , student.rollno;
having count(enrollment.socID) >=2;
use student_society;


SELECT SUM(total_enrollments)
from(
SELECT student.name, COUNT(student.rollno) AS total_enrollments
FROM student
JOIN enrollment
ON student.rollno = enrollment.rollno
GROUP BY student.rollno, student.name
)as temp;
SELECT *
FROM student
JOIN enrollment
ON student.rollno = enrollment.rollno
GROUP BY student.name, enrollment.rollno
HAVING COUNT(enrollment.socID) >= 1 ;

-- 16. Find names of students who are enrolled in any of the three societies ‘Debating’(we dont have debating soo we take drama), ‘Dancing’ 
-- and ‘Sashakt' we take singing society)

select student.name from student
join enrollment
on student.rollno = enrollment.rollno
join society
on enrollment.socID = society.socID
where society.socname in ("Dance Society","Drama Society","Singing Society");

-- 17. Find society names such that its mentor has a name with   ‘Gupta’ in it.  
select * from society
where society.mentorname like "%Gupta%";

-- 18. Find the society names in which the number of enrolled students is only 10% of  its 
-- capacity. 
SELECT society.socname
FROM society
JOIN enrollment
ON society.socID = enrollment.socID
GROUP BY society.socID, society.socname, society.totalseat
HAVING COUNT(enrollment.rollno) = 0.1 * society.totalseat;

-- 19. Display the vacant seats for each society
SELECT society.socname,
       society.totalseat - COUNT(enrollment.rollno) AS vacant_seats
FROM society
LEFT JOIN enrollment
ON society.socID = enrollment.socID
GROUP BY  society.socname, society.totalseat;


-- 20. Increment Total Seats of each society by 10%
UPDATE society
SET totalseat = totalseat * 1.10;
select * from society;


-- 21 Add the enrollment fees paid (‘yes’/’No’) field in the enrollment table.
ALTER TABLE enrollment
ADD fees_paid VARCHAR(3);
select * from enrollment;


SELECT society.socname, COUNT(enrollment.rollno)
FROM society
LEFT JOIN enrollment
ON society.socID = enrollment.socID
GROUP BY  society.socname;


CREATE VIEW society_enrollment_view AS
SELECT society.socname,
       COUNT(enrollment.rollno) AS total_students
FROM society
LEFT JOIN enrollment
ON society.socID = enrollment.socID
GROUP BY society.socID, society.socname;

SELECT * FROM society_enrollment_view;

-- 25. Count the number of societies with more than 5 students enrolled in it 

select society.name , count(enrollment.socID)
from society
join enrollment
on society.socID = enrollment.socID;


-- 26. Add column Mobile number in student table with default value ‘9999999999’ 
alter table student
add mobile_number varchar(10)
default "9999999999";

select * from student;

-- 27. Find the total number of students whose age is > 20 years. 

SELECT COUNT(*) AS total_students
FROM student
WHERE TIMESTAMPDIFF(YEAR, dob, CURDATE()) > 20;

SELECT * 
FROM student
WHERE TIMESTAMPDIFF(YEAR, dob, CURDATE()) > 20;



-- 28. Find names of students who are born in 2001 and are enrolled in at least one society.

SELECT DISTINCT student.name
FROM student
JOIN enrollment
ON student.rollno = enrollment.rollno
WHERE YEAR(student.dob) = 2001;

-- 29. Count all societies whose name starts with ‘S’ and ends with ‘t’ and at least 5 students are  enrolled in the society.

SELECT COUNT(*) AS total_societies
FROM (
    SELECT society.socID
    FROM society
    JOIN enrollment
    ON society.socID = enrollment.socID
    WHERE society.socname LIKE 'S%t'
    GROUP BY society.socID, society.socname
    HAVING COUNT(enrollment.rollno) >= 5
) AS temp;

-- 30. Display the following information: 
-- Society name     Mentor name     Total Capacity    Total Enrolled    Unfilled Seats

SELECT society.socname,
       society.mentorname,
       society.totalseat AS total_capacity,
       COUNT(enrollment.rollno) AS total_enrolled,
       society.totalseat - COUNT(enrollment.rollno) AS unfilled_seats
FROM society
LEFT JOIN enrollment
ON society.socID = enrollment.socID
GROUP BY society.socID, society.socname, society.mentorname, society.totalseat;
