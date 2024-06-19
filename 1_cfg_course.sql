USE cfg_course;

-- create a table student
CREATE TABLE student (
st_number INT NOT NULL,
-- specify it can't be empty/NULL
first_name VARCHAR(50),
-- up to 50 char string, could be NULL
las_name VARCHAR(50),
age int);

SELECT *
FROM student;
-- display the table below