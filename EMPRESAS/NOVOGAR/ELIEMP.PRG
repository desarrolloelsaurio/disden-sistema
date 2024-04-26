********************************************************************************
*-- Programa: ELIEMP.PRG
*-- Fecha   : 06/12/91 03:13pm
*-- Version : G. REINER
*-- Notas   : ELIGE LA EMPRESA
*-- Modif.  : GOYO 05-30-92 08:45pm ELIMIX
*-- Modificaci¢n GOYO 07-22-92 11:37pm marca -> empresa
*-- Modificaci¢n GOYO 07-23-92 10:11am Si es s¢lo una empresa, no elige
********************************************************************************
function eliEMP
	para msg,r1,c1
	sele mix
	set ORDER TO TAG MARTEX
	IF MIX.FILTRO#"*"
	   SET ORDER TO TAG JANTEX
	ENDIF
	if cant_empre#1
		if JANpop
			acti popup mi1pop
			stor iif(!empty(respuesta),recno(),nul) to respuesta
		else
			RESPUESTA=ELIMIX1('MARCA '+MSG,'MIX','MARCOD')
		endif
	else
		go top
		respuesta=mix.nu1
	endif
return respuesta
