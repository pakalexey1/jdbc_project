select *
from employees;


-- Display all intiials from employees --> Steve King --> S.K.
-- S.K. Steven makes XXXXX salary

CREATE view EmployeesInfo as
select substr(FIRST_NAME, 0, 1) || '.' || substr(LAST_NAME, 0, 1) || '.' as initials,
       FIRST_NAME || ' makes ' || SALARY as Employee_Salary
from EMPLOYEES;

select * from EmployeesInfo;

select initials from EmployeesInfo;
select Employee_Salary from EmployeesInfo;