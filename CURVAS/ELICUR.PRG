********************************************************************************
*-- Programa: ELICUR.PRG
*-- Fecha   : 05/26/91 09:26am
*-- Version : G. REINER -
*-- Notas   : ELIGE CURVA DE PRODUCCION
********************************************************************************
FUNCTION elicur
PARA msg,r1,c1
SELE cur
store nul to respuesta
IF curpop
   =men_lin('Curva '+msg)
   SET ORDER TO TAG UNACURVA
	 IF EOF()
			GO TOP
	 ENDIF
   ACTI POPUP curpop REST
   STOR IIF(!EMPTY(respuesta),RECNO(),NUL) TO respuesta
ELSE
   RESPUESTA=ELIMIX1('CURVA '+MSG,'CUR','UNACURVA',10)
ENDIF
SET ORDER TO TAG CURVA
RETURN respuesta
