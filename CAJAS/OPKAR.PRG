****************************
*-- Programa: OPKAR.PRG
*-- Fecha   : 06/18/91
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO KARDEX DE MERCADERIAS TERMINADAS
****************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA

PARAMETER SHIT
IF USED("KAR")
	SELE KAR
ELSE
	=MEN_LIN(ABA+"Kardex")
	=PRXAREA(.T.)
	USE (PATHVEN+'\KARDEX') ORDER TAG NUMERO ALIAS KAR
ENDIF
RETURN MEN_LIN(BOTOM)
