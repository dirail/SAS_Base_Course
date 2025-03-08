data income_expenses;
	Wages=12874000;
	Retire=1765000;
	Medical=649000;
	Income=50000000;

	do Year=1 to 10;
		Wages=Wages*1.06;
		Retire=Retire*1.014;
		Medical=Medical *1.095;
		TotalCost=sum(Wages, Retire, Medical);
		output;
	end;
	keep Year TotalCost;
	format TotalCost comma12.;
run;