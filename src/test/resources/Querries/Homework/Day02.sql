select * from EMPLOYEES
order by SALARY desc;


-- 1. display full addresses from locations table in a single column
select (STREET_ADDRESS || ' ' || POSTAL_CODE || ' ' || CITY  || ' ' || STATE_PROVINCE) as FULL_ADdress from locations;


-- 2. display all informations of the employee who has the minimum salary in employees table
select min(SALARY) from EMPLOYEES
where salary = (select min(SALARY) from EMPLOYEES);

-- 3. display the second minimum salary from the employees
select max(salary) from(select distinct * from EMPLOYEES order by SALARY asc)
where ROWNUM<3;

-- 4. display all information of the employee who has the second minimum salary
select * from EMPLOYEES
where salary = (select max(salary) from(select distinct * from EMPLOYEES order by SALARY)
       where ROWNUM<3);

-- 5. list all the employees who are making above the average salary;


-- 6. list all the employees who are making less than the average salary

-- 7. display manager name of 'Neena'
select  MANAGER_ID from EMPLOYEES
where FIRST_NAME = 'Neena'

-- 8. find the 3rd maximum salary from the employees table (do not include duplicates)
select * from EMPLOYEES
where salary = (select min (SALARY) from (select distinct SALARY from EMPLOYEES order by SALARY desc) where ROWNUM<4);

-- 9. find the 5th maximum salary from the employees table (do not include duplicates)
select * from EMPLOYEES
where salary = (select min(salary) from (select distinct SALARY from EMPLOYEES order by SALARY desc) where ROWNUM<6);

-- 10. find the 7th maximum salary from the employees table (do not include duplicates)
select * from EMPLOYEES
where salary = (select min (salary) from (select distinct salary from EMPLOYEES order by SALARY desc) where ROWNUM < 8)

-- 11. find the 10th maximum salary from the employees table (do not include duplicates)
select * from EMPLOYEES
where SALARY = (select min (SALARY) from (select distinct salary from EMPLOYEES order by salary desc) where ROWNUM <11);







-- 12. find the 3rd minimum salary from the employees table (do not include duplicates)
SELECT * from EMPLOYEES
where SALARY = (select max (SALARY) from (select distinct SALARY from EMPLOYEES order by SALARY) where ROWNUM <4);

-- 13. find the 5th minimum salary from the employees table (do not include duplicates)

-- 14. find the 7th maximum salary from the employees table (do not include duplicates)

-- 15. find the 10th maximum salary from the employees table (do not include duplicates)