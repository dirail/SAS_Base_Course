proc sort data=sashelp.shoes out=shoes_sort nodupkey dupout=out;
	by Region Subsidiary Product;
run;

proc transpose data=shoes_sort out=shoes_sales(drop=_name_ _label_);
	var Sales;
	by Region Subsidiary;
	id Product;
run;