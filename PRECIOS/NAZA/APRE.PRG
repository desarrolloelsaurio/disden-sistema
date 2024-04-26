********************************************************************************
*-- Programa: apre.prg
*-- Fecha   : 09/10/91 02:51pm
*-- Version : G. REINER
*-- Notas   : DERIVA A GESTION DE ACTUALIZACION DE PRECIOS
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	TT=''
	FISC=QWMER(BAR())
	IF FISC#'.F.'
		DO apre1
	ENDIF
else
	=iaudi()
endif
ulpr=PROGRAM()
=MEN_LIN(BOTOM)
RETURN
