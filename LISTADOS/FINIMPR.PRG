********************************************************************************
*-- Programa: finimp.prg
*-- Fecha   : 10-23-91 11:07am
*-- Version : g. reiner
*-- Notas   : fin de IMPRESION
********************************************************************************
FUNCTION FINIMPR
	PARAMETER SHIT
	ON KEY
	ON KEY LABEL shift-f1 DO hlp
	IF GETENV("USERNAME")#"GOYO"
		ON ERROR DO ERROR
	ENDIF
	SET DEVI TO SCRE
	SET CONS ON
	SET PRIN TO
	SET PRINT OFF
	SET PRIN TO LPT1
	SET MESS TO
	_RMARGIN=80
	_WRAP=.F.
	_PCOPIES=1
	=BEEP(3)
RETURN MEN_LIN(BOTOM)
