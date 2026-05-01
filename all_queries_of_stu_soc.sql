use  student_society;

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

SELECT student.name
FROM student
LEFT JOIN enrollment
ON student.rollno = enrollment.rollno
WHERE enrollment.rollno IS NULL;
