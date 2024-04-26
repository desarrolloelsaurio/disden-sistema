********************************************************************************
*-- Programa: ELIPRV.PRG
*-- Fecha   : 03-23-92 12:20pm
*-- Version : G. REINER
*-- Notas   : ELIGE LA PROVINCIA
*-- Modificaci¢n GOYO 05-17-92 00:49am
********************************************************************************
FUNCTION ELIPRV
	PARA MSG,R1,C1
	SELE MIX
	IF PRVPOP
		SET ORDER TO TAG PRVTEX
		IF USED("PRV")
			ACTI POPU PRVPOP
		ELSE
			ACTI POPUP MIXPOP
		ENDIF
		STOR !EMPTY(RESPUESTA) TO respuesta
	ELSE
		RESPUESTA=IIF(USED("PRV"),;
			ELIMIX1('Provincia '+msg,'PRV','PRVCOD'),;
			ELIMIX1('Provincia '+msg,'MIX','PRVCOD'))
	ENDIF
RETURN RESPUESTA
