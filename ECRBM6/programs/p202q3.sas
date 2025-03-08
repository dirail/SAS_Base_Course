proc sort data=cr.employee_current out=emp_sort;
	by Department;
run;

data dept_salary;
	set emp_sort;
	by Department;
	if first.Department then do;
		TotalDeptSalary=0;
		LowSalaryJob=JobTitle;
	end;
	TotalDeptSalary+Salary;
	if last.department then do;
		HighSalaryJob=JobTitle;
	end;
	keep Department TotalDeptSalary HighSalaryJob LowSalaryJob;
	format TotalDeptSalary dollar12.;
run;