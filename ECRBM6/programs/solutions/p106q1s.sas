ods graphics on;
ods noproctitle;

ods excel file="s:/workshop/output/heart.xlsx";
title "Distribution of Patient Status";
proc freq data=sashelp.heart order=freq;
    tables DeathCause Chol_Status BP_Status / nocum plots=freqplot;
run;

title "Summary of Measures for Patients";
proc means data=sashelp.heart mean;
    var AgeAtDeath Cholesterol Weight Smoking;
    class Sex;
run;
ods excel close;
