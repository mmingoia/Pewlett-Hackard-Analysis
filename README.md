# Pewlett-Hackard-Analysis

UTDA Module 07

## Challenge Work

Delivering Results

1. A README.md in the form of a technical report that details your analysis and findings.
2. Technical Analysis Deliverable 1: Number of Retiring Employees by Title. You will create three new tables, one showing number of "titles" retiring, one showing number of employees with each title, and one showing a list of current employees born between Jan. 1, 1952 and Dec. 31, 1955. New tables are exported as CSVs. ----RetiringbyTitle.csv and retiringByTitleNoDups.csv
3. Technical Analysis Deliverable 2: Mentorship Eligibility. A table containing employees who are eligible for the mentorship program You will submit your table and the CSV containing the data (and the CSV containing the data)

## Technical Report

In your first paragraph, introduce the problem that you were using data to solve.

In your second paragraph, summarize the steps that you took to solve the problem, as well as the challenges that you encountered along the way. This is an excellent spot to provide examples and descriptions of the code that you used.

for deliverable 1 used partition, created 1 table with all the data then partitioned it.  Added the "to_date" from titles in order to partition down to the most recent title. (33,118 near retirement)

![ERD](EmployeeDB.png)

In your final paragraph, share the results of your analysis and discuss the data that you’ve generated. Have you identified any limitations to the analysis? What next steps would you recommend?
