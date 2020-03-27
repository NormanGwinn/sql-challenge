/*  1.  List the following details of each employee: employee number, last name, first name, gender, and salary.  */
select id employee_number, last_name, first_name, gender, hire_date
from employee
order by id;

/*  2.  List employees who were hired in 1986.  */
select id employee_number, last_name, first_name, gender, hire_date
from employee
where date_part('year', hire_date) = 1986
order by last_name, first_name;

/*  3. List the manager of each department with the following information: 
         department number, department name, the manager's employee number, last name, first name, and start and end employment dates.  */
select d.id department_number, d.name department_name, e.id manager_employee_id, e.last_name, e.first_name, md.from_date start_date_as_manager, e.hire_date
from department d
join manager2department md on d.id = md.department_id and md.to_date = '99990101'
join employee e on md.employee_id = e.id

/*  4. List the department of each employee with the following information: employee number, last name, first name, and department name.  */
select e.id employee_number, e.last_name, e.first_name, d.name department_name
from employee e
join employee2department ed on e.id = ed.employee_id and ed.to_date = '99990101'
join department d on ed.department_id = d.id

/*  5. List all employees whose first name is "Hercules" and last names begin with "B."  */
select last_name, first_name
from employee
where first_name = 'Hercules'
and last_name like 'B%'
order by last_name

/*  6. List all employees in the Sales department, including their employee number, last name, first name, and department name.  */
select e.id employee_number, e.last_name, e.first_name, d.name department_name
from employee e
join employee2department ed on e.id = ed.employee_id and to_date = '99990101'
join department d on ed.department_id = d.id and d.name = 'Sales'
order by last_name, first_name, e.id

/*  7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.  */
select e.id employee_number, e.last_name, e.first_name, d.name department_name
from employee e
join employee2department ed on e.id = ed.employee_id and ed.to_date = '99990101'
join department d on ed.department_id = d.id and d.name in ('Development', 'Sales')
order by last_name, first_name, e.id

/*  8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.  */

/*  All employees, current and former  */
select last_name, count(1) name_count
from employee
group by last_name
order by last_name

/*  Current employees  */
select last_name, count(1) name_count
from employee e
join employee2department ed on e.id = ed.employee_id and ed.to_date = '99990101'
group by last_name
order by last_name

