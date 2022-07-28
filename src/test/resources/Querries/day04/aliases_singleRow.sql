select * from jobs;

--Rename column
select FIRST_NAME as givenName from EMPLOYEES;


-- STRING FUNCTIONS

--CONCAT

-- In JAva --> +     --> firstname + " " + lastname
-- In SQL --> ||    --> firstname || " " || lastname

-- Add email to @gmail.com to teh fullName

SELECT concat(EMAIL,'@gmail.com') as full_email from EMPLOYEES;

-- same but make all lower case:
SELECT lower(concat(EMAIL,'@gmail.com')) as full_email from EMPLOYEES;

-- same but make all upper case:
select upper(concat(EMAIL,'@gmail.com')) as full_email from EMPLOYEES;


-- INITCAP
-- it makes first letter uppercase the reset lowercase
select email from EMPLOYEES;
select initcap(EMAIL)from EMPLOYEES;


--LENGTH
-- gives the length of the string
select length(email) from EMPLOYEES;

-- display all the meployees first name and length of it. Sort by length

select FIRST_NAME, length (FIRST_NAME) as FirstName_Length from EMPLOYEES
order by length (First_name);

-- by column aliases
select FIRST_NAME, length(FIRST_NAME) as length_firstname from EMPLOYEES
order by length_firstname;

--by column index
select FIRST_NAME, length(FIRST_NAME) as length_firstname from employees
order by 2;

/*
Substr (colName,beginIndex,numberOfChar)

    if beginIndex is 0, it is treated as 1
    if beginIndex is negative, it will start from back of the string
    if numberOfChar is omitted, it works till the ned


*/

-- Display all intiials from employees --> Steve King --> S.K.
select substr(FIRST_NAME,0,1) || '.' || substr(LAST_NAME,0,1)||'.' as initials from EMPLOYEES;

SELECT FIRST_NAME, SALARY from EMPLOYEES
where SALARY > 500
order by lower(substr(FIRST_NAME,-3)), SALARY desc;

select FIRST_NAME from EMPLOYEES;