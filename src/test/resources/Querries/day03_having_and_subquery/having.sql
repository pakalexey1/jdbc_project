select * from JOBS;

-- display job_ids where their avg salary is more than 5 k
select JOB_ID, avg(SALARY)  from EMPLOYEES
group by JOB_ID
having avg(SALARY)>5000;


-- get me departments_ID where employees count > 5
select DEPARTMENT_ID, count(*) from EMPLOYEES
group by DEPARTMENT_ID
having count(*) >5

-- display duplicate employees (duplicate by first name)
select FIRST_NAME, count(*) from EMPLOYEES
group by FIRST_NAME
having count(*)>1;