select * from employees;

select job_id, count(*) Employee from employees group by job_id order by Employee Desc;

select job_id, count(*) Employee from employees group by job_id 
having count(*) > 2
order by Employee Desc;


/* how to find whcih job id has most employee */
select job_id, employee from (select job_id, count(*) Employee from employees group by job_id)
where employee = (select max(employee) from (select job_id, count(*) Employee from employees group by job_id)) ;

-- find max salary
select  max(salary) from employees;
select first_name, salary from employees where salary = (select max(salary) from employees);