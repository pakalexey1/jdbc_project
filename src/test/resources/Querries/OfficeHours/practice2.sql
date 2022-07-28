select *
from jobs;

-- - find the 3rd minimum salary (no dupes)
select max(SALARY)
from (select distinct SALARY from EMPLOYEES order by SALARY)
where ROWNUM < 4;

-- How many countries per each region_ID?
select REGION_ID, count(*) from COUNTRIES
group by REGION_ID;

-- How many countries per region_name (using WHERE) - in this case more effective way
select r.REGION_NAME, count(*)
from COUNTRIES c inner join REGIONS r
                            on c.REGION_ID = r.REGION_ID
where REGION_NAME = 'Europe'
group by region_name;

-- How many countries per region_name (using having)
select r.REGION_NAME, count(*)
from COUNTRIES c inner join REGIONS r
on c.REGION_ID = r.REGION_ID
group by region_name
having REGION_NAME = 'Europe';

-- Display region names where they have more than 5 country
select r.REGION_NAME, count(*)
from COUNTRIES c inner join REGIONS r
                            on c.REGION_ID = r.REGION_ID
group by region_name
having count(*) > 5
order by 2 desc;