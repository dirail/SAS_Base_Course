data=CanadaSales;
	set sashelp.prdsale;
	Actual-Predict=Diff;
	where Country=CANADA and Quarter=1;
run;
 
