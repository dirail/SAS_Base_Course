data income_expenses;
	Wages=12874000;
	Retire=1765000;
	Medical=649000;
	Income=50000000;

	do until (TotalCost > Income);
		year+1;
		Wages=Wages * 1.06;
		Retire=Retire*1.014;
		Medical=Medical *1.095;
		TotalCost=sum(Wages, Retire, Medical);
		Income=Income *1.01;
		output;
	end;
	keep Year Income TotalCost;
	format Income TotalCost comma12.;
run;