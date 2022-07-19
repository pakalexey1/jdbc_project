select * from EMPLOYEES
where JOB_ID in ('IT_PROG', 'SA_REP','FI_MGR');


select * from EMPLOYEES
where JOB_ID NOT IN ('IT_PROG', 'SA_REP','FI_MGR');

select *
from LOCATIONS
where CITY in ('Roma','Tokyo');

select *
from EMPLOYEES
where EMPLOYEE_ID in ('113','145','124','122');