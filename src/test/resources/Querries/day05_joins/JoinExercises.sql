select *
from jobs;

--1. Display all first_name and department_name

select *
from employees;
select *
from DEPARTMENTS;

select FIRST_NAME, DEPARTMENT_NAME
from EMPLOYEES e
         inner join DEPARTMENTS d
                    on e.DEPARTMENT_ID = d.DEPARTMENT_ID;


--2. Display first_name and department_name including the department without employee
select FIRST_NAME, DEPARTMENT_NAME
from EMPLOYEES e
         right join DEPARTMENTS d
                    on e.DEPARTMENT_ID = d.DEPARTMENT_ID;

--3. Display all first _name and dep_name including the employee wihtout department
select first_name, DEPARTMENT_NAME
from EMPLOYEES e
         left join DEPARTMENTS d
                   on e.DEPARTMENT_ID = d.DEPARTMENT_ID;

--4. Display all first_name and department_name
select FIRST_NAME, DEPARTMENT_NAME
from EMPLOYEES e
         full outer join DEPARTMENTS d
                         on e.DEPARTMENT_ID = d.DEPARTMENT_ID;

--5 Display all cities and related country names
Select CITY, COUNTRY_NAME
from LOCATIONS l
         inner join COUNTRIES C
                    on l.COUNTRY_ID = c.COUNTRY_ID;

--6 Display All cities and related country names
select CITY, COUNTRY_NAME
from LOCATIONS L
         right outer join COUNTRIES C
                          on l.COUNTRY_ID = c.COUNTRY_ID;

--7 Display all department name and street addresses
select DEPARTMENT_NAME, STREET_ADDRESS
from LOCATIONS l full outer join DEPARTMENTS d
on l.LOCATION_ID = d.LOCATION_ID;

--8 Display first name, last name and department name, city for all employees
select FIRST_NAME, LAST_NAME, DEPARTMENT_NAME, CITY
from (select *
      from EMPLOYEES e left join DEPARTMENTS d
                                 on e.DEPARTMENT_ID = d.DEPARTMENT_ID) abc left join LOCATIONS l
on abc.LOCATION_ID = l.LOCATION_ID;

select FIRST_NAME, LAST_NAME, DEPARTMENT_NAME, CITY
from EMPLOYEES e
left join DEPARTMENTS d on e.DEPARTMENT_ID = d.DEPARTMENT_ID
left join LOCATIONS l on d.LOCATION_ID = l.LOCATION_ID;

--9 Display first_name, last_name, department_name, city, country_name for all employees
select FIRST_NAME, LAST_NAME, DEPARTMENT_NAME, CITY, COUNTRY_NAME
from EMPLOYEES e
left join DEPARTMENTS d on e.DEPARTMENT_ID = d.DEPARTMENT_ID
left join LOCATIONS L on d.LOCATION_ID = L.LOCATION_ID
left join COUNTRIES c on c.COUNTRY_ID = l.COUNTRY_ID

-- 10 Display entries from the left table that have NO match on the id on the right table
select CUSTOMER_ID, FIRST_NAME, LAST_NAME, PHONE
from CUSTOMER c left join ADDRESS a
on c.ADDRESS_ID=a.ADDRESS_ID
where a.ADDRESS_ID is NULL

-- Full Outer With Where
-- get non-matching parts of the tables
select CUSTOMER_ID, FIRST_NAME, LAST_NAME, customer.ADDRESS_ID, address.ADDRESS_ID, PHONE
from CUSTOMER full outer join ADDRESS
on CUSTOMER.ADDRESS_ID = address.ADDRESS_ID
where ADDRESS.ADDRESS_ID is null or customer.ADDRESS_ID is null


-- List of employees from UK
select FIRST_NAME, LAST_NAME, DEPARTMENT_NAME, CITY
from EMPLOYEES e
         left join DEPARTMENTS d on e.DEPARTMENT_ID = d.DEPARTMENT_ID
         left join LOCATIONS L on d.LOCATION_ID = L.LOCATION_ID
WHere COUNTRY_ID ='UK';


-- 11 Display how many employees we have by country name
select c.COUNTRY_NAME, count(EMPLOYEE_ID)
from EMPLOYEES e
         left join DEPARTMENTS d on e.DEPARTMENT_ID = d.DEPARTMENT_ID
         left join LOCATIONS L on d.LOCATION_ID = L.LOCATION_ID
         left join COUNTRIES c on c.COUNTRY_ID = l.COUNTRY_ID
group by COUNTRY_NAME
order by count(EMPLOYEE_ID) desc