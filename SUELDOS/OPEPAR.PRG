****************************************
* ABRE ARCHIVO DE FAMILIA DEL EMPLEADO *
****************************************
@ 24,0 SAY PADC('Abriendo archivo de Familia de Empleados',80,' ') COLO SCHE 19
IF jannro=0
   DO elijan
ENDIF
SELE 14
indice="EM"+LEFT(ptn[jannro],1)+'P'+SUBSTR(ptn[jannro],2,1)+'P'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
IF LEFT(RIGHT(DBF(),12),8)<>INDICE
	USE (PATH+'\'+INDICE) INDEX (PATH+'\'+INDICE) ALIAS EPAR
ENDIF
@ 24,0 SAY SPACE(80)
RETURN
