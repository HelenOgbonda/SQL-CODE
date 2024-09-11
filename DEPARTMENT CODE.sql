DROP DATABASE IF EXISTS `MassCommunication_Alumni`;
CREATE DATABASE `MassCommunication_Alumni`;
USE `MassCommunication_Alumni`;

CREATE TABLE Student_information(
student_id INT NOT NULL,
first_name VARCHAR(50),
last_name VARCHAR(50),
age INT,
gender VARCHAR(10),
Birth_date DATE,
PRIMARY KEY (student_id)
);

CREATE TABLE student_fee(
student_id INT NOT NULL,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
Course VARCHAR(50) NOT NULL,
study_level INT ,
fee INT,
department_id int
);

CREATE TABLE Course_applied(
dept_id INT NOT NULL AUTO_INCREMENT,
course_applied VARCHAR(50) NOT NULL,
PRIMARY KEY (dept_id)
);

INSERT INTO course_applied(Course_applied)
VALUES
('Mass Communication'),
('Adult Education/Mass Comunication'),
('Igbo Education/Mass Communication');

INSERT INTO Student_information(student_id, first_name, last_name, age, gender, Birth_date)
VALUES
(1, 'Angela', 'Kosiso', 24, 'Female', '2000-02-23'),
(2, 'Austin', 'Anthony', 26, 'Male', '1997-11-29'),
(3, 'Goodness', 'Immaculate', 19, 'Female', '2003-06-08'),
(4, 'Miracle', 'Edwin', 20, 'Male','2004-01-20'),
(5, 'Agnes', 'Okafor', 21, 'Female','2003-02-14'),
(6, 'Boluwatife', 'Bankole', 27, 'Male', '1996-08-19'),
(7, 'Esther', 'Adeyemi', 25, 'Female', '1999-07-17'),
(8, 'Chinasa', 'Onwa', 26, 'Female', '1997-12-08');


INSERT INTO student_fee(student_id, first_name, last_name, course,study_level, fee, department_id)
VALUES
(1, 'Angela', 'Kosiso', 'Igbo Education/Mass Communication', 400, 86000,220),
(2, 'Austin', 'Anthony', 'Adult Education/Mass Communication', 300, 94000,664),
(3, 'Goodness', 'Immaculate', 'Mass Communication', 300, 80000,212),
(4, 'Miracle', 'Edwin', 'Mass Communication', 200, 80000,212),
(5, 'Agnes', 'Okafor', 'Igbo Education/Mass Communication', 400, 86000,220),
(6, 'Boluwatife', 'Bankole', 'Mass Communication', 200, 80000,212),
(7, 'Esther', 'Adeyemi', 'Adult Education/Mass Communication', 100, 94000,664),
(8, 'Chinasa', 'Onwa', 'Adult Education/Mass Communication', 200, 94000,664);
