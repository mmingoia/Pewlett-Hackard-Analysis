-- Create Table of Number of Retiring Employees by Title - Deliverable 1
SELECT e.emp_no,
	e.first_name,
    e.last_name,
	titles.title,
	titles.to_date,
	de.from_date,
	s.salary
INTO RetiringByTitle
FROM employees as e
INNER JOIN titles
ON (e.emp_no = titles.emp_no)
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	 AND (de.to_date = '9999-01-01');

SELECT * FROM retiringbytitle;

-- Partition the data to show only most recent title per employee  - Deliverable 1
SELECT emp_no,
	first_name,
    last_name,
	title,
	from_date,
	salary
INTO retiringByTitleNoDups
FROM 
 (SELECT rbt.emp_no,
	rbt.first_name,
    rbt.last_name,
	rbt.title,
	rbt.from_date,
    rbt.salary, ROW_NUMBER() OVER
 (PARTITION BY (emp_no)
 ORDER BY rbt.to_date DESC) rn
 FROM retiringbytitle as rbt
 ) tmp WHERE rn = 1
ORDER BY emp_no;

SELECT * FROM retiringbytitlenodups;

--Create Count with number of titles retiring
SELECT
	COUNT (DISTINCT title)
INTO Titlecount
FROM retiringbytitlenodups;

SELECT * FROM Titlecount;

-- Create Summary Table with count of retiring employees by title
SELECT
	title,
	COUNT (title)
INTO TitleSummary
FROM retiringbytitlenodups
GROUP BY title;

SELECT * FROM TitleSummary;

-- Create Table of potential Mentors - Deliverable 2
SELECT e.emp_no,
	e.first_name,
    e.last_name,
	titles.title,
	de.from_date,
	de.to_date
INTO mentorList
FROM employees as e
INNER JOIN titles
ON (e.emp_no = titles.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
     AND (titles.to_date = '9999-01-01'); 
-- Above code results in duplicates need to remove duplicates

SELECT * FROM mentorlist;

-- Partition the data to show remove duplicates - Deliverable 2
SELECT emp_no,
	first_name,
    last_name,
	title,
	from_date,
	to_date
INTO MentorListNoDups
FROM 
 (SELECT ml.emp_no,
	ml.first_name,
    ml.last_name,
	ml.title,
	ml.from_date,
    ml.to_date, ROW_NUMBER() OVER
 (PARTITION BY (emp_no)
 ORDER BY ml.to_date DESC) rn
 FROM mentorlist as ml
 ) tmp WHERE rn = 1
ORDER BY emp_no;

SELECT * FROM mentorlistnodups;

