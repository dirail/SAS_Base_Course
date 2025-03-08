data holiday2019;
	set sashelp.holiday;
	where end=missing and rule=0;
	CountryCode=substr(Category,2,"_");
	Date=dmy(day, month, 2019);
	keep Desc, CountryCode, Date;
run;

