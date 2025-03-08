data emp_US emp_AU;
	set cr.employee(keep=EmpID Name JobTitle Salary Department Country TermDate);
	Country=upcase(country);
	if TermDate = .  and Country="US" then output emp_US;
	else output emp_AU;
run;