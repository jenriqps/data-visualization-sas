
%macro gif(genero=);

	%let name=anmpop;
	filename odsout "C:\Users\jenri\Google Drive\Cosas del trabajo\SAS\SASUniversityEdition\myfolders\experimental\data-visualization-sas\gif1";
	
	ods graphics / reset width=10in height=7in imagemap noborder;
	

	proc sort data=work.poblacion_1_i(where=(i not in (22,23) and genero ne "Total" and entidad_federativa ne "Estados Unidos Mexicanos" and compress(genero) = "&genero.")) out=_BarChartTaskData;
		by year genero entidad_federativa i  ;
	run;
	
	options dev=sasprtc printerpath=gif animduration=.9 animloop=0 animoverlay=no animate=start center;
	
	ods listing close;
	ods html path=odsout body="&name..htm"
	 (title="Población de México por Entidad Federativa (SAS/Graph gif animation)") style=htmlblue;
	
	goptions gunit=pct ftitle="albany amt/bold" ftext="albany amt" htitle=1 htext=1;
	goptions ctext=gray33;
	
	footnote1 
	 j=l 'Fuente: INEGI, Censos/Conteos 1990, 1995, 2000, 2005 y 2010. Los años intermedios se calcularon con splines cúbicos. '
	 j=l 'Consultar https://www.inegi.org.mx/app/tabulados/pxweb/.';
	
	
	title1 ls=1 "Población de México por Entidad Federativa, Año #byval(year) (#byval(genero))"; 
	
	options nobyline;
	
	proc sgplot data=_BarChartTaskData;
		styleattrs backcolor=whitesmoke wallcolor=aliceblue;
		by year genero;
		vbar entidad_federativa /response=poblacion group= Grupo_quinquenal_de_edad  groupdisplay=stack grouporder=data dataskin=none categoryorder=respdesc datalabel;
		yaxis grid max=9500000 minorgrid valuesformat=comma16. label="Habitantes" minorcount=9;
		xaxis grid;
	run;
	
	
	ods graphics / reset;
	
	/*
	proc datasets library=WORK noprint;
		delete _BarChartTaskData;
	run;
	*/
	
	quit;
	ods html close;
	ods listing;

%mend;

%gif(genero=Hombres);
*%gif(genero=Mujeres);
