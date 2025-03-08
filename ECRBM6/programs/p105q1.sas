title="Baseball Team Statistics";
proc print data=sashelp.baseball;
	by Team;
	var Name Position YrMajor nAtBat nHits nHome;
	sum nAtBat nHits nHome;
run;

