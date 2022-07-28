select * from employees;

select * from employees
where ROWNUM <11;


--display all informaiton who is getting first 5 highest salary
-- bad practice, as it first limits data to the first 6 rows and only then orders it
SELECT * from  EMPLOYEES
         where ROWNUM<6
order by SALARY desc;

--correct approach:
select * from (select * from EMPLOYEES order by SALARY desc)
where ROWNUM<6;


select distinct salary from employees order by salary desc;

-- display all information from employees who is getting 5th highest salary
select min (SALARY) from (select distinct salary from employees order by salary desc)
where ROWNUM<6;

-- display all information from employees who is getting 213th highest salary
select min (SALARY) from (select distinct salary from employees order by salary desc)
where ROWNUM<214;

--Show all info on who is making the 5th highest salary
select min (SALARY) from (select distinct salary from employees order by salary desc)
where ROWNUM<6;

