\c postgres;

/*  The "drop database" command typically failed, because I was connected using other tools,
 so I commented this logic.  */
--drop database hr_data_recovery;
--create database hr_data_recovery;

\c hr_data_recovery;

TRUNCATE TABLE employee2department, manager2department, title, salary, employee, department, stage_dept_manager;

--\i ERD.sql

\cd ../data

\copy department from 'departments.csv' delimiter ',' csv header;
\copy employee from 'employees.csv' delimiter ',' csv header;
\copy employee2department from 'dept_emp.csv' delimiter ',' csv header;
\copy stage_dept_manager from 'dept_manager.csv' delimiter ',' csv header;
\copy salary from 'salaries.csv' delimiter ',' csv header;
\copy title from 'titles.csv' delimiter ',' csv header;

insert into manager2department
select employee_id, dept_id, from_date, to_date
from stage_dept_manager