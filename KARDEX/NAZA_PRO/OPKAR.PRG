************************************
*-- Programa: OPKAR.PRG
*-- Fecha   : 06/18/91
*-- Version : V.LEEGSTRA
*-- Notas   : ABRE ARCHIVO KARDEX
*-- Modificaci¢n GOYO 03/08/92
************************************
PARAMETER SHIT
IF USED("KAR")
	SELE KAR
ELSE
	=MEN_LIN(ABA+"Kardex")
	SELE 18
	USE (PATH+'\KARDEX') ORDER TAG ARTICULO ALIAS KAR
ENDIF
RETURN MEN_LIN(BOTOM)
