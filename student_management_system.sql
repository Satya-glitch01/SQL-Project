CREATE DATABASE student_management_system;
USE student_management_system;

CREATE TABLE department (
    dept_id INT NOT NULL AUTO_INCREMENT,
    dept_name VARCHAR(100) NOT NULL,
    hod_name VARCHAR(100),
    office_location VARCHAR(100),
    PRIMARY KEY (dept_id)
);

CREATE TABLE student (
    stud_id INT NOT NULL AUTO_INCREMENT,
    stud_name VARCHAR(100) NOT NULL,
    stud_email VARCHAR(100) UNIQUE,
    stud_phno VARCHAR(15),
    dept_id INT,
    PRIMARY KEY (stud_id),
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

CREATE TABLE course (
    course_id INT NOT NULL AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    duration VARCHAR(50),
    dept_id INT,
    PRIMARY KEY (course_id),
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

CREATE TABLE subject (
    sub_id INT NOT NULL AUTO_INCREMENT,
    sub_name VARCHAR(100) NOT NULL,
    course_id INT,
    credits INT,
    semester_no INT,
    PRIMARY KEY (sub_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

CREATE TABLE marks (
    marks_id INT NOT NULL AUTO_INCREMENT,
    stud_id INT,
    sub_id INT,
    marks DECIMAL(5,2),
    exam_type VARCHAR(50),
    exam_date DATE,
    PRIMARY KEY (marks_id),
    FOREIGN KEY (stud_id) REFERENCES student(stud_id),
    FOREIGN KEY (sub_id) REFERENCES subject(sub_id)
);

CREATE TABLE attendance (
    attendance_id INT NOT NULL AUTO_INCREMENT,
    stud_id INT,
    sub_id INT,
    atten_percent DECIMAL(5,2),
    PRIMARY KEY (attendance_id),
    FOREIGN KEY (stud_id) REFERENCES student(stud_id),
    FOREIGN KEY (sub_id) REFERENCES subject(sub_id)
);

INSERT INTO department
(dept_name, hod_name, office_location)
VALUES
('Computer Science and Engineering', 'Dr. Ramesh', 'Block A'),
('Electronics and Communication', 'Dr. Suresh', 'Block B'),
('Mechanical Engineering', 'Dr. Kumar', 'Block C'),
('Civil Engineering', 'Dr. Prasad', 'Block D'),
('Electrical Engineering', 'Dr. Rao', 'Block E');

INSERT INTO course
(course_name, duration, dept_id)
VALUES
('B.Tech Computer Science', '4 Years', 1),
('B.Tech Electronics', '4 Years', 2),
('B.Tech Mechanical', '4 Years', 3),
('B.Tech Civil', '4 Years', 4),
('B.Tech Electrical', '4 Years', 5);

INSERT INTO student
(stud_name, stud_email, stud_phno, dept_id)
VALUES
('Rahul', 'rahul@gmail.com', '9876543210', 1),
('Arjun', 'arjun@gmail.com', '9876543211', 1),
('Priya', 'priya@gmail.com', '9876543212', 2),
('Sneha', 'sneha@gmail.com', '9876543213', 2),
('Kiran', 'kiran@gmail.com', '9876543214', 3),
('Anil', 'anil@gmail.com', '9876543215', 3),
('Ravi', 'ravi@gmail.com', '9876543216', 4);

INSERT INTO subject
(sub_name, course_id, credits, semester_no)
VALUES
('Data Structures', 1, 4, 3),
('Database Management Systems', 1, 4, 3),
('Object Oriented Programming', 1, 3, 3),
('Digital Electronics', 2, 4, 3),
('Mechanical Engineering', 3, 4, 3),
('Electrical Circuits', 5, 4, 3),
('Engineering Mathematics', 1, 4, 3);

INSERT INTO marks
(stud_id, sub_id, marks, exam_type, exam_date)
VALUES
(1, 1, 85.00, 'Mid 1', '2026-08-01'),
(2, 1, 91.00, 'Mid 1', '2026-08-01'),
(3, 4, 78.00, 'Mid 1', '2026-08-02'),
(4, 4, 88.00, 'Mid 1', '2026-08-02'),
(5, 5, 72.00, 'Mid 1', '2026-08-03'),
(6, 6, 95.00, 'Mid 1', '2026-08-03'),
(7, 7, 82.00, 'Mid 1', '2026-08-04');

INSERT INTO attendance
(stud_id, sub_id, atten_percent)
VALUES
(1, 1, 88.50),
(2, 1, 94.00),
(3, 4, 68.50),
(4, 4, 91.00),
(5, 5, 76.00),
(6, 6, 97.00),
(7, 7, 84.50);

SELECT * FROM department;
SELECT * FROM student;
SELECT * FROM course;
SELECT * FROM subject;
SELECT * FROM marks;
SELECT * FROM attendance;

SELECT
    s.stud_id,
    s.stud_name,
    d.dept_name
FROM student s
JOIN department d
ON s.dept_id = d.dept_id;

SELECT
    c.course_id,
    c.course_name,
    d.dept_name
FROM course c
JOIN department d
ON c.dept_id = d.dept_id;

SELECT
    sub.sub_id,
    sub.sub_name,
    c.course_name
FROM subject sub
JOIN course c
ON sub.course_id = c.course_id;

SELECT
    s.stud_id,
    s.stud_name,
    sub.sub_name,
    m.marks,
    m.exam_type
FROM marks m
JOIN student s
ON m.stud_id = s.stud_id
JOIN subject sub
ON m.sub_id = sub.sub_id;

SELECT
    s.stud_id,
    s.stud_name,
    sub.sub_name,
    a.atten_percent
FROM attendance a
JOIN student s
ON a.stud_id = s.stud_id
JOIN subject sub
ON a.sub_id = sub.sub_id;

SELECT
    s.stud_id,
    s.stud_name,
    d.dept_name,
    c.course_name,
    sub.sub_name,
    a.atten_percent,
    m.marks
FROM student s
JOIN department d
ON s.dept_id = d.dept_id
JOIN course c
ON c.dept_id = d.dept_id
JOIN subject sub
ON sub.course_id = c.course_id
LEFT JOIN attendance a
ON a.stud_id = s.stud_id
AND a.sub_id = sub.sub_id
LEFT JOIN marks m
ON m.stud_id = s.stud_id
AND m.sub_id = sub.sub_id;

SELECT
    s.stud_id,
    s.stud_name,
    sub.sub_name,
    a.atten_percent
FROM attendance a
JOIN student s
ON a.stud_id = s.stud_id
JOIN subject sub
ON a.sub_id = sub.sub_id
WHERE a.atten_percent < 75;

SELECT
    s.stud_id,
    s.stud_name,
    sub.sub_name,
    m.marks
FROM marks m
JOIN student s
ON m.stud_id = s.stud_id
JOIN subject sub
ON m.sub_id = sub.sub_id
WHERE m.marks > 80;

DELIMITER //

CREATE PROCEDURE StudentAttendance(IN sid INT)
BEGIN
    SELECT
        s.stud_name,
        sub.sub_name,
        a.atten_percent
    FROM attendance a
    JOIN student s
    ON a.stud_id = s.stud_id
    JOIN subject sub
    ON a.sub_id = sub.sub_id
    WHERE s.stud_id = sid;
END //

DELIMITER ;

CALL StudentAttendance(1);
