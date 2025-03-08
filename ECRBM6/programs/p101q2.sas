*This program analyzes population estimates
in the SASHELP.DEMOGRAPHICS table.*/

proc freq data=sashelp.demographics
	table Region;
run;

proc means data=sashelp.demographics sum average maxdec=0;
	var Pop;
	class Region;
run; 

