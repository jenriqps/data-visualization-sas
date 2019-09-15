/* --------------------------------------------------------------------

Code generated by SAS Studio.

Source File: C:\Users\smxjep\OneDrive - SAS\Experimentos\Poblacion_01.csv 

Output Data: GIF.Poblacion_01

----------------------------------------------------------------------- */


proc datasets lib=work kill nolist;
run;


DATA work.Poblacion_01;
    LENGTH 
        Entidad_federativa        $ 31
        Grupo_quinquenal_de_edad        $ 15
        _1990_Total          8
        _1990_Hombres          8
        _1990_Mujeres          8
        _1995_Total          8
        _1995_Hombres          8
        _1995_Mujeres          8
        _2000_Total          8
        _2000_Hombres          8
        _2000_Mujeres          8
        _2005_Total          8
        _2005_Hombres          8
        _2005_Mujeres          8
        _2010_Total          8
        _2010_Hombres          8
        _2010_Mujeres          8;
   LABEL 
        Entidad_federativa = "'Entidad federativa'n"
        Grupo_quinquenal_de_edad = "'Grupo quinquenal de edad'n"
        _1990_Total = "'1990 Total'n"
        _1990_Hombres = "'1990 Hombres'n"
        _1990_Mujeres = "'1990 Mujeres'n"
        _1995_Total = "'1995 Total'n"
        _1995_Hombres = "'1995 Hombres'n"
        _1995_Mujeres = "'1995 Mujeres'n"
        _2000_Total = "'2000 Total'n"
        _2000_Hombres = "'2000 Hombres'n"
        _2000_Mujeres = "'2000 Mujeres'n"
        _2005_Total = "'2005 Total'n"
        _2005_Hombres = "'2005 Hombres'n"
        _2005_Mujeres = "'2005 Mujeres'n"
        _2010_Total = "'2010 Total'n"
        _2010_Hombres = "'2010 Hombres'n"
        _2010_Mujeres = "'2010 Mujeres'n";
   FORMAT 
        Entidad_federativa        $CHAR31.
        Grupo_quinquenal_de_edad        $CHAR15.
        _1990_Total        BEST8.
        _1990_Hombres        BEST8.
        _1990_Mujeres        BEST8.
        _1995_Total        BEST8.
        _1995_Hombres        BEST8.
        _1995_Mujeres        BEST8.
        _2000_Total        BEST8.
        _2000_Hombres        BEST8.
        _2000_Mujeres        BEST8.
        _2005_Total        BEST9.
        _2005_Hombres        BEST8.
        _2005_Mujeres        BEST8.
        _2010_Total        BEST9.
        _2010_Hombres        BEST8.
        _2010_Mujeres        BEST8.;
   INFORMAT 
        Entidad_federativa        $CHAR31.
        Grupo_quinquenal_de_edad        $CHAR15.
        _1990_Total        BEST8.
        _1990_Hombres        BEST8.
        _1990_Mujeres        BEST8.
        _1995_Total        BEST8.
        _1995_Hombres        BEST8.
        _1995_Mujeres        BEST8.
        _2000_Total        BEST8.
        _2000_Hombres        BEST8.
        _2000_Mujeres        BEST8.
        _2005_Total        BEST9.
        _2005_Hombres        BEST8.
        _2005_Mujeres        BEST8.
        _2010_Total        BEST9.
        _2010_Hombres        BEST8.
        _2010_Mujeres        BEST8.;
  INFILE 'C:\Users\jenri\Google Drive\Cosas del trabajo\SAS\SASUniversityEdition\myfolders\experimental\data-visualization-sas\gif1\Poblacion_01.csv'
      LRECL=32767 
      FIRSTOBS=2 
      ENCODING="wlatin1" 
      DLM='09'x 
      MISSOVER 
      DSD ; 
  INPUT 
        Entidad_federativa                  : $CHAR31.
        Grupo_quinquenal_de_edad                  : $CHAR15.
        _1990_Total                  : ?? BEST8.
        _1990_Hombres                  : ?? BEST8.
        _1990_Mujeres                  : ?? BEST8.
        _1995_Total                  : ?? BEST8.
        _1995_Hombres                  : ?? BEST8.
        _1995_Mujeres                  : ?? BEST8.
        _2000_Total                  : ?? BEST8.
        _2000_Hombres                  : ?? BEST8.
        _2000_Mujeres                  : ?? BEST8.
        _2005_Total                  : ?? BEST9.
        _2005_Hombres                  : ?? BEST8.
        _2005_Mujeres                  : ?? BEST8.
        _2010_Total                  : ?? BEST9.
        _2010_Hombres                  : ?? BEST8.
        _2010_Mujeres                  : ?? BEST8.;
RUN;