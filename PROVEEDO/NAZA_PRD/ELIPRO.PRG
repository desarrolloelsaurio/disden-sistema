********************************************************************************
*-- Programa: ELIPRO.PRG
*-- Fecha   : 06/07/91 11:08am
*-- Version : E. BANALOTTI
*-- Notas   : ELIGE EL PROVEEDOR
*-- Modif.  : GOYO 05-30-92 09:05pm ELIMIX
********************************************************************************
FUNCTION elipro
PARA msg,r1,c1
SELE pro
IF propop
   SET ORDER TO TAG PROVEEDOR
	 IF EOF()
		GO TOP
	 ENDIF
   ACTI POPUP propop REST
   STOR !EMPTY(respuesta) TO respuesta
ELSE
   RESPUESTA=ELIMIX1('PROVEEDOR '+MSG,'PRO','PROCOD',10)
ENDIF
RETURN respuesta
