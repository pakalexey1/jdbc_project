select *
from employees;

/*
INNER JOIN
ONly matches portions of the tables
*/

select *
from CUSTOMER;
select *
from ADDRESS;

select FIRST_NAME, LAST_NAME, ADDRESS, PHONE
from CUSTOMER
         inner join ADDRESS
                    ON customer.ADDRESS_ID = address.ADDRESS_ID;

--ALIASES
select FIRST_NAME, LAST_NAME, adr.ADDRESS_ID, ADDRESS, PHONE
from CUSTOMER Cust
         inner join ADDRESS Adr
                    ON cust.ADDRESS_ID = adr.ADDRESS_ID;


/*
LEFT OUTER JOIN
Matching part + only unique for LEFT table
*/

select FIRST_NAME, LAST_NAME, adr.ADDRESS_ID, ADDRESS, PHONE
from CUSTOMER Cust
         left outer join ADDRESS Adr
                         ON cust.ADDRESS_ID = adr.ADDRESS_ID;

/*
Right outer join
Matching part + only unique part for the right table
*/
select FIRST_NAME, LAST_NAME, cust.ADDRESS_ID, ADDRESS, PHONE
from CUSTOMER cust
         right outer join ADDRESS adr
                          on cust.ADDRESS_ID = adr.ADDRESS_ID;


select FIRST_NAME, LAST_NAME, cust.ADDRESS_ID, ADDRESS, PHONE
from CUSTOMER cust
         full outer join ADDRESS adr
                          on cust.ADDRESS_ID = adr.ADDRESS_ID;