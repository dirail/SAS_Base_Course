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


/*1.05*/  /*v7 �������� */
options validvarname=v7;

libname xl xlsx "&path/employee.xlsx";  /* = ���� �ʴ´�. */

proc contents data=xl._all_;
run;
