--Deliverable 1
--Create retirement_titles table
select emp_no, first_name, last_name
from employees

select emp_no, title, from_date, to_date
from titles

select employees.emp_no,
       employees.first_name,
	   employees.last_name,
	   titles.title, 
	   titles.from_date, 
	   titles.to_date	 
into retirement_info
from employees, titles
where (employees.emp_no = titles.emp_no) and (employees.birth_date between '1952-01-01' AND '1955-12-31')
order by employees.emp_no;

select * from retirement_info

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title

INTO unique_titles
FROM retirement_info as rt
ORDER BY emp_no asc, to_date DESC;

select * from unique_titles

--retiring_titles table

select count (unique_titles.emp_no),unique_titles.title
into retiring_titles
FROM unique_titles
GROUP BY title 
ORDER BY COUNT(title) DESC;

select * from retiring_titles

--Deliverable 2
select distinct on (e.emp_no) e.emp_no, 
    e.first_name, 
    e.last_name, 
    e.birth_date,
    de.from_date,
    de.to_date,
    t.title
into mentorship_eligibilty
from employees as e
left outer join dept_emp as de
on (e.emp_no = de.emp_no)
left outer join titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') and (de.to_date = '9999-01-01')
ORDER BY e.emp_no;

select * from mentorship_eligibilty

