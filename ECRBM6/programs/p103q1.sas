proc sort data=sashelp.baseball;
	out=baseball_Sort;
	by Team Name;
run;

proc print data=baseball_Sort;
	where Team in "San Francisco", "Los Angeles", "Oakland";
	keep Name Team Salary Cr:;
run;

proc freq data=baseball_Sort descfreq;
	tables Position;
run;

proc means data=baseball_Sort maxdec=0;
	var Salary / sum mean;
run;