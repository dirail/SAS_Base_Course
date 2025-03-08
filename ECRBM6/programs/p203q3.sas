data emp_new;
	set cr.employee_new;
	EmpID=substr(EmpID, 4);
	HireDate=input(HireDate, date9.);
	Salary=input(AnnualSalary, 12.);
run;	
	