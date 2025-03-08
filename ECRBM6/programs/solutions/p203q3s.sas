data emp_new;
	set cr.employee_new(rename=(HireDate=HireDateC));
	EmpID=substr(EmpID,4);
	HireDate=input(HireDateC, anydtdte.);
	Salary=input(AnnualSalary, dollar10.);
	drop HireDateC;
run;