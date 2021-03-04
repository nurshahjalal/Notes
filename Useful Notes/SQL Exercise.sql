-- SQL Exercise

--Which Department make more than avg salary department wise.

select department_name,TotalSalary from (Select department_name, sum(salary) TotalSalary from employees e, departments d 
where e.department_id = d.department_id group by department_name)
where  TotalSalary >(select Avg(TotalSalary) from (Select department_name, sum(salary) TotalSalary from employees e, departments d 
where e.department_id = d.department_id 
group by department_name));


--Find Employee name and their region:

select e.first_name, e.last_name , r.region_name from employees e, regions r,departments d, locations l,countries cn
where e.department_id = d.department_id and d.location_id=l.location_id and l.country_id= cn.country_id and cn.region_id= r.region_id
order by r.region_name ;

--Find Employee name who are in the Americas region:

select first_name, last_name , region_name from
(select e.first_name, e.last_name , r.region_name from employees e, regions r,departments d, locations l,countries cn
where e.department_id = d.department_id and d.location_id=l.location_id and l.country_id= cn.country_id and cn.region_id= r.region_id
order by r.region_name )
where region_name='Americas';

--Find how many employee in the Americas region:

select count(first_name)from
(select e.first_name, e.last_name , r.region_name from employees e, regions r,departments d, locations l,countries cn
where e.department_id = d.department_id and d.location_id=l.location_id and l.country_id= cn.country_id and cn.region_id= r.region_id
order by r.region_name )
where region_name='Americas';

--Find which Region has most employees: