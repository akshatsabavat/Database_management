-- Assignment 02

-- PART 01
select departments.department_name, AVG(employees.salary) as emp_sal_avg from departments join employees on employees.department_id = departments.department_id group by departments.department_name ORDER BY emp_sal_avg DESC;
select employee_name, COUNT(*) as total_projects FROM employees join employee_project on employees.employee_id = employee_project.employee_id group by employee_name having total_projects > 1;
select employee_name, SUM(employee_project.hours_worked) as total_project_hours FROM employees join employee_project on employees.employee_id = employee_project.employee_id group by employee_name;
select employee_name, position, salary FROM employees where salary = (select max(salary) from employees);
select employees.employee_name, projects.project_name from employees left join employee_project on employees.employee_id = employee_project.employee_id left join projects on employee_project.project_id = projects.project_id order by employees.employee_name, projects.project_id;
