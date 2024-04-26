*****************************
* ABRE ARCHIVO DE EMPLEADOS *
*****************************
@ 24,0 SAY PADC('Abriendo archivo de Empleados',80,' ') COLO SCHE 19
IF jannro=0
   DO elijan
ENDIF
SELE 13
indice="EM"+LEFT(ptn[jannro],1)+'P'+SUBSTR(ptn[jannro],2,1)+'L'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
IF LEFT(RIGHT(DBF(),12),8)<>INDICE
   B="LE"+LEFT(ptn[jannro],1)+'G'+SUBSTR(ptn[jannro],2,1)+'A'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
   C="CU"+LEFT(ptn[jannro],1)+'I'+SUBSTR(ptn[jannro],2,1)+'L'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
   USE (PATH+'\'+indice) INDEX ;
   (PATH+'\'+indice),;
   (PATH+'\'+B) ,;
   (PATH+'\'+C) ;   
   ALIAS emp
ENDIF
IF emppop
   DEFI POPU emppop FROM 0,48 PROM FIELD emp.apynom MESS ' Elija el Empleado' SHAD COLOR SCHE 3
   ON SELE POPU emppop DO resp1
ENDIF
@ 24,0 SAY SPACE(80)
RETURN
