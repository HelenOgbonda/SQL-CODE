DROP DATABASE IF EXISTS `Uptraxtech_Ltd` ;
CREATE DATABASE `Uptraxtech_Ltd`;
USE `Uptraxtech_Ltd`;

CREATE TABLE student_demographics (
student_id INT NOT NULL,
first_name VARCHAR(50),
last_name VARCHAR(50),
age INT,
gender VARCHAR(10),
birth_date DATE,
PRIMARY KEY (student_id)
);

CREATE TABLE student_fee (
student_id INT NOT NULL,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
course VARCHAR(50) NOT NULL,
fee INT,
department_id INT
);

CREATE TABLE course_applied (
dept_id INT NOT NULL AUTO_INCREMENT,
course_applied VARCHAR(50) NOT NULL,
PRIMARY KEY (dept_id)
);

INSERT INTO course_applied(Course_applied)
VALUES
('Data Analytics'),
('Computer Appreciation'),
('UI/UX Design'),
('Cybersecurity'),
('Graphics Design'),
('Web Development');

INSERT INTO student_demographics (student_id, first_name, last_name, age, gender, Birth_date)
VALUES
(1, 'Queenth', 'Igwe', 23, 'Female', '2001-09-25'),
(3, 'Debby', 'Okoye', 25, 'Female', '1999-03-04'),
(4, 'Kayode', 'Kayode', 29, 'Male', '1994-03-27'),
(5, 'Wilson', 'Cheta', 30, 'Male', '1994-08-28'),
(6, 'General', 'Chris', 40, 'Male', '1986-07-30'),
(7, 'Tina', 'Augustina', 31, 'Female', '1990-08-25'),
(8, 'Chris', 'Traeger', 43, 'Male', '1980-11-11'),
(9, 'Victor', 'Smart', 20, 'Male', '2004-04-04'),
(10, 'Beauty', 'Amadi', 34, 'Female', '1989-06-14'),
(11, 'Mark', 'Austin', 40, 'Male', '1983-06-14'),
(12, 'Balogun', 'Pius', 37, 'Male', '1986-07-27');

INSERT INTO student_fee (student_id, first_name, last_name, course, fee, department_id)
VALUES
(1, 'Queenth', 'Igwe', 'Batch A Data Analytics', 70000,1),
(2, 'Prosper', 'Ezekiel', 'Instructor of Data Analytics', 70000,1),
(3, 'Debby', 'Okoye', 'Batch A Data Analytics', 70000,1),
(4, 'Kayode', 'Kayode', 'Batch A Data Analytics', 70000,1),
(5, 'Wilson', 'Cheta', 'Batch C Data Analytics', 80000,2),
(6, 'General', 'Chris', 'Batch B Data Analytics', 75000,1),
(7, 'Tina', 'Augustina', 'Batch C Data Analytics', 80000,1),
(8, 'Chris', 'Traeger', 'UI/UX Design', 90000,4),
(9, 'Victor', 'Smart', 'Batch C Data Analytics', 80000,1),
(10, 'Beauty', 'Amadi', 'Computer Appreciation', 40000,null),
(11, 'Mark', 'Austin', 'Cybersecurity', 100000,5),
(12, 'Balogun', 'Pius', 'Appreciation Director', 65000,6);