/* 1. Accessing Data */
* Hint
** Define the TSA library.
** Set an option to enforce SAS naming conventions for column names.
** Use PROC IMPORT to create a SAS table.
** Use the GUESSINGROWS=MAX statement in the IMPORT procedure.;

/* 2. Exploring Data */
* Tasks
 1. Preview the data.
 2. Explore the following columns and make note of any adjustments 
	you need to make using the information 
	from the Case Study Requirements document;
		* Claim_Site
		* Disposition
		* Claim_Type
		* Date_Received
		* Incident_Date



/* 3. Preparing Data */
* Tasks
 1. Remove duplicate rows.
 2. Sort the data by ascending Incident_Date.
 3. Clean the Claim_Site column.
 4. Clean the Disposition column.
 5. Clean the Claim_Type column.
 6. Convert all State values to uppercase and all StateName values to proper case.
 7. Create a new column named Date_Issues with a value of Needs Review when a row has a date issues as defined in the requirements.
 8. Add permanent labels and formats.
 9. Exclude County and City from the output table.
;




/* 4. Analyzing Data */
/* 4-1. How many date issues are in the overall data? */


/* 4-2. How many claims per year of Incident_Date are in the overall data? Be sure to include a plot. */

/* 4-3. Lastly, a user should be able to dynamically input a specific state value and answer the following: */
/*	 4-3-a. What are the frequency values for Claim_Type for the selected state? */
/*	 4-3-b. What are the frequency values for Claim_Site for the selected state? */
/*	 4-3-c. What are the frequency values for Disposition for the selected state? */


/*	 4-3-d. What is the mean, minimum, maximum, and sum of Close_Amount for the selected state? The statistics should be rounded to the nearest integer. */




/* 5. Exporting Data 
1. Export the end results into a single PDF named ClaimReports with the style of your choice.
2. Customize the procedure labels in your report.
;


