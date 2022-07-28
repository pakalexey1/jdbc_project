select *
from jobs;

--find 3rd max salary from the empls table (do not include duplciates)

select min(SALARY)
from (select distinct SALARY from EMPLOYEES order by SALARY desc)
where ROWNUM < 4;

--find the 3rd minimum salary from the employees table (no dupes)
select max(SALARY)
from (select distinct SALARY from EMPLOYEES order by SALARY asc)
Where ROWNUM < 4;


-- all info for 3rd min salary
select *
from EMPLOYEES
where salary = (select max(SALARY)
                from (select distinct salary from EMPLOYEES order By SALARY asc)
                where ROWNUM < 4);


-- all info for 3rd max salary
select *
from EMPLOYEES
where SALARY = (select min(SALARY)
                from (select distinct SALARY from EMPLOYEES order by SALARY desc)
                where ROWNUM < 4);