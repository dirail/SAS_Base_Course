/*This program analyzes population estimates
in the SASHELP.DEMOGRAPHICS table.*/

proc freq data=sashelp.demographics;
	table Region;
run;

proc means data=sashelp.demographics sum mean maxdec=0;
	var Pop;
	class Region;
run; 
