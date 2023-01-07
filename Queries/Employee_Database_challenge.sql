--The Number of Retiring Employees
-- select 
-- e.emp_no,
-- e.first_name,
-- e.last_name ,
-- t.title,
-- t.from_date,
-- t.to_date
-- into retirement_titles
-- from employees as e join titles as t on (e.emp_no = t.emp_no)
-- where(e.birth_date between '1952-01-01' and '1955-12-31')
-- order by e.emp_no
-- ;
--select * from retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows and create Unique Titles File
-- SELECT DISTINCT ON (emp_no) emp_no,
-- first_name,
-- last_name,
-- title
-- INTO unique_titles
-- FROM retirement_titles
-- WHERE to_date = '9999-01-01'
-- ORDER BY emp_no, to_date DESC
-- ;
--select * from unique_titles;
-- -- Create File to Count the Number of Employees Retireing for each Title
-- select 
-- count(title) as num_retiring,
-- title
-- into retiring_titles
-- from unique_titles
-- group by title
-- order by count(title) desc
-- ;
-- select * from retiring_titles;

--Create a table of Employees that are Eligible for Mentorship
select distinct on (e.emp_no)
e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
t.title
into mentorship_eligible
from employees as e 
left join dept_employee as de on (e.emp_no = de.emp_no)
left join titles as t on (e.emp_no = t.emp_no)
where de.to_date = '9999-01-01'
and e.birth_date between '1965-01-01' and '1965-12-31'
order by e.emp_no
;
