DROP DATABASE IF EXISTS `OPPO_AUGUST`;
CREATE DATABASE `OPPO_AUGUST`;
USE `OPPO_AUGUST`;

CREATE TABLE Employee (
employee_id INT NOT NULL,
first_name VARCHAR (50),
last_name VARCHAR(50),
age INT,
gender VARCHAR(10),
presentation_team VARCHAR(10),
year_employed YEAR,
PRIMARY KEY (employee_id)
)
;

CREATE TABLE performance(
employee_id INT NOT NULL,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
model VARCHAR(10),
amount INT,
team_leader VARCHAR(50) NOT NULL,
sales_team INT 
)
;

CREATE TABLE Presentation_team(
team_id INT NOT NULL AUTO_INCREMENT,
presentation_team VARCHAR(10),
PRIMARY KEY(team_id)
)
;

INSERT INTO Presentation_team(presentation_team)
VALUES
('Samsung'),
('Vivo'),
('Redmi'),
('Infinix'),
('Tecno');

INSERT INTO Employee(employee_id, first_name, last_name, age, gender, presentation_team, year_employed)
VALUES
(1, 'Amarachi', 'Okoro', 26, 'Female', 'Samsung', '2024'),
(2, 'Julia', 'Anurukem', 34, 'Female', 'Redmi', '2019'),
(3, 'Calista', 'Johnbull', 28, 'Male', 'Infinix', '2020'),
(4, 'Kamilu', 'Omolara', 29, 'Female', 'Vivo', '2024'),
(5, 'Chinoye', 'Okafor', 30, 'Female', 'Tecno', '2020'),
(6, 'Blinkee', 'Wereke', 28, 'Female', 'Vivo', '2021'),
(7, 'Jasper', 'Ogbonna', 36, 'Male', 'Tecno', '2019'),
(8, 'Austin', 'Gabriel', 29, 'Male', 'Samsung', '2022'),
(9, 'Overcomer', 'Onye', 26, 'Female','Redmi',  '2023'),
(10, 'Ruth', 'Laye', 27, 'Female', 'Infinix', '2022'),
(11, 'Hope', 'Jude', 25, 'Male', 'Infinix','2024'),
(12, 'Chioma', 'Okoye', 28, 'Female', 'Samsung', '2019'),
(13, 'Christaina', 'Kalagbor', 28, 'Female','Redmi', '2022'),
(14, 'Rose', 'Abraye', 27, 'Female', 'Vivo', '2019'),
(15, 'Annabel', 'Preye', 25, 'Female', 'Redmi', '2023'),
(16, 'Deborah', 'Ademoye', 25, 'Female', 'Tecno', '2024'),
(17, 'Ebere', 'Bianca', 26, 'Female', 'Infinix', '2023'),
(18, 'Prosper', 'Thankgod', 27, 'Male', 'Samsung', '2020'),
(19, 'Grace', 'Weleke', 29, 'Female', 'Vivo', '2020'),
(20, 'Ijeoma', 'Afor', 25, 'Female', 'Redmi', '2024');

INSERT INTO performance (employee_id, first_name, last_name, model, amount, team_leader, sales_team)
VALUES
(1, 'Amarachi', 'Okoro', 'A18', 190000, 'Charles', 2),
(2, 'Julia', 'Anurukem', 'Reno12', 540000, 'Rosebury', 4),
(3, 'Calista', 'Johnbull', 'A58', 229000, 'Ade', 3),
(4, 'Kamilu', 'Omolara', 'A78', 290000, 'Rosebury', 4),
(5, 'Chinoye', 'Okafor', 'A96', 196000, 'Ade', 3),
(6, 'Blinkee', 'Wereke', 'Reno8', 220000, 'Charles', 2),
(7, 'Jasper', 'Ogbonna', 'A18', 190000, 'Chima', 1),
(8, 'Austin', 'Gabriel','A96', 196000,'Ade', 3),
(9, 'Overcomer', 'Onye', 'Reno11', 500000, 'Ade', 3),
(10, 'Ruth', 'Laye', 'A58', 229000, 'Rosebury', 4),
(11, 'Hope', 'Jude', 'A78', 290000, 'Charles', 2),
(12, 'Chioma', 'Okoye', 'Reno12', 540000, 'Rosebury', 2),
(13, 'Christaina', 'Kalagbor', 'A18', 190000, 'Rosebury', 4),
(14, 'Rose', 'Abraye', 'A60', 273000 ,'Rosebury', 4),
(15, 'Annabel', 'Preye', 'A18', 190000, 'Chima', 1),
(16, 'Deborah', 'Ademoye', 'A38', 20000, 'Ade', 3),
(17, 'Ebere', 'Bianca', 'Reno11', 500000, 'Chima', 1),
(18, 'Prosper', 'Thankgod', 'A60', 273000, 'Charles', 1),
(19, 'Grace', 'Weleke', 'Reno8', 220000,'Chima', 1),
(20, 'Ijeoma', 'Afor', 'A38', 200000, 'Ade', 3);