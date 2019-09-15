
proc sort data=work.poblacion_01 out=work.poblacion_01_s;
	by Entidad_federativa Grupo_quinquenal_de_edad;
run;


proc transpose data=work.poblacion_01_s out=work.poblacion_01_s_t;
	by Entidad_federativa Grupo_quinquenal_de_edad;
run;

data work.poblacion_01_s_t_f(drop=_name_ _label_);
	format poblacion comma15.;
	label 
	year = "Año" 
	poblacion="Población" 
	entidad_federativa="Entidad Federativa"
	Grupo_quinquenal_de_edad = "Grupo quinquenal de edad"
	genero = "Género"
	;
	set work.poblacion_01_s_t(rename=(col1=poblacion));
	year = input(substr(_name_,2,4),4.);
	genero = substr(_name_,7,15);
run;



* Interpola entre los quinquenios;

data test;
	do year = 1990 to 2010;
		output;
	end;
run;

data cat_quin;
	infile datalines dlm="|";
	length i 8 Grupo_quinquenal_de_edad $32;
	input i $ Grupo_quinquenal_de_edad $;
	datalines;
1|0 a 4 años
2|5 a 9 años
3|10 a 14 años
4|15 a 19 años
5|20 a 24 años
6|25 a 29 años
7|30 a 34 años
8|35 a 39 años
9|40 a 44 años
10|45 a 49 años
11|50 a 54 años
12|55 a 59 años
13|60 a 64 años
14|65 a 69 años
15|70 a 74 años
16|75 a 79 años
17|80 a 84 años
18|85 a 89 años
19|90 a 94 años
20|95 a 99 años
21|100 años y más
22|No especificado
23|Total
;
run;

proc sql noprint;
	select put(i,2.)||"="||"'"||trim(Grupo_quinquenal_de_edad)||"'" into :vara separated by " "
	from work.cat_quin
	;
quit;

%put &vara.;

proc format lib=work;
	value quinquenio
	&vara.;
run;

proc sql;
	create table work.catalog as
		select distinct 
		entidad_federativa
		, Grupo_quinquenal_de_edad
		, genero
		from work.poblacion_01_s_t_f
		;
	create table work.catalog_quin as
		select distinct 
		Grupo_quinquenal_de_edad
		from work.poblacion_01_s_t_f
		;
	create table work.poblacion_0 as
		select 
		a.year
		, b.entidad_federativa
		, b.genero
		, b.Grupo_quinquenal_de_edad
		from work.test a left join work.catalog b 
		on (a.year)
		;
	create table work.poblacion_1 as
		select 
		a.year
		, a.entidad_federativa
		, a.genero
		, a.Grupo_quinquenal_de_edad
		, b.poblacion
		, c.i format = quinquenio2.
		from work.poblacion_0 a left join work.poblacion_01_s_t_f b 
		on (a.year = b.year and a.entidad_federativa = b.entidad_federativa and a.genero = b.genero and a.Grupo_quinquenal_de_edad = b.Grupo_quinquenal_de_edad)
		inner join work.cat_quin c on (lowcase(compress(a.Grupo_quinquenal_de_edad)) = lowcase(compress(c.Grupo_quinquenal_de_edad)) )
		;	
quit;

proc sort data=work.poblacion_1 out=work.poblacion_1_s;
	by entidad_federativa genero i year;
run;

proc expand data=work.poblacion_1_s out=work.poblacion_1_i;
	by entidad_federativa genero i;
	id year;
run;


* Meter varias gráficas en una sola (como una infografía);
* Revisa esto http://robslink.com/SAS/democd27/aaaindex.htm;

