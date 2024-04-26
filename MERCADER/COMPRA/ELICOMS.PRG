****************************************
*-- Programa: ELICOMS.PRG
*-- Fecha   : 05/26/91 09:26am
*-- Version : G. REINER -
*-- Notas   : ELIGE COMOS
*-- Modificaci¢n GOYO 05-17-92 00:49am
*-- Modificaci¢n GOYO 08-15-93 02:36am
****************************************
#DEFINE NUL    0                                 && NUL
FUNCTION eliCOMS
	PARA msg,r1,c1
	SELE COMS
	STORE NUL TO RESPUESTA
	IF COMSPOP
		SET ORDER TO TAG COMPRA
		IF EOF()
			GO TOP
		ENDIF
		ACTI POPUP COMSPOP REST
		STOR !EMPTY(RESPUESTA) TO RESPUESTA
	ELSE
		RESPUESTA=ELIMIX1(' P. TERM. '+MSG,'COMS','COMCODPRO',20)
	ENDIF
RETURN RESPUESTA
