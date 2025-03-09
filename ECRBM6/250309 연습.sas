options validvarname=7;

libname xl xlsx "&path/employee.xlsx";

PROC CONTENTS data=xl._all_;
run;


proc freq data=cr.orders;
	tables order_type customer_country customer_continent;
run;

proc means data=cr.orders maxdec=0;
	var Quantity Retail_price cost_price;
run;

proc univariate data=cr.orders;
	var Quantity Retail_price cost_price;
run;


%let island=Maui;

proc print data=tourism;
    where Location='&island';
run;

proc print data=sashelp.heart;
	where AgeAtStart in (30 60);
run;

data quiz;
	
	input Name $ Scroe;
	datalines;
Scott 8
Scott 8
Sharlotte 10
Trevor 7
Trevor 6
Trevor 6
Drew 9
;
run;



/*1.07*/
proc freq data=cr.employee_raw order=freq nlevels;
	tables empid country department;
run;

proc print data=cr.employee_raw;
    where TermDate ne . and HireDate>TermDate;
    format salary dollar10. TermDate HireDate BirthDate date9.;
run;


/*1.08*/
proc sort data=cr.employee_raw out=emp_sort noduprecs;
    by _all_;
run;

proc sort data=emp_sort;
by descending salary;
run;

proc univariate data=emp_sort;
    var Salary;
run;
