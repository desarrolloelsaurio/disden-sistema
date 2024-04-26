********************************************************************************
*-- Programa: ipret.prg
*-- Fecha   : 09/06/91 03:57pm
*-- Version : G. REINER
*-- Notas   : DERIVA A GESTION DE GENERALIZACION DE PRECIOS
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	TT=''
	FISC=QWMER(BAR())
	IF FISC#'.F.'
		DO ipret1
	ENDIF
ELSE
	=iaudi()
ENDIF
ulpr=PROGRAM()
=MEN_LIN(BOTOM)
RETURN
