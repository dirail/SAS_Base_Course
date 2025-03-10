/* 1. Accessing Data */
libname tsa "&outpath";

proc import datafile="&path/TSAClaims2002_2017.csv" dbms=csv out=tsa.claims 
		replace;
	guessingrows=max;
run;

/* 2. Exploring Data */
proc freq data=tsa.claims;
	tables Claim_Site Disposition Claim_Type Date_Received Incident_Date / nocum;
	format Date_Received Incident_Date year.;
run;

/* 3. Preparing Data */
proc sort data=tsa.claims out=tsa.nodup noduprecs;
	by _all_;
run;

proc sort data=tsa.nodup;
	by incident_date;
run;

data tsa.clean label;
	set tsa.nodup;

	if claim_site in ("" "-") then
		claim_site="Unknown";

	if Disposition in ("" "-") then
		Disposition="Unknown";
	else if Disposition="losed: Contractor Claim" then
		Disposition="Closed:Contractor Claim";
	else if Disposition="Closed: Canceled" then
		Disposition="Closed:Canceled";

	if Claim_Type in ("" "-") then
		Claim_Type="Unknown";
	else if Claim_Type="Passenger Property Loss/Personal Injur" then
		Claim_Type="Passenger Property Loss";
	else if Claim_Type="Passenger Property Loss/Personal Injury" then
		Claim_Type="Passenger Property Loss";
	else if Claim_Type="Property Damage/Personal Injury" then
		Claim_Type="Property Damage";
	State=upcase(State);
	StateName=propcase(StateName);

	if (incident_date=. or date_received=. or year(incident_date) < 2002 or 
		year(incident_date) > 2017 or year(date_received) < 2002 or 
		year(date_received) > 2017 or incident_date > date_received) then
			Date_Issues="Needs Review";
	format close_amount dollar20.2 incident_date date_received date9.;
	label Airport_Code="Airport Code"
	Airport_Name="Airport Name"
	Claim_Number="Claim Number"
	Claim_Site="Claim Site"
	Claim_Type="Claim Type"
	Close_Amount="Close Amount"
	Date_Received="Date Received"
	Incident_Date="Incident Date"
	Item_Category="Item Category";
	drop Country city;
run;

/* 4. Analyzing Data */


/* 4-1. How many date issues are in the overall data? */
title "리뷰가 필요한 데이터";
proc freq data=tsa.clean;
	tables date_issues/nocum;
run;
title;

* data_issues - 4241개 ;

/* 4-2. How many claims per year of Incident_Date are in the overall data? Be sure to include a plot. */
ods graphics on;
title "Overall claims by year";

proc freq data=tsa.clean;
	tables incident_date / nocum plots=freqplot;
	format incident_date year4.;
	where date_issues is missing;
run;

title;

/* 4-3. Lastly, a user should be able to dynamically input a specific state value and answer the following: */
/*	 4-3-a. What are the frequency values for Claim_Type for the selected state? */
/*	 4-3-b. What are the frequency values for Claim_Site for the selected state? */
/*	 4-3-c. What are the frequency values for Disposition for the selected state? */
%let selected_state=California;

title "&selected_state Claim Types, Claim Sites and Disposition";

proc freq data=tsa.clean order=freq;
	tables Claim_Type Claim_Site Disposition / nocum nopercent;
	where statename="&selected_state" and date_issues is missing;
run;
title;

/*	 4-3-d. What is the mean, minimum, maximum, and sum of Close_Amount for the selected state? The statistics should be rounded to the nearest integer. */
title "Close_Amount Statistics for &selected_state";

proc means data=tsa.clean mean min max sum maxdec=0;
	var close_amount;
	where date_issues is null & statename="&selected_state";
run;

title;




/* 5. Exporting Data */

ods pdf file="&outpath/tsaPDF.pdf";
ods noproctitle;

ods proclabel "Date Issues";
title "Needs Review";
proc freq data=tsa.clean;
	tables date_issues/nocum;
run;
title;

ods graphics on;
ods proclabel "Overall Claims by Year";
title "Overall claims by year";
proc freq data=tsa.clean;
	tables incident_date / nocum plots=freqplot;
	format incident_date year4.;
	where date_issues is missing;
run;
title;

%let selected_state=California;

ods proclabel "&selected_state 민원 유형, 장소, 특성";
title "&selected_state Claim Types, Claim Sites and Disposition";
proc freq data=tsa.clean order=freq;
	tables Claim_Type Claim_Site Disposition / nocum nopercent;
	where statename="&selected_state" and date_issues is missing;
run;
title;

ods proclabel "&selected_state 의 Close_Amount 요약 통계량";
title "Close_Amount Statistics for &selected_state";
proc means data=tsa.clean mean min max sum maxdec=0;
	var close_amount;
	where date_issues is null & statename="&selected_state";
run;
title;

ods pdf close;