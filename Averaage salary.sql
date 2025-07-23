-- find employess whose salary is above the average salary for their department 
select employee_id, name, salary, role from employees e  
where 
salary > (
	select avg(salary) from employees
		)