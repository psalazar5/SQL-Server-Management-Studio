CREATE DATABASE db_payroll1
USE db_payroll1;

--CREAATION OF TABLES --
CREATE TABLE employee (
employee_id INT NOT NULL PRIMARY KEY IDENTITY (1,1),
job_id INT NOT NULL,
first_name VARCHAR(50) NOT NULL, 
last_name VARCHAR(50) NOT NULL,
date_of_hire DATE 
);

CREATE TABLE job (
job_id INT NOT NULL PRIMARY KEY IDENTITY (1,1),
job_title VARCHAR(50) NOT NULL,
job_dept VARCHAR(50) NOT NULL,
salary_id INT NOT NULL
);

CREATE TABLE salary (
salary_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
hourly_rate MONEY NOT NULL
);

CREATE TABLE payroll (
payroll_date VARCHAR(50) NOT NULL,
employee_id INT NOT NULL, 
hours_worked INT NOT NULL
);
--ADDING IN FOREIGN KEYS --
ALTER TABLE employee 
ADD FOREIGN KEY (job_id) REFERENCES job(job_id);

ALTER TABLE payroll 
ADD FOREIGN KEY (employee_id) REFERENCES employee(employee_id);

ALTER TABLE job 
ADD FOREIGN KEY (salary_id) REFERENCES salary(salary_id);

--POPULATING TABLES--

INSERT INTO salary VALUES
(19.50), 
(20.00), 
(20.50),
(21.00), 
(21.50);

SELECT * FROM salary

INSERT INTO job VALUES 
('AR Director', 'Accounting', 2),
('HR Director', 'Human Resources', 4),
('Developer', 'IT', 4),
('Customer Service Manager', 'Operations', 3),
('Sales Manager', 'Sales and Marketing',1);

SELECT * FROM employee

INSERT INTO employee VALUES 
(1, 'Sam', 'Smith', '2018-11-28'),
(4, 'Amanda', 'James', '2020-04-01'),
(3, 'David', 'McGarth', '2021-12-11'),
(2, 'Valerie', 'Ringer', '2014-07-31'),
(5, 'Andrea', 'Antivilo', '2019-02-04');

INSERT INTO payroll values 
('2023-06-07', 1, 40),
('2023-06-07', 2, 25),
('2023-06-07',3, 38),
('2023-06-07', 4, 22),
('2023-06-07', 5, 34);

SELECT * FROM employee 
inner join payroll ON employee.employee_id = payroll.employee_id 
inner join job ON employee.job_id =job.job_id
inner join salary ON job.salary_id = salary.salary_id;

SELECT employee.first_name AS 'First Name:',
employee.last_name AS 'Last Name:',
payroll.hours_worked AS 'Hours:',
salary.hourly_rate AS 'Rate:',
payroll.hours_worked*salary.hourly_rate AS 'Total Pay:'
FROM employee
inner join payroll on employee.employee_id = payroll.employee_id
inner join job on employee.job_id = job.job_id
inner join salary on job.salary_id = salary.salary_id;

