data holiday2019;
	set sashelp.holiday;
	where end=. and rule=0;
	Country=substr(category,4,2);
	Date=mdy(month, day, 2019);
	keep Desc Country Date;
run;