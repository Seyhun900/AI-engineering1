Task 1

select 
       JOB_ID, 
       count (*) as ISCI_SAYI,
       floor(avg(salary)) as ORTA_MAAS
  from HR.EMPLOYEES
  group by JOB_ID
  order by ISCI_SAYI desc;

Task 2

select DEPARTMENT_ID,
       min (salary) as minimum_maas,
       max (salary) as maximum_maas
from HR.EMPLOYEES
group by DEPARTMENT_ID
order by DEPARTMENT_ID asc;

Task 3

select d.department_name,l.city
from hr.departments d
join hr.locations l
on d.location_id=l.location_id;

Task 4

select JOB_ID, 
       sum(salary) as MAAS_CEMI
from HR.EMPLOYEES 
group by JOB_ID
having sum(salary) > 50000
order by MAAS_CEMI desc;

Task 5

select MANAGER_ID, count(*) as ISCI_SAYI
from HR.EMPLOYEES 
where COMMISSION_PCT is not null
group by manager_id
having count(*)>5;

Task 6

select l.CITY, count(d.department_id) as SOBE_SAYI
from HR.DEPARTMENTS d
join HR.LOCATIONS l
on d.location_id=l.location_id
group by l.city
order by sobe_sayi desc;

Task 7

select e.FIRST_NAME, e.LAST_NAME, d.DEPARTMENT_NAME
from HR.EMPLOYEES e
full outer join HR.DEPARTMENTS d
on e.department_id=d.department_id
where e.department_id is null
or d.department_id is null;

Task 8

SELECT D.DEPARTMENT_NAME, COUNT(*) AS ISCI_SAYI
FROM HR.EMPLOYEES E
JOIN HR.DEPARTMENTS D 
ON e.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME
having COUNT(*) > 3;

Task 9

select d.DEPARTMENT_NAME, j.JOB_TITLE, 
count(*) as ISCI_SAYI, avg(salary) as ORTA_MAAS
FROM HR.EMPLOYEES e
JOIN HR.DEPARTMENTS d on e.department_id=d.department_id
JOIN HR.JOBS j on e.JOB_ID=j.JOB_ID
group by d.DEPARTMENT_NAME,j.JOB_TITLE
having count(*) >= 3
order by d.DEPARTMENT_NAME asc,
ISCI_SAYI desc;

Task 10

select e.EMPLOYEE_ID, e.FIRST_NAME, e.LAST_NAME, count(jh.EMPLOYEE_ID) as KECMIS_VEZIFE_SAYI
  FROM HR.EMPLOYEES e
  left join HR.JOB_HISTORY jh 
  on e.EMPLOYEE_ID=jh.EMPLOYEE_ID
  group by e.EMPLOYEE_ID, e.FIRST_NAME, e.LAST_NAME
  order by KECMIS_VEZIFE_SAYI DESC;

 