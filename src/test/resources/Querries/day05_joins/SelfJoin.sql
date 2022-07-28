select * from employees;

-- Display Neena's manager
SELECT FIRST_NAME, MANAGER_ID
from EMPLOYEES where FIRST_NAME = 'Neena';

select * from EMPLOYEES
where EMPLOYEE_ID = (select MANAGER_ID from EMPLOYEES where FIRST_NAME = 'Neena')


select workers.FIRST_NAME, workers.LAST_NAME, managers.FIRST_NAME, managers.LAST_NAME
from EMPLOYEES workers left join EMPLOYEES managers
on workers.MANAGER_ID = managers.EMPLOYEE_ID;