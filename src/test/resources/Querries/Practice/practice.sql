select * from employees;

-- 1. display full addresses from locations table in a single column
select (STREET_ADDRESS || ' ' || CITY || ' ' || STATE_PROVINCE || '' || COUNTRY_ID) as fuill_address from LOCATIONS;

-- 5. list all the employees who are making above the average salary
select * from EMPLOYEES
where SALARY > (select avg(SALARY) from EMPLOYEES);

-- 2. FIND OUT FIRST_NAME AND JOB_TITLE FROM JOBS AND EMPLOYEES TABLE
select FIRST_NAME, job_title from EMPLOYEES e join jobs j on e.JOB_ID = j.JOB_ID;

--10.Display first_name,last_name and department_name,city who is living in United Kingdom
select FIRST_NAME, LAST_NAME, DEPARTMENT_NAME, city
from EMPLOYEES e join DEPARTMENTS d on e.DEPARTMENT_ID = d.DEPARTMENT_ID
join LOCATIONS l on d.LOCATION_ID = l.LOCATION_ID
where COUNTRY_ID = 'UK';

--11.Display how many employee we have for each country name
select COUNTRY_NAME,count(*)  from EMPLOYEES e
inner join DEPARTMENTS d on e.DEPARTMENT_ID = d.DEPARTMENT_ID
inner join LOCATIONS l on d.LOCATION_ID = l.LOCATION_ID
inner join COUNTRIES c on l.COUNTRY_ID = c.COUNTRY_ID
GROUP BY COUNTRY_NAME
order by count(*);

--9.Display first_name,last_name and department_name,city,country_name for all employees
select first_name,last_name, department_name,city,country_name
from EMPLOYEES e inner join DEPARTMENTS d on e.DEPARTMENT_ID = d.DEPARTMENT_ID
inner join LOCATIONS l on d.LOCATION_ID = l.LOCATION_ID
inner join COUNTRIES c on l.COUNTRY_ID = c.COUNTRY_ID;

-- show 5th highest salary
select min(salary)
from (select distinct SALARY from EMPLOYEES order by SALARY desc) where ROWNUM <=5;

-- show all employee info for the 3rd lowest salary
select * from EMPLOYEES
    where SALARY = (select max(SALARY) from (select distinct SALARY from EMPLOYEES order by SALARY asc) where ROWNUM<=3);











