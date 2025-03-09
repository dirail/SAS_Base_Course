libname cr "&path";

proc contents data=cr._all_ nods;
run;

proc import datafile="&path/payroll.csv" out=payroll dbms=csv replace;
	guessingrows=max;
run;

proc contents data=payroll;
run;

proc print data=payroll;
run;


/*1.05*/  /*v7 형식으로 */
options validvarname=v7;

libname xl xlsx "&path/employee.xlsx";  /* = 들어가지 않는다. */

proc contents data=xl._all_;
run;
