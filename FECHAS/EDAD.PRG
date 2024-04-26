function edad
parameter fecha2,fecha1
private fecha2,fecha1,salida,salida1
IF PARAMETER()=1 .AND. TYPE("M.FECHA2")="C"
   CLEA
   TEXT
******************************************************************
* AUTOR     : G. REINER
* FECHA     : FEBRERO DE 1992
******************************************************************
* FUNCION   : EDAD
* PARAMETROS: FECHA INICIAL,FECHA FINAL (OPTATIVA, ASUME DATE())
* SALIDA    : PARTE ENTERA =TIEMPO TRANSCURRIDO EN A¥OS
*             PARTE DECIMAL=MESES
******************************************************************
ENDTEXT
M.SALIDA=.T.
ELSE
if parameter()=1
   M.FECHA1=date()
endif
if type("M.FECHA1")='D' .and. type("M.FECHA2")='D'
   M.SALIDA=(M.FECHA1-M.FECHA2)/365.25
   M.SALIDA1=int((M.SALIDA-int(M.SALIDA))*365.25/30)
   M.SALIDA=int(M.SALIDA)+int(M.SALIDA1)/100
else
M.SALIDA=0
endif
ENDIF
return(M.SALIDA)
