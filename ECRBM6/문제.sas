/* 1.03 
library cr에 데이터 셋 몇개가 있는지 확인하라 
libname.sas 코드 실행하고 할것 */
libname cr "&path";

proc contents data=cr._all_ nods;
run;


/* 1.04 */
/* Read the payroll.csv text file and create a temporary SAS table named payroll. 
Enable SAS to scan all the rows from the text file to determine column attributes in the payroll table.*/
/*Generate a report of the descriptor portion of the payroll table.*/

proc import datafile="&path/payroll.csv" out=payroll dbms=csv replace;
    guessingrows=max;
run;

proc contents data=payroll;
run;

/* 1.05 */
/*Directly read the employee.xlsx file. Ensure that column names follow the recommended SAS naming rules.*/
/*Generate a report of the descriptor portion for each table read from the employee.xlsx file.*/
options validvarname=v7;
libname xl xlsx "&path/employee.xlsx";

proc contents data=xl._all_;
run;

