Task 1

select first_name, salary,
case
    when salary < 3000 then 'Cox asagi'
    when salary < 7000 then 'Asagi' 
    when salary < 12000 then 'Orta'
    else 'Yuksek'
    end as "KATEQORIYA"
    from hr.employees;

Task 2

select first_name, department_id,
case department_id
    when 10 then 'Admin'
    when 20 then 'Marketing'
    when 60 then 'IT'
    when 90 then 'Rehberlik'
    else 'Diger'
    end as "SOBE_ADI"
    from hr.employees;

Task 3

select first_name,
nvl (manager_id, 0) as manager_id,
nvl (commission_pct, 0) as KOMISSIYA
from hr.employees;

select job_title, MAX_SALARY, MIN_SALARY,
case
    when MAX_SALARY-MIN_SALARY < 5000 THEN 'DAR'
    WHEN MAX_SALARY-MIN_SALARY < 10000 THEN 'ORTA'
    ELSE 'GENIS'
    END AS "ARALIQ"
    FROM HR.JOBS;

    Task 5

select first_name, salary,
salary+(salary*nvl(commission_pct, 0)) as AYLIQ_GELIR,
case
    when commission_pct is not null then 'Satici'
    else 'Diger'
    end as NOV
    from hr.employees
    order by AYLIQ_GELIR desc;

task 6

SELECT FIRST_NAME, SALARY,
       CASE 
           WHEN COMMISSION_PCT IS NULL THEN 'Komissiyasiz'
           ELSE 'Komissiyali'
       END AS "Komissiya"
FROM HR.EMPLOYEES;

task 7

SELECT FIRST_NAME, JOB_ID,SALARY,
CASE 
    WHEN JOB_ID LIKE 'AD%' THEN 'Rehberlik'
    WHEN (JOB_ID LIKE '%MAN' OR JOB_ID LIKE '%MGR') AND SALARY > 12000 THEN 'Boyuk menecer'
    WHEN JOB_ID LIKE '%MAN' OR JOB_ID LIKE '%MGR' THEN 'Menecer'
    ELSE 'Isci'
    END AS ROL
FROM HR.EMPLOYEES;

TASK 8

SELECT FIRST_NAME,SALARY, COMMISSION_PCT,
CASE
    WHEN NVL(COMMISSION_PCT, 0) >= 0.3 THEN 'YUKSEK'
    WHEN NVL(COMMISSION_PCT, 0) >= 0.2 THEN 'ORTA'
    ELSE 'ASAGI'
    END AS KOMISSIYA_SEVIYYESI
    FROM HR.EMPLOYEES
    WHERE DEPARTMENT_ID = 80
    ORDER BY KOMISSIYA_SEVIYYESI DESC, SALARY DESC;

TASK 9

SELECT FIRST_NAME,DEPARTMENT_ID,SALARY,
CASE
    WHEN DEPARTMENT_ID IS NULL THEN SALARY
    WHEN DEPARTMENT_ID=80 THEN SALARY + (SALARY*NVL (COMMISSION_PCT, 0))
    WHEN DEPARTMENT_ID=50 AND SALARY > 3000 THEN SALARY *1.15
    WHEN DEPARTMENT_ID=50 THEN SALARY *1.05
    ELSE SALARY*1.03
    END AS YENI_MAAS
FROM HR.EMPLOYEES
ORDER BY YENI_MAAS DESC;

TASK 10

SELECT FIRST_NAME, SALARY, COMMISSION_PCT,
SALARY * 12 + (SALARY * 12 * NVL(COMMISSION_PCT, 0)) AS ILLIK_GELIR,
case
    WHEN SALARY * 12 + (SALARY * 12 * NVL(COMMISSION_PCT, 0))<5000 THEN 'ASAGI'
    WHEN SALARY * 12 + (SALARY * 12 * NVL(COMMISSION_PCT, 0)) BETWEEN 5000 AND 149000 THEN 'ORTA'
    ELSE 'YUKSEK'
    END AS "GELIR_SEVIYYESI"
    FROM HR.EMPLOYEES
    ORDER BY ILLIK_GELIR DESC;