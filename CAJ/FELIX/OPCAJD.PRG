****************************************
*-- PROGRAMA: OPCAJD.PRG
*-- FECHA   : 06/12/91 01:50PM
*-- VERSION : G. REINER
*-- NOTAS   : ABRE ARCHIVO CAJDA DIARIA
****************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA

IF USED("CAJD")
	SELE CAJD
	SET ORDER TO TAG FECHAOP
ELSE
	=MEN_LIN(ABA+'Caja Diaria')
	=PRXAREA(.T.)
	USE (PATHPRO+'\CAJADIA') ORDER TAG FECHAOP ALIAS CAJD
ENDIF
RETURN MEN_LIN(BOTOM)
