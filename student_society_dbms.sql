create database student_society;
drop table student;
create table student(
    rollno char(6) NOT NULL primary KEY,
    name varchar(50),
    course varchar(20),
    dob DATE
    );
drop table society;
create table society(
      socID CHAR(60) NOT NULL PRIMARY KEY,
      socname varchar(40),
      mentorname varchar(15),
      totalseat int unsigned
      );
      
drop table enrollment;
--     create table enrollment(
--       rollno char(6),
--       socID  char(60),
--       dateofenrollment date,
--       
--       PRIMARY KEY (rollno,socID),
--       
--       FOREIGN KEY (rollno) references  student(rollno)
--           ON DELETE CASCADE
--           ON UPDATE CASCADE,

--       FOREIGN KEY (socID) references society(socID)
--          ON DELETE CASCADE
--           ON UPDATE CASCADE
--       
-- );
CREATE TABLE enrollment(
    rollno CHAR(6),
    socID CHAR(60),
    dateofenrollment DATE,

    PRIMARY KEY (rollno, socID),

    FOREIGN KEY (rollno) REFERENCES student(rollno)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY (socID) REFERENCES society(socID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

use student_society;
      
INSERT INTO student VALUES
('S10001','Aarav','BSc CS','2005-01-15'),
('S10002','Vivaan','BSc CS','2005-02-12'),
('S10003','Aditya','BSc CS','2005-03-11'),
('S10004','Krishna','BSc Maths','2005-04-18'),
('S10005','Ishaan','BCom','2005-05-09'),
('S10006','Arjun','BSc CS','2005-06-20'),
('S10007','Kabir','BA','2005-07-13'),
('S10008','Reyansh','BSc Physics','2005-08-16'),
('S10009','Atharv','BCA','2005-09-10'),
('S10010','Rudra','BSc CS','2005-10-21'),

('S10011','Ananya','BSc CS','2005-01-11'),
('S10012','Diya','BCom','2005-02-14'),
('S10013','Myra','BA','2005-03-17'),
('S10014','Aadhya','BSc Maths','2005-04-19'),
('S10015','Sara','BCA','2005-05-23'),
('S10016','Pari','BSc Physics','2005-06-05'),
('S10017','Riya','BSc CS','2005-07-22'),
('S10018','Navya','BCom','2005-08-09'),
('S10019','Kavya','BA','2005-09-12'),
('S10020','Meera','BSc CS','2005-10-25'),

('S10021','Rahul','BSc CS','2005-01-18'),
('S10022','Rohan','BCA','2005-02-16'),
('S10023','Karan','BCom','2005-03-24'),
('S10024','Yash','BA','2005-04-28'),
('S10025','Harsh','BSc Physics','2005-05-06'),
('S10026','Manav','BSc Maths','2005-06-13'),
('S10027','Dev','BCA','2005-07-08'),
('S10028','Aryan','BSc CS','2005-08-30'),
('S10029','Samar','BCom','2005-09-03'),
('S10030','Veer','BA','2005-10-15'),

('S10031','Siya','BSc CS','2005-01-22'),
('S10032','Ira','BCom','2005-02-07'),
('S10033','Tara','BA','2005-03-29'),
('S10034','Kiara','BCA','2005-04-05'),
('S10035','Avni','BSc Maths','2005-05-16'),
('S10036','Saanvi','BSc Physics','2005-06-27'),
('S10037','Anika','BSc CS','2005-07-02'),
('S10038','Pihu','BCom','2005-08-18'),
('S10039','Aisha','BA','2005-09-11'),
('S10040','Riddhi','BSc CS','2005-10-01'),

('S10041','Om','BSc CS','2005-01-30'),
('S10042','Daksh','BCA','2005-02-03'),
('S10043','Ayaan','BCom','2005-03-14'),
('S10044','Shaurya','BA','2005-04-08'),
('S10045','Laksh','BSc Physics','2005-05-20'),
('S10046','Vihaan','BSc Maths','2005-06-09'),
('S10047','Naman','BCA','2005-07-19'),
('S10048','Agastya','BSc CS','2005-08-22'),
('S10049','Pranav','BCom','2005-09-05'),
('S10050','Tanish','BA','2005-10-10'),

('S10051','Sneha','BSc CS','2005-01-04'),
('S10052','Naina','BCom','2005-02-26'),
('S10053','Ishita','BA','2005-03-21'),
('S10054','Mahi','BCA','2005-04-17'),
('S10055','Khushi','BSc Maths','2005-05-28'),
('S10056','Tanvi','BSc Physics','2005-06-12'),
('S10057','Ritika','BSc CS','2005-07-14'),
('S10058','Palak','BCom','2005-08-06'),
('S10059','Muskan','BA','2005-09-27'),
('S10060','Jiya','BSc CS','2005-10-24'),

('S10061','Mohit','BSc CS','2005-01-09'),
('S10062','Aman','BCA','2005-02-10'),
('S10063','Ujjwal','BCom','2005-03-18'),
('S10064','Sahil','BA','2005-04-13'),
('S10065','Ritik','BSc Physics','2005-05-07'),
('S10066','Varun','BSc Maths','2005-06-26'),
('S10067','Abhay','BCA','2005-07-15'),
('S10068','Ayush','BSc CS','2005-08-02'),
('S10069','Deepak','BCom','2005-09-19'),
('S10070','Nikhil','BA','2005-10-07'),

('S10071','Neha','BSc CS','2005-01-16'),
('S10072','Shreya','BCom','2005-02-22'),
('S10073','Simran','BA','2005-03-13'),
('S10074','Aarohi','BCA','2005-04-02'),
('S10075','Prisha','BSc Maths','2005-05-11'),
('S10076','Angel','BSc Physics','2005-06-29'),
('S10077','Sanjana','BSc CS','2005-07-23'),
('S10078','Rashmi','BCom','2005-08-14'),
('S10079','Payal','BA','2005-09-08'),
('S10080','Komal','BSc CS','2005-10-03'),

('S10081','Rakesh','BSc CS','2005-01-28'),
('S10082','Hemant','BCA','2005-02-15'),
('S10083','Lokesh','BCom','2005-03-07'),
('S10084','Vikas','BA','2005-04-16'),
('S10085','Gaurav','BSc Physics','2005-05-12'),
('S10086','Tarun','BSc Maths','2005-06-17'),
('S10087','Rajat','BCA','2005-07-29'),
('S10088','Kunal','BSc CS','2005-08-21'),
('S10089','Pankaj','BCom','2005-09-26'),
('S10090','Amit','BA','2005-10-18'),

('S10091','Sakshi','BSc CS','2005-01-05'),
('S10092','Preeti','BCom','2005-02-27'),
('S10093','Nidhi','BA','2005-03-06'),
('S10094','Juhi','BCA','2005-04-23'),
('S10095','Rupali','BSc Maths','2005-05-03'),
('S10096','Monika','BSc Physics','2005-06-25'),
('S10097','Sonam','BSc CS','2005-07-18'),
('S10098','Heena','BCom','2005-08-11'),
('S10099','Pooja','BA','2005-09-04'),
('S10100','Alisha','BSc CS','2005-10-30'); 
select * from student;


INSERT into society values
('SOC001','Computer Science Society','Dr Sharma',120),
('SOC002','Dance Society','Ms Gupta',80),
('SOC003','NCC','Mr Singh',100),
('SOC004','NSS','Mrs Verma',100),
('SOC005','Singing Society','Ms Arora',70),
('SOC006','Drama Society','Mr Khan',60),
('SOC007','Photography Club','Mrs Mehta',50),
('SOC008','Sports Club','Mr Yadav',90),
('SOC009','Literary Society','Ms Kapoor',75),
('SOC010','Coding Club','Mr Bansal',110);

select * from society;

INSERT INTO enrollment VALUES
('S10001','SOC001','2025-01-10'),
('S10002','SOC010','2025-01-10'),
('S10003','SOC003','2025-01-11'),
('S10004','SOC004','2025-01-12'),
('S10005','SOC002','2025-01-13'),
('S10006','SOC005','2025-01-14'),
('S10007','SOC006','2025-01-15'),
('S10008','SOC007','2025-01-16'),
('S10009','SOC008','2025-01-17'),
('S10010','SOC009','2025-01-18'),

('S10011','SOC001','2025-01-19'),
('S10012','SOC002','2025-01-20'),
('S10013','SOC003','2025-01-21'),
('S10014','SOC004','2025-01-22'),
('S10015','SOC005','2025-01-23'),
('S10016','SOC006','2025-01-24'),
('S10017','SOC007','2025-01-25'),
('S10018','SOC008','2025-01-26'),
('S10019','SOC009','2025-01-27'),
('S10020','SOC010','2025-01-28'),

('S10021','SOC001','2025-01-29'),
('S10022','SOC002','2025-01-30'),
('S10023','SOC003','2025-01-31'),
('S10024','SOC004','2025-02-01'),
('S10025','SOC005','2025-02-02'),
('S10026','SOC006','2025-02-03'),
('S10027','SOC007','2025-02-04'),
('S10028','SOC008','2025-02-05'),
('S10029','SOC009','2025-02-06'),
('S10030','SOC010','2025-02-07'),

('S10031','SOC001','2025-02-08'),
('S10032','SOC002','2025-02-09'),
('S10033','SOC003','2025-02-10'),
('S10034','SOC004','2025-02-11'),
('S10035','SOC005','2025-02-12'),
('S10036','SOC006','2025-02-13'),
('S10037','SOC007','2025-02-14'),
('S10038','SOC008','2025-02-15'),
('S10039','SOC009','2025-02-16'),
('S10040','SOC010','2025-02-17'),

('S10041','SOC001','2025-02-18'),
('S10042','SOC002','2025-02-19'),
('S10043','SOC003','2025-02-20'),
('S10044','SOC004','2025-02-21'),
('S10045','SOC005','2025-02-22'),
('S10046','SOC006','2025-02-23'),
('S10047','SOC007','2025-02-24'),
('S10048','SOC008','2025-02-25'),
('S10049','SOC009','2025-02-26'),
('S10050','SOC010','2025-02-27'),

('S10051','SOC001','2025-02-28'),
('S10052','SOC002','2025-03-01'),
('S10053','SOC003','2025-03-02'),
('S10054','SOC004','2025-03-03'),
('S10055','SOC005','2025-03-04'),
('S10056','SOC006','2025-03-05'),
('S10057','SOC007','2025-03-06'),
('S10058','SOC008','2025-03-07'),
('S10059','SOC009','2025-03-08'),
('S10060','SOC010','2025-03-09'),

('S10061','SOC001','2025-03-10'),
('S10062','SOC002','2025-03-11'),
('S10063','SOC003','2025-03-12'),
('S10064','SOC004','2025-03-13'),
('S10065','SOC005','2025-03-14'),
('S10066','SOC006','2025-03-15'),
('S10067','SOC007','2025-03-16'),
('S10068','SOC008','2025-03-17'),
('S10069','SOC009','2025-03-18'),
('S10070','SOC010','2025-03-19');

select * from enrollment;

