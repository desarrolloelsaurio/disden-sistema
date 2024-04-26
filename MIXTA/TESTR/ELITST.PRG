********************************************************************************
*-- Programa: ELITST.PRG
*-- Fecha   : 03-23-92 12:20pm
*-- Version : G. REINER
*-- Notas   : ELIGE LA ESTRUCTURA
*-- Modificaci¢n GOYO 05-17-92 00:49am
********************************************************************************
FUNCTION ELITST
	PARA MSG,R1,C1
	SELE MIX
	IF TSTPOP
		SET ORDER TO TAG TSTTEX
		IF USED("TST")
			ACTI POPU TSTPOP
		ELSE
			ACTI POPUP MIXPOP
		ENDIF
		STOR !EMPTY(RESPUESTA) TO respuesta
	ELSE
		RESPUESTA=IIF(USED("TST"),;
			ELIMIX1('Estructura '+msg,'TST','TSTCOD'),;
			ELIMIX1('Estructura '+msg,'MIX','TSTCOD'))
	ENDIF
RETURN RESPUESTA
