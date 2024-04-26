********************************************************************************
*-- Programa: ipret.prg
*-- Fecha   : 09/06/91 03:57pm
*-- Version : G. REINER
*-- Notas   : DERIVA A GESTION DE GENERALIZACION DE PRECIOS
*-- Modificaci¢n GOYO 07-23-92 01:11am marca -> empresa
********************************************************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	TT=""
	FISC=QWMER(BAR())
	IF FISC#'.F.'
		DO IPRET1
	ENDIF
	=IAUD(FISC)
ELSE
	=IAUDI()
ENDIF
=MEN_LIN(BOTOM)
RETURN
