proc format;
	value statfmt S="Single"
	              M="Married"
	              O="Other";
	value salrange low<50000="Under $50K"
	               50000-100000="50K-100K"
	               100000<high="Over 100K";
run;

proc freq data=cr.employee;
	tables Status;
	tables City*Salary / nopercent nocol;
run;