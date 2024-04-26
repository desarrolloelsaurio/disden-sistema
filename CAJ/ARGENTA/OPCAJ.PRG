************************************
*-- Programa: OPCAJ.PRG
*-- Fecha   : 01-21-93 04:57pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE CAJA
************************************
PARAMETER SHIT
IF !USED("CAJ")
	=MEN_LIN(ABA+"Caja")
	SELE 17
	USE (PATH+'\CAJA') order tag CAJA ALIAS caj
ENDIF
=MEN_LIN(BOTOM)
RETURN
