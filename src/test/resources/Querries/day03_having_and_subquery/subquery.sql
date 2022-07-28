select * from JOBS;


-- show all information from employees who make the highest salary in the company
select max(SALARY) from EMPLOYEES;

select * from EMPLOYEES
where SALARY = (select max(SALARY) from EMPLOYEES);


-- show all information about the person making the second highest salary
    --find max salary
    -- find second max salary
    -- find information about second highest salary

select max(SALARY) from EMPLOYEES;

select max(SALARY) from EMPLOYEES
where SALARY < (select max(SALARY) from EMPLOYEES);

select * from EMPLOYEES
where SALARY = (select max(SALARY) from EMPLOYEES
                where SALARY < (select max(SALARY) from EMPLOYEES));


-- Display all info about those who make more than avg salary

    -- select avg salary
    -- get all employess who are getting more than avg
    -- make it dynamic

select avg(SALARY) from EMPLOYEES;

select * from EMPLOYEES
where SALARY > (select avg(SALARY) from EMPLOYEES);