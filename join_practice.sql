use student_society;
-- kudd hi comment dunde gaa and ek baar ayga
SELECT *  from student  
NATURAL JOIN enrollment;

SELECT * FROM student s,
enrollment e
WHERE e.rollno = s.rollno;

SELECT *
FROM student
INNER JOIN enrollment
ON student.rollno = enrollment.rollno;


-- 2. LEFT JOIN
-- Kaam

-- Left table ki sab rows.

-- Student left me hai, toh sab students aayenge.
SELECT *
FROM student
LEFT JOIN enrollment
ON student.rollno = enrollment.rollno;


-- 3. RIGHT JOIN
-- Kaam

-- Right table ki sab rows.

-- Enrollment right side pe hai.

SELECT *
FROM student
RIGHT JOIN enrollment
ON student.rollno = enrollment.rollno;

-- 4. CROSS JOIN
-- Kaam

-- Sab combinations.

-- Har student × har society.

-- 4 students × 3 societies = 12 rows

SELECT student.name, society.socname
FROM student
CROSS JOIN society;



-- 6. 3 TABLE JOIN (most important)

-- Student kis society me hai.

-- Query
SELECT student.name, society.socname
FROM student
JOIN enrollment
ON student.rollno = enrollment.rollno
JOIN society
ON enrollment.socID = society.socID;