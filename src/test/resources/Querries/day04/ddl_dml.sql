select *
from employees;

/*
CREATE A TABLE SYNTAX:

    create table TableName(
        colName1 DataType Constraints
        colName2 DataType Constraints(optional)
        colName3 DataType Constraints,
        ...
    );
*/

CREATE table scrumteam
(
    empid     Integer PRIMARY KEY,  -- not NULL and Unique
    firstname varchar(30) not null, --can't be null
    jobtitle  varchar(20) not null, --can't be null
    age       Integer,              -- no constraints
    salary    INTEGER               -- no constraints
);

INSERT INTO scrumteam (empid, firstname, jobtitle, age, salary)
values (1, 'Mike', 'Tester', 25, 120000);

INSERT INTO scrumteam(empid, firstname, jobtitle, age, salary)
values (2, 'John', 'Tester', 27, 130000);

INSERT INTO scrumteam (empid, firstname, jobtitle)
values (3, 'Dembe', 'Tester');

INSERT INTO scrumteam
Values (4, 'Henry', 'SM', 30, 150000);

select *
from scrumteam;

/*
UPDATE Syntax

UPDATE table_name
SET column1 = value1,
    column2 = value2,
WHERE condition;
*/

--increase all employees salary
UPDATE scrumteam
set SALARY = salary + 50000
Where jobtitle = 'Tester';

-- Make Dembe a Developer
UPDATE scrumteam
set JOBTITLE = 'Developer'
where firstname = 'Dembe';

--Add age for Dember
UPDATE scrumteam
set AGE = 34, Salary = 160000
where firstname = 'Dembe';

DELETE from scrumteam
where firstname = 'Dembe';


-- commit work or commit --> both work
commit;

-- ADD NEW COLUMN
alter table scrumteam
add gender varchar(20);


-- update all scrumteam gender as Male
UPDATE scrumteam
set gender = 'Male';

-- Rename column --> adds a column to the table
Alter table scrumteam
RENAME COLUMN salary to annual_salary;

-- Drop column --> deletes a column from a table
Alter TABLE scrumteam
Drop column gender;

-- Rename table
ALTER TABLE scrumteam
RENAME to agileteam;

select * from agileteam;

-- Truncate
TRUNCATE TABLE agileteam;

--Drop
Drop table agileteam;

commit; -- to save changes

--IQ --> what's the diff between DROP and TRUNCATE?
    --Trunc --> will delete all table content/data
    --DROP  --> deletes the table itself with the data







