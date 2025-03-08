proc sort data=sashelp.shoes out=shoes_sort;
	by Region Subsidiary Product;
run;

proc transpose data=shoes_sort out=shoes_sales;
run;