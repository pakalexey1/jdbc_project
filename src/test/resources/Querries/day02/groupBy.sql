select * from jobs;


-- how many departments per location?
select LOCATION_ID, count (*) from DEPARTMENTS
group by LOCATION_ID;


-- //how many locations in each country?
select COUNTRY_ID, count(*) from LOCATIONS
group by COUNTRY_ID
order by COUNTRY_ID;


-- how many countries in each region?
select REGION_ID, count(*) as Num_Of_Countries from COUNTRIES
group by REGION_ID;


-- how many employees per manager?
select MANAGER_ID , count(*) as num_of_empls from EMPLOYEES
                           where MANAGER_ID is not NULL
group by MANAGER_ID
having count(*)>5
order by num_of_empls asc;


--ignore null values

