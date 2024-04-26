************************************************
*-- Programa: OPHRE.PRG
*-- Fecha   : 01/29/92
*-- Version : V.LEEGSTRA
*-- Notas   : ABRE ARCHIVO HISTORICO DE REMESAS
************************************************
IF USED("HRE")
	SELE HRE
ELSE
	=MEN_LIN(ABA+'Hist¢rico de Remesas')
	SELE 10
	USE (PATH+'\HREMESA') order tag hremesa  ALIAS HRE
ENDIF
=MEN_LIN(BOTOM)
RETURN
